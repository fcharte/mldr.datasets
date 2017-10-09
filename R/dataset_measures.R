#
# Some measures about the structure of the data
#

#' @title Calculate the sparsity level of the dataset
#' @description This function calculates the ratio of zero-valued elements over the total of
#' elements. It is useful to decide whether to export in a dense or sparse format.
#' @param mld An \code{"mldr"} object
#' @examples
#' sparsity.level(emotions)
#' @export
sparsity.level <- function(mld) {
  sum(mld$dataset == 0) / prod(dim(mld$dataset))
}

#' @title Calculate the density level of the dataset
#' @description This function calculates the ratio of nonzero-valued elements over the total
#' of elements.
#' @param mld An \code{"mldr"} object
#' @examples
#' density.level(emotions)
#' @export
density.level <- function(mld) {
  1 - sparsity.level(mld)
}
