#
# Functions to export a mldr object to several formats

#' Export an mldr object or set of mldr objects to different file formats
#' @description Writes one or more files in the specified formats with the content of the \code{mldr} or \code{mldr.folds} given as parameter
#' @param mld The \code{mldr/mldr.folds} object to be exported
#' @param format A vector of strings stating the desired file formats. It can contain the values \code{'MULAN'}, \code{'MEKA'},
#' \code{'KEEL'}, \code{'CSV'} and \code{'LIBSVM'}
#' @param sparse Boolean value indicating if sparse representation has to be used for ARFF-based file formats
#' @param basename Base name for the files. \code{'unnamed_mldr'} is used by default
#' @param ... Additional options for the exporting functions (e.g. \code{chunk_size}, the number of instances to write at a time)
#' @examples
#'\dontrun{
#' library(mldr.datasets)
#' write.mldr(emotions, format = c('CSV', 'KEEL'))
#' }
#'
#' @export
write.mldr <- function(mld, format = c("MULAN", "MEKA"), sparse = FALSE, basename = ifelse(!is.null(mld$name) && nchar(mld$name) > 0,
                                                                                           regmatches(mld$name, regexpr("(\\w)+", mld$name)),
                                                                                           "unnamed_mldr"), ...) {
  format <- toupper(format)
  available.formats <- c("MULAN", "MEKA", "KEEL", "CSV", "LIBSVM")

  # Parameter checks
  if (!all(format %in% available.formats)) {
    stop("Invalid format found. Allowed formats: ", paste(available.formats, collapse = ", "))
  }
  if (!"mldr" %in% class(mld)) {
    if ("mldr.folds" %in% class(mld))
      invisible(lapply(1:length(mld), function(i) {
        write.mldr(mld[[i]]$train, format, sparse, basename = paste0(basename, "-", i, 'x', length(mld), '-tra') )
        write.mldr(mld[[i]]$test, format, sparse, basename = paste0(basename, "-", i, 'x', length(mld), '-test') )
      }))
    else
      stop("Object must be of class mldr or mldr.folds")
  } else {

    inform <- function(name) cat(paste0("Wrote file ", name, "\n"))

    if ("MULAN" %in% format) {
      # Open and write ARFF file
      if (!"MEKA" %in% format) {
        name <- paste0(basename, ".arff")
        arffConnection <- file(name, open = "w")
        export.mulan(mld, sparse, arffConnection, ...)
        close(arffConnection)
        inform(name)
      }

      # Open and write XML file
      name <- paste0(basename, ".xml")
      xmlConnection <- file(name, open = "w")
      writeLines(export.xml(mld), xmlConnection)
      close(xmlConnection)
      inform(name)
    }

    if ("MEKA" %in% format) {
      # Open and write ARFF file
      name <- paste0(basename, ".arff")
      arffConnection <- file(name, open = "w")
      export.meka(mld, sparse, arffConnection, ...)
      close(arffConnection)
      inform(name)
    }

    if ("KEEL" %in% format) {
      # Open and write DAT file
      name <- paste0(basename, ".dat")
      datConnection <- file(name, open = "w")
      export.keel(mld, sparse, datConnection, ...)
      close(datConnection)
      inform(name)
    }

    if ("CSV" %in% format) {
      # Open and write CSV file
      name <- paste0(basename, ".csv")
      csvConnection <- file(name, open = "w")
      export.csv(mld, sparse, csvConnection, ...)
      close(csvConnection)
      inform(name)

      name <- paste0(basename, "_labels.csv")
      labelConnection <- file(name, open = "w")
      writeLines(export.csv.labels(mld), labelConnection)
      close(labelConnection)
      inform(name)
    }

    if ("LIBSVM" %in% format) {
      # Open and write SVM file
      name <- paste0(basename, ".svm")
      svmConnection <- file(name, open = "w")
      writeLines(export.libsvm(mld, ...), svmConnection)
      close(svmConnection)
      inform(name)
    }
  }
}

export.mulan <- function(mld, sparse, con, ...) {
  writeLines(export.mulan.header(mld), con)
  writeLines(export.arff.attributes(mld), con)
  export.arff.data(mld, sparse, con = con, ...)
}

export.meka <- function(mld, sparse, con, ...) {
  writeLines(export.meka.header(mld), con)
  writeLines(export.arff.attributes(mld), con)
  export.arff.data(mld, sparse, con = con, ...)
}

export.keel <- function(mld, sparse, con, ...) {
  writeLines(export.keel.header(mld), con)
  writeLines(export.arff.attributes(mld), con)
  writeLines(export.arff.inputs(mld), con)
  writeLines(export.arff.outputs(mld), con)
  export.arff.data(mld, sparse, con = con, ...)
}

export.mulan.header <- function(mld) {
  paste0("@relation ",
         if (!is.null(mld$name) && nchar(mld$name) > 0)
           mld$name
         else
           "unnamed_mldr")
}

export.meka.header <- function(mld) {
  paste0("@relation '",
         # Dataset name
         if (!is.null(mld$name) && nchar(mld$name) > 0)
           mld$name
         else
           "unnamed_mldr",
         # MEKA option for number of labels
         ": -C ",
         # With a minus sign if they're at the end
         if (mld$labels$index[1] == 1)
           ""
         else
           "-",
         mld$measures$num.labels,
         "'")
}

export.keel.header <- export.mulan.header

export.arff.attributes <- function(mld) {
  attrNames <- ifelse(grepl("(\\s|\"|\')", names(mld$attributes)),
                      paste0("'", gsub(
                        "'", "\\'", names(mld$attributes), fixed = T
                      ), "'"),
                      names(mld$attributes))
  paste("@attribute",
         attrNames,
         mld$attributes)
}

export.arff.inputs <- function(mld) {
  paste0(
    "@inputs ", do.call(
      paste,
      c(
        as.list(names(mld$attributes[mld$attributesIndexes])),
        sep = ", "
      )
    )
  )
}

export.arff.outputs <- function(mld) {
  paste0(
    "@outputs ", do.call(
      paste,
      c(
        as.list(rownames(mld$labels)),
        sep = ", "
      )
    )
  )
}

export.arff.data <- function(mld, sparse, con, header = "@data\n", ...) {
  data <- mld$dataset[, 1:mld$measures$num.attributes]
  data[is.na(data)] <- '?'

  cat(header, file = con)
  export.arff.chunks(data, con = con, sparse = sparse, ...)
}


export.dense.arff.data <- function(data) {
  do.call("paste", c(unname(data), list(sep = ',')))
}

export.sparse.arff.data <- function(data) {
  ischar <- !sapply(data, is.numeric)
  nonzero <- data != 0

  sapply(1:nrow(data), function(i) {
    select <- ischar | nonzero[i, ]
    paste0(
      "{",
      paste(
        which(select) - 1,
        data[i, select],
        sep = " ",
        collapse = ","
      ),
      "}"
    )
  })
}

export.arff.chunks <-
  function(data,
           con,
           chunk_size = floor(1e6 / ncol(data)),
           sparse = F,
           fun = if (sparse)
             export.sparse.arff.data
           else
             export.dense.arff.data) {
    num_instances <- dim(data)[1]
    chunks <- floor((num_instances - 1) / chunk_size)

  for (ch in 0:chunks) {
    start <- 1 + ch*chunk_size
    end <- 1 + (ch + 1) * chunk_size
    end <- if (end < num_instances) end else num_instances
    chunk <- data[start:end, ]

    writeLines(fun(chunk), con)
  }
}

export.csv <- function(mld, sparse, con, ...) export.arff.data(mld, sparse = sparse, header = "", con = con, ...)

export.csv.labels <- function(mld) {
  paste(rownames(mld$labels), mld$labels$index, sep = ", ")
}

export.xml <- function(mld) {
  xmlheader <- '<?xml version="1.0" encoding="utf-8"?>'
  labelstag <- '<labels xmlns="http://mulan.sourceforge.net/labels">'
  labeltags <- paste(c('<label name="'), rownames(mld$labels), c('"></label>'), collapse = "\n", sep = "")
  labelsend <- '</labels>'

  paste(xmlheader, labelstag, labeltags, labelsend, sep = "\n")
}

export.libsvm <- function(mld, ...) {
  ischar <- !sapply(mld$dataset, is.numeric)
  nonzero <- mld$dataset != 0

  sapply(1:nrow(mld$dataset), function(i) {
      inputs <- mld$dataset[i, mld$attributesIndexes]
      outputs <- mld$dataset[i, mld$labels$index]
      select <- ischar | nonzero[i, ]
      paste(
        # libSVM counts labels starting from zero
        # and attributes starting from one
        paste(which(outputs == 1) - 1, collapse = ","),
        paste(which(select), mld$dataset[i, select], sep = ":", collapse = " "),
        sep = " "
      )
    }
  )
}
