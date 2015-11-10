% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ohsumed.R
\name{ohsumed}
\alias{ohsumed}
\title{Dataset generated from a subset of the Medline database}
\format{An mldr object with 13929 instances, 1002 attributes and 23 labels}
\source{
Joachims, Thorsten, "Text Categorization with Suport Vector Machines: Learning with Many Relevant Features", in Proc. 10th European Conference on Machine Learning, pp. 137-142, 1998
}
\usage{
ohsumed()
}
\description{
Multilabel dataset from the text domain.
}
\examples{
toBibtex(ohsumed)
ohsumed$measures
}
