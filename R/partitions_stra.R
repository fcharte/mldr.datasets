#' Partition an mldr object into k folds
#' @description This method partitions the given dataset into k folds using a stratified strategy, providing training and test partitions for each fold.
#'
#' Implementation of the algorithm defined in:
#'   Charte, F., Rivera, A., del Jesus, M. J., & Herrera, F. (2016, April). On the
#'   impact of dataset complexity and sampling strategy in multilabel classifiers
#'   performance. In International Conference on Hybrid Artificial Intelligence
#'   Systems (pp. 500-511). Springer, Cham.
#' @param mld The \code{mldr} object to be partitioned
#' @param k The number of folds to be generated. By default is 5
#' @param seed The seed to initialize the random number generator. By default is 10. Change it if you want to obtain partitions containing
#' different samples, for instance to use a 2x5 fcv strategy
#' @param get.indices A logical value indicating whether to return lists of indices or lists of \code{"mldr"} objects
#' @return An \code{mldr.folds} object. This is a list containing k elements, one for each fold. Each element is made up
#' of two mldr objects, called \code{train} and \code{test}
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' library(mldr)
#' folds.emotions <- stratified.kfolds(emotions)
#' summary(folds.emotions[[1]]$train)
#' summary(folds.emotions[[1]]$test)
#'}
#' @export
stratified.kfolds <- function(mld, k = 5, seed = 10, get.indices = FALSE) {
}

#' Hold-out partitioning of an mldr object
#' @description Stratified partitioning
#'
#' Implementation of the algorithm defined in:
#'   Charte, F., Rivera, A., del Jesus, M. J., & Herrera, F. (2016, April). On the
#'   impact of dataset complexity and sampling strategy in multilabel classifiers
#'   performance. In International Conference on Hybrid Artificial Intelligence
#'   Systems (pp. 500-511). Springer, Cham.
#' @param mld The \code{mldr} object to be partitioned
#' @param p The percentage of instances to be selected for the training partition
#' @param seed The seed to initialize the random number generator. By default is 10. Change it if you want to obtain partitions containing
#' different samples, for instance to use a 2x5 fcv strategy
#' @param get.indices A logical value indicating whether to return lists of indices or lists of \code{"mldr"} objects
#' @return An \code{mldr.folds} object. This is a list containing k elements, one for each fold. Each element is made up
#' of two mldr objects, called \code{train} and \code{test}
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' library(mldr)
#' parts.emotions <- stratified.holdout(emotions, p = 70)
#' summary(parts.emotions$train)
#' summary(parts.emotions$test)
#'}
#' @export
stratified.holdout <- function(mld, p = 60, seed = 10, get.indices = FALSE) {
  stratified.partitions(mld, is.cv = FALSE, r = to.internal.holdout(p), seed, get.indices)
}

#' Generic partitioning of an mldr object
#' @description Stratified partitioning
#'
#' Generalization of the algorithm defined in:
#'   Charte, F., Rivera, A., del Jesus, M. J., & Herrera, F. (2016, April). On the
#'   impact of dataset complexity and sampling strategy in multilabel classifiers
#'   performance. In International Conference on Hybrid Artificial Intelligence
#'   Systems (pp. 500-511). Springer, Cham.
#' @param mld The \code{mldr} object to be partitioned
#' @param r A vector of percentages of instances to be selected for each partition
#' @param seed The seed to initialize the random number generator. By default is 10. Change it if you want to obtain partitions containing
#' different samples, for instance to use a 2x5 fcv strategy
#' @param get.indices A logical value indicating whether to return lists of indices or lists of \code{"mldr"} objects
#' @return An \code{mldr.folds} object. This is a list containing k elements, one for each fold. Each element is made up
#' of two mldr objects, called \code{train} and \code{test}
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' library(mldr)
#' parts.emotions <- stratified.partitions(emotions, r = c(35, 25, 40))
#' summary(parts.emotions[[2]])
#'}
#' @export
stratified.partitions <- function(mld, is.cv = FALSE, r, seed = 10, get.indices = FALSE) {
  nrows <- internal.partitions.preamble(mld, is.cv, r, seed, get.indices)

  k <- length(r)

  excmeasures <- (mld$measures$num.attributes+1):length(mld$dataset)
  labels <- mld$labels$index

  dataset <- mld$dataset[ , -excmeasures]

  # calculate weight for each instance
  weight <- apply(dataset[,labels], 1, function(row) {
    val <- Reduce(`*`, mld$labels$freq[row == 1])
    if(is.null(val)) 0 else val
  })

  # sort instances according to their weight
  dataset <- dataset[order(weight), ]

  # generate as many strata as partitions needed (all strata
  # have same proportion of samples)
  strata <- lapply(1:k, function(strat)
    # randomize the stratum
    sample(
      (round(nrows / k * (strat - 1)) + 1):round(nrows / k * strat)
    )
  )

  steps <- lapply(1:length(strata), function(si) {
    n <- length(strata[[si]])

    if (is.cv)
      # step from 1 to n maintaining the same proportion of instances in each fold
      c(sapply(1:k, function(fold) round(n/k * (fold - 1) + 1)), n)
    else
      # sum(r[1:part]) accumulates the percentage of samples in order to mark each step
      c(1, sapply(1:k, function(part) if (part < k) round(sum(r[1:part]) * n / 100) else n))
  })

  # generate partitions, each drawing its desired
  # proportion of samples from each stratum
  partitions <- lapply(1:k, function(i)
    unlist(lapply(1:length(strata), function(si)
      strata[[si]][steps[[si]][i]:steps[[si]][i+1]]
    ))
  )

  (if (get.indices) indices.from.kfolds else mldr.from.kfolds)(mld, partitions, is.cv)
}
