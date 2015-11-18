
# Function to export a mldr object to several formats

# write.mulan, write.meka, write.keel, write.csv

# @relation and @data are common to MULAN, MEKA and KEEL, only the header changes and, in the KEEL case, it is necessary to
# establish which attributes are @inputs and @outputs. Divide these tasks in separate functions

# To write a CSV an indicator will be needed, setting if a header has to be included or not. The function will generate two
# files, one with the data (i.e. mld.data.csv) and another one with the labels (i.e. mld.labels.csv). The latter will provide
# the names and indexes of the labels

# TODO
# write an mldr.folds object
# libSVM format
# export correct attribute type

# 'write' method for mldr that will open the file, check parameters, etc., then call the proper write.FORMAT function
#' @export
write.mldr <- function(mld, format = c("MULAN", "MEKA", "KEEL", "CSV"), sparse = FALSE, basename = ifelse(!is.null(mld$name) && nchar(mld$name) > 0,
                                                                                                          mld$name,
                                                                                                          "unnamed_mldr"), ...) {
  format <- toupper(format)
  available.formats <- c("MULAN", "MEKA", "KEEL", "CSV")

  # Parameter checks
  if (!all(format %in% available.formats)) {
    stop("Invalid format found. Allowed formats: ", paste(available.formats, collapse = ", "))
  }
  if (!"mldr" %in% class(mld)) {
    if ("mldr.folds" %in% class(mld))
      lapply(1:length(mld), function(i) write(m[[i]], format, sparse, basename = paste0(basename, "_folds_", i) ))
    else
      stop("Object must be of class mldr or mldr.folds")
  }

  if ("MULAN" %in% format) {
    # Open and write ARFF file
    if (!"MEKA" %in% format) {
      arffConnection <- file(paste0(basename, ".arff"))
      writeLines(export.mulan(mld, sparse), arffConnection)
      close(arffConnection)
    }

    # Open and write XML file
    xmlConnection <- file(paste0(basename, ".xml"))
    writeLines(export.xml(mld), xmlConnection)
    close(xmlConnection)
  }

  if ("MEKA" %in% format) {
    # Open and write ARFF file
    arffConnection <- file(paste0(basename, ".arff"))
    writeLines(export.meka(mld, sparse), arffConnection)
    close(arffConnection)
  }

  if ("KEEL" %in% format) {
    # Open and write DAT file
    datConnection <- file(paste0(basename, ".dat"))
    writeLines(export.keel(mld, sparse), datConnection)
    close(datConnection)
  }

  if ("CSV" %in% format) {
    # Open and write CSV file
    csvConnection <- file(paste0(basename, ".csv"))
    writeLines(export.csv(mld, sparse), csvConnection)
    close(csvConnection)
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

export.keel <- function(mld, sparse) {
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
  paste0("@attribute ", names(mld$attributes), " ", mld$attributes, collapse = "\n")
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
  data <- mld$dataset[, 1:mld$measures$num.attributes]
  data[is.na(data)] <- '?'
  paste0(
    "@data\n",
    ifelse(sparse, export.sparse.arff.data(data), export.dense.arff.data(data))
  )
}


export.dense.arff.data <- function(data) {
  paste(
    apply(data, 1, function(c)
      paste(c, collapse = ',')
    ),
    collapse = "\n"
  )
}

export.sparse.arff.data <- function(data) {
  paste(
    apply(data, 1, function(instance)
      paste0("{", paste(which(instance != 0), instance[instance != 0], sep = " ", collapse = ","), "}")
    ),
    collapse = "\n"
  )
}

export.csv <- export.arff.data

export.xml <- function(mld) {
  xmlheader <- '<?xml version="1.0" encoding="utf-8"?>'
  labelstag <- '<labels xmlns="http://mulan.sourceforge.net/labels">'
  labeltags <- paste(c('<label name="'), rownames(mld$labels), c('"></label>'), sep = "\n")
  labelsend <- '</labels>'

  paste(xmlheader, labelstag, labeltags, labelsend, sep = "\n")
}
