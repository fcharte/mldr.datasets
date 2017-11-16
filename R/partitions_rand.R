#' Partition an mldr object into k folds
#' @description This method randomly partitions the given dataset into k folds, providing training and test partitions for each fold.
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
#' folds.emotions <- random.kfolds(emotions)
#' summary(folds.emotions[[1]]$train)
#' summary(folds.emotions[[1]]$test)
#'}
#' @export
random.kfolds <- function(mld, k = 5, seed = 10, get.indices = FALSE) {
  random.partitions(mld, is.cv = TRUE, r = to.internal.kfolds(k), seed, get.indices)
}

#' Hold-out partitioning of an mldr object
#' @description Random partitioning
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
#' parts.emotions <- random.holdout(emotions, p = 70)
#' summary(parts.emotions$train)
#' summary(parts.emotions$test)
#'}
#' @export
random.holdout <- function(mld, p = 60, seed = 10, get.indices = FALSE) {
  random.partitions(mld, is.cv = FALSE, r = to.internal.holdout(p), seed, get.indices)
}

#' Generic partitioning of an mldr object
#' @description Random partitioning
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
#' parts.emotions <- random.partitions(emotions, r = c(35, 25, 40))
#' summary(parts.emotions[[2]])
#'}
#' @export
random.partitions <- function(mld, is.cv = FALSE, r, seed = 10, get.indices = FALSE) {
  nrows <- internal.partitions.preamble(mld, is.cv, r, seed, get.indices)

  k <- length(r)

  steps <- if (is.cv)
    # step from 1 to nrows maintaining the same proportion of instances in each fold
    c(sapply(1:k, function(fold) round(nrows/k * (fold - 1) + 1)), nrows)
  else
    # sum(r[1:part]) accumulates the percentage of samples in order to mark each step
    c(1, sapply(1:k, function(part) if (part < k) round(sum(r[1:part]) * nrows / 100) else nrows))

  randomized <- sample(nrows)
  folds <- lapply(1:(length(steps) - 1),
                  function(i) randomized[steps[i]:steps[i+1]])

  (if (get.indices) indices.from.kfolds else mldr.from.kfolds)(mld, folds, is.cv)
}
