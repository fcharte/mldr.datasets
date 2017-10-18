RDS_CSV <- "https://fcharte.github.io/mldr.datasets/datasets_rds.csv"

#' @title Get a multilabel dataset by name
#' @description \code{get.mldr} obtains a multilabel dataset, either by finding it in the download directory or downloading it.
#' @param name Name of the dataset to load
#' @param download.dir The path to the download directory, can be also set through \code{options()}
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' # customize the download directory
#' options(mldr.download.dir = "./datasets")
#' # retrieve the bibtex dataset, as an mldr object, into a variable
#' bibtex <- get.mldr("bibtex")
#' bibtex$measures
#' }
#' @export
get.mldr <- function(name,
                     download.dir = if (is.null(getOption("mldr.download.dir")))
                       file.path(normalizePath("~"), ".mldr", "datasets")
                     else
                       getOption("mldr.download.dir")) {
  filename <- file.path(download.dir, paste0(name, ".rds"))

  cat("Looking for dataset", name, "in the download directory\n")

  if (dir.exists(download.dir)) {
    if (file.exists(filename)) {
      cat("Now reading dataset", name, "\n")
      return(readRDS(filename))
    }
  } else {
    cat("Download directory not found. Creating", download.dir, "\n")
    dir.create(download.dir, recursive = T)
  }

  cat("Looking for dataset", name, "online...\n")
  available <- read.csv(RDS_CSV, stringsAsFactors = FALSE)
  url <- available[available$Name == name, "URL"]

  if (length(url) > 0) {
    cat("Downloading dataset", name, "\n")
    retValue <- NULL

    tryCatch(
      retValue <- download.file(url, destfile = filename),
      error = function(...) {
        cat("Attempt to download dataset", name, "failed\n")
      }
    )

    return(readRDS(filename))
  } else {
    cat("Download URL not found. Dataset",
        name,
        "may not be available at the repository\n")
  }
}

#' @title Obtain additional datasets available to download
#' @description \code{available.mldrs} retrieves the most up to date list of additional datasets. Those datasets are not
#' included into the package, but can be downloaded and saved locally.
#' @return A data.frame with the available multilabel datasets
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' names <- available.mldrs()$Name
#' }
#' @export
available.mldrs <- function() {
  read.csv(RDS_CSV, stringsAsFactors = FALSE)
}

#' @title (Deprecated) Check if an mldr object is locally available and download it if needed
#' @description This function checks if the mldr object whose name is given as input is locally available, loading it in memory.
#' If necessary, the dataset will be downloaded from the GitHub repository and saved locally.
#' @param mldr.name Name of the dataset to load
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' check_n_load.mldr("bibtex")
#' bibtex$measures
#' }
#' @export
check_n_load.mldr <- function(mldr.name) {
  .Deprecated("get.mldr", "mldr.datasets", old = "check_n_load.mldr")
  if(exists(mldr.name, .GlobalEnv, mode = "list"))
    cat('The ', mldr.name, ' dataset is already loaded.')
  else {

    fpath <- paste(find.package('mldr.datasets'), '/extdata/', mldr.name, '.rda', sep = '')

    if (!file.exists(fpath)) {
      availableMlds <- read.csv("https://fcharte.github.io/mldr.datasets/availableMlds.csv", stringsAsFactors = FALSE)
      url <- availableMlds[availableMlds$Name == mldr.name, "URL"]

      if (length(url) > 0)
        download.file(url, fpath)
    }

    if (file.exists(fpath))
      load(fpath, .GlobalEnv)
    else
      stop('The ', mldr.name, ' dataset is not available. Try calling mldrs() to update the list of available datasets')
  }
}

#' @title (Deprecated) Obtain and show a list of additional datasets available to download
#' @description The function downloads from GitHub the most up to date list of additional datasets. Those datasets are not
#' included into the package, but can be downloaded and saved locally.
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' mldrs()
#' }
#' @export
mldrs <- function() {
  .Deprecated("available.mldrs", "mldr.datasets")
  availableMlds <- read.csv("https://fcharte.github.io/mldr.datasets/availableMlds.csv", stringsAsFactors = FALSE)
  save(availableMlds, file = paste0(find.package('mldr.datasets'), "/R/sysdata.rda"), compress = "gzip")

  View(availableMlds[-(length(availableMlds))], 'List of additional datasets available at the mldr.datasets repository')
}

