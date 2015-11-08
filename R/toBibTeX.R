#' Returns the BibTeX entry associated to the mldr object given as input
#' @description Gets the content of the \code{bibtex} member of the \code{mldr} object and returns it
#' @param mldr The mldr object whose BibTeX entry is needed
#' @return A string with the BibTeX entry
#' @examples
#' library(mldr.datasets)
#' cat(toBibtex(emotions))
#' @export
toBibtex.mldr <- function(mld) {
  mld$bibtex
}
