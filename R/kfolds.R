#' Partitions an mldr object into k folds
#' @description This method randomly partitions the given dataset into k folds, provinding training and test partitions for each fold.
#' @param mld The \code{mldr} object to be partitioned
#' @param k The number of folds to be generated. By default is 5
#' @param seed The seed to initialize the random number generator. By default is 10. Change it if you want to obtain partitions containing
#' different samples, for instance to use a 2x5 fcv strategy
#' @return An \code{mldr.folds} object. This is a list containing k elements, one for each fold. Each element is made up
#' of two mldr objects, called \code{train} and \code{test}
#'  @examples
#'\dontrun{
#' library(mldr.datasets)
#' library(mldr)
#' folds.emotions <- random.kfolds(emotions)
#' summary(folds.emotions[[1]]$train)
#' summary(folds.emotions[[1]]$test)
#' }
#' @export
random.kfolds <- function(mld, k = 5, seed = 10) {
  if (class(mld) != 'mldr')
    stop(paste(substitute(mld), "isn't an mldr object"))

  if (!isNamespaceLoaded("mldr"))
    stop('The mldr package must be loaded to run this function')

  set.seed(seed)
  excmeasures <- (mld$measures$num.attributes+1):length(mld$dataset)
  nrows <- mld$measures$num.instances
  labels <- mld$labels$index
  dataset <- mld$dataset[sample(nrows), -excmeasures]
  folds <- lapply(1:k, function(fold) (round(nrows/k*(fold-1))+1):round(nrows/k*fold))

  folds <- lapply(folds, function(fold) list(
    train = mldr_from_dataframe(dataset[-fold,], labels, mld$name),
    test = mldr_from_dataframe(dataset[fold,], labels, mld$name)))

  class(folds) <- "mldr.folds"
  folds
}

