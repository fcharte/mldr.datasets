#' Partition an mldr object into k folds
#' @description This method partitions the given dataset into k folds using a stratified strategy, providing training and test partitions for each fold.
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
  nrows <- internal.kfolds.preamble(mld, k, seed, get.indices)

  excmeasures <- (mld$measures$num.attributes+1):length(mld$dataset)
  labels <- mld$labels$index

  dataset <- mld$dataset[ , -excmeasures]
  weight <- apply(dataset[,labels], 1, function(row) {
    val <- Reduce(`*`, mld$labels$freq[row == 1])
    if(is.null(val)) 0 else val
  })
  dataset <- dataset[order(weight), ]
  strats <- lapply(1:k, function(strat)
    sample((round(nrows/k*(strat-1))+1):round(nrows/k*strat)))
  folds <- lapply(1:k, function(fold)
    unlist(sapply(strats, function(strat)
      strat[(round(length(strats[strat])/k*(fold-1))+1):round(length(strats[strat])/k*fold)])))

  (if (get.indices) indices.from.kfolds else mldr.from.kfolds)(mld, folds)
}
