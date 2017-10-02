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
  nrows <- internal.kfolds.preamble(mld, k, seed, get.indices)

  randomized <- sample(nrows)
  folds <- lapply(1:k,
                  function(fold) randomized[(round(nrows/k*(fold-1))+1):round(nrows/k*fold)])

  (if (get.indices) indices.from.kfolds else mldr.from.kfolds)(mld, folds)
}
