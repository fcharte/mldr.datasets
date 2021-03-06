% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/toBibTeX.R
\name{toBibtex.mldr}
\alias{toBibtex.mldr}
\title{BibTeX entry associated to an mldr object}
\usage{
\method{toBibtex}{mldr}(object, ...)
}
\arguments{
\item{object}{The mldr object whose BibTeX entry is needed}

\item{...}{Additional parameters from the generic toBibtex function not used by toBibtex.mldr}
}
\value{
A string with the BibTeX entry
}
\description{
Gets the content of the \code{bibtex} member of the \code{mldr} object and returns it
}
\examples{
\dontrun{
library(mldr.datasets)
cat(toBibtex(emotions))
}
}
