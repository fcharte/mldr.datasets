
# Function to export a mldr object to several formats

# write.mulan, write.meka, write.keel, write.csv

# @relation and @data are common to MULAN, MEKA and KEEL, only the header changes and, in the KEEL case, it is necessary to
# establish which attributes are @inputs and @outputs. Divide these tasks in separate functions

# To write a CSV an indicator will be needed, setting if a header has to be included or not. The function will generate two
# files, one with the data (i.e. mld.data.csv) and another one with the labels (i.e. mld.labels.csv). The latter will provide
# the names and indexes of the labels


# 'write' method for mldr that will open the file, check parameters, etc., then call the proper write.FORMAT function
#' @export
write.mldr <- function(mld, format = c("MULAN", "MEKA", "KEEL", "CSV"), sparse = FALSE, basename = ifelse(!is.null(mld$name) && nchar(mld$name) > 0,
                                                                                                          mld$name,
                                                                                                          "unnamed_mldr"), ...) {
  format <- toupper(format)
  available.formats <- c("MULAN", "MEKA", "KEEL", "CSV")

  # Parameter checks
  if (!all(format %in% available.formats)) {
    stop("Invalid format found. Allowed formats: ", do.call(paste, as.list(available.formats)))
  }
  if (!"mldr" %in% class(mld)) {
    stop("Object must be of class mldr")
  }

  if ("MULAN" %in% format) {
    # Open and write ARFF file
    if (!"MEKA" %in% format) {
      arffConnection <- file(paste0(basename, ".arff"))
      writeChar(export.mulan(mld, sparse), arffConnection)
    }

    # Open and write XML file
    xmlConnection <- file(paste0(basename, ".xml"))
    writeChar(export.xml(mld), xmlConnection)
  }

  if ("MEKA" %in% format) {
    # Open and write ARFF file
    arffConnection <- file(paste0(basename, ".arff"))
    writeChar(export.meka(mld, sparse), arffConnection)
  }

  if ("KEEL" %in% format) {
    # Open and write DAT file
    datConnection <- file(paste0(basename, ".dat"))
    writeChar(export.keel(mld, sparse), datConnection)
  }

  if ("CSV" %in% format) {
    # Open and write CSV file
    csvConnection <- file(paste0(basename, ".csv"))
    writeChar(export.csv(mld, sparse), csvConnection)
  }
}

export.mulan <- function(mld, sparse) {
  paste(
    export.mulan.header(mld),
    export.arff.attributes(mld),
    export.arff.data(mld, sparse),
    sep = "\n"
  )
}

export.meka <- function(mld, sparse) {
  paste(
    export.meka.header(mld),
    export.arff.attributes(mld),
    export.arff.data(mld, sparse),
    sep = "\n"
  )
}

export.keel <- function(mld) {
  paste(
    export.keel.header(mld),
    export.arff.attributes(mld),
    export.arff.inputs(mld),
    export.arff.outputs(mld),
    export.arff.data(mld, sparse),
    sep = "\n"
  )
}

export.mulan.header <- function(mld) {
  paste0("@relation ", ifelse(!is.null(mld$name) && nchar(mld$name) > 0,
                             mld$name,
                             "unnamed_mldr"))
}

export.meka.header <- function(mld) {
  paste0("@relation '", ifelse(!is.null(mld$name) && nchar(mld$name) > 0,
                             mld$name,
                             "unnamed_mldr"),
        ": -C ", mld$measures$num.labels, "'")
}

export.keel.header <- export.mulan.header

export.arff.attributes <- function(mld) {
  paste0("@attribute ", names(mld$attributes), " ", mld$attributes)
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

export.arff.data <- function(mld, sparse) {
  if (sparse) {

  } else {
    data <- obj$dataset[, 1:obj$measures$num.attributes]
    data[is.na(data)] <- '0' # NAs aren't missing values ('?') but 0
    data <- apply(data, 1, function(c) paste(c, collapse = ','))
  }
}

export.csv <- export.arff.data

export.xml <- function(mld) {
  xmlheader <- '<?xml version="1.0" encoding="utf-8"?>'
  labelstag <- '<labels xmlns="http://mulan.sourceforge.net/labels">'
  labeltags <- paste(c('<label name="'), rownames(obj$labels), c('"></label>'), sep = "\n")
  labelsend <- '</labels>'

  paste(xmlheader, labelstag, labeltags, labelsend, sep = "\n")
}
