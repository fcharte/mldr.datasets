#' Partition an mldr object into k folds
#' @description Iterative stratification
#'
#' Implemented from the algorithm explained in:
#'   Konstantinos Sechidis, Grigorios Tsoumakas, and Ioannis Vlahavas. 2011.
#'   On the stratification of multi-label data. In Proceedings of the 2011
#'   European conference on Machine learning and knowledge discovery in
#'   databases - Volume Part III (ECML PKDD'11), Dimitrios Gunopulos,
#'   Thomas Hofmann, Donato Malerba, and Michalis Vazirgiannis (Eds.), Vol.
#'   Part III. Springer-Verlag, Berlin, Heidelberg, 145-158.
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
#' folds.emotions <- iterative.stratification.kfolds(emotions)
#' summary(folds.emotions[[1]]$train)
#' summary(folds.emotions[[1]]$test)
#'}
#' @export
iterative.stratification.kfolds <- function(mld, k = 5, seed = 10, get.indices = FALSE) {
  nrows <- internal.kfolds.preamble(mld, k, seed, get.indices)

  r = rep(1. / k, k)
  desired_instances <- mld$measures$num.instances * r

  # matrix: each row is a subset, each column corresponds to a label
  desired_by_label <-
    sapply(sapply(mld$labels$index, function(l)
      sum(mld$dataset[, l])), function(amount)
        amount * r)

  remaining_instances <- nrows
  available <- rep(T, remaining_instances)
  remaining_by_label <- sapply(mld$labels$index, function(l) sum(mld$dataset[, l]))

  # a list with k empty vectors
  subsets <- rep(list(c()), k)

  while (remaining_instances > 0) {
    # find the label with the fewest (but at least one) remaining examples,
    # breaking ties randomly
    possible_labels <- which(remaining_by_label > 0)
    chosen_label <- possible_labels[arg.min(remaining_by_label[possible_labels])]
    chosen_index <- mld$labels$index[chosen_label]

    # there is at least one instance here
    instances <- which(mld$dataset[[chosen_index]] & available)
    for (instance in instances) {
      # subsets with largest number of desired examples for this label
      possible <- which(desired_by_label[, chosen_label] == max(desired_by_label[, chosen_label]))
      # break ties by considering largest overall number of desired examples
      chosen_subset <- possible[arg.max(desired_instances[possible])]

      # put instance in subset and update counters
      subsets[[chosen_subset]] <- c(subsets[[chosen_subset]], instance)

      available[instance] <- F
      remaining_instances <- remaining_instances - 1
      desired_instances[chosen_subset] <- desired_instances[chosen_subset] - 1

      active_labels <- as.logical(mld$dataset[instance, mld$labels$index])
      desired_by_label[chosen_subset, active_labels] <-
        desired_by_label[chosen_subset, active_labels] - 1
      remaining_by_label[active_labels] <- remaining_by_label[active_labels] - 1
    }
  }

  (if (get.indices) indices.from.kfolds else mldr.from.kfolds)(mld, subsets)
}
