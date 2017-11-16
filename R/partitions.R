# kfolds: utility functions for partitioning functions

to.internal.kfolds <- function(k) {
  rep(100 / k, k)
}

to.internal.holdout <- function(p) {
  c(p, 100 - p)
}

# checks parameters, sets the random seed and return the number of rows of an mld
internal.partitions.preamble <- function(mld, is.cv, r, seed, get.indices) {
  if (class(mld) != 'mldr')
    stop(paste(substitute(mld), "isn't an mldr object"))
#
#   if(!k > 1)
#     stop('k > 1 required')

  if (!(get.indices || requireNamespace("mldr", quietly = TRUE)))
    stop('The mldr package must be installed in order to run this function')

  set.seed(seed)

  mld$measures$num.instances
}

# builds "mldr" objects out of a list of folds
mldr.from.kfolds <- function(mld, folds, is.cv) {
  folds <- if (is.cv) {
    lapply(folds, function(fold) list(
      train = mldr::mldr_from_dataframe(mld$dataset[-fold,], labelIndices = mld$labels$index, attributes = mld$attributes, name = mld$name),
      test = mldr::mldr_from_dataframe(mld$dataset[fold,], labelIndices = mld$labels$index, attributes = mld$attributes, name = mld$name)))
  } else {
    lapply(folds, function(fold)
      mldr::mldr_from_dataframe(mld$dataset[fold,], labelIndices = mld$labels$index, attributes = mld$attributes, name = mld$name)
    )
  }

  if (!is.cv && length(folds) == 2)
    names(folds) <- c("train", "test")

  class(folds) <- "mldr.folds"
  folds
}

# builds train and test index lists out of a list of folds
indices.from.kfolds <- function(mld, folds, is.cv) {
  numRows <- dim(mld$dataset)[1]

  if (is.cv) {
    lapply(folds, function(fold)
      list(train = (1:numRows)[-fold],
           test = fold))
  } else {
    if (length(folds) == 2)
      names(folds) <- c("train", "test")

    folds
  }
}

# returns the arg f of a vector, breaking ties randomly
# f must return an index of the vector (like which.min or which.max)
arg.f <- function(x, f) {
  randomized_indices <- sample(1:length(x))
  randomized_indices[f(x[randomized_indices])]
}

arg.min <- function(x) arg.f(x, which.min)
arg.max <- function(x) arg.f(x, which.max)
