#'  List  with 10 folds of the test data from the EUR-Lex directory codes dataset
#'
#' @description Multilabel dataset from the text domain.
#' @format An mldr object with 1935 instances, 5000 attributes and 412 labels
#' @source Mencia, E. L. and Furnkranz, J., "Efficient pairwise multilabel classification for large-scale problems in the legal domain", Machine Learning and Knowledge Discovery in Databases, pp. 50--65, 2008
#' @examples
#' toBibtex(eurlexdc_test)
#' eurlexdc_test$measures
#' @export
eurlexdc_test <- function() check_n_load.mldr('eurlexdc_test')
