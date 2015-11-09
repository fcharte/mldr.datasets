
# Function to export a mldr object to several formats

# write.mulan, write.meka, write.keel, write.csv

# @relation and @data are common to MULAN, MEKA and KEEL, only the header changes and, in the KEEL case, it is necessary to
# establish which attributes are @inputs and @outputs. Divide this tasks in separate functions

# To write a CSV an indicator will be needed, setting if a header has to be included or not. The function will generate two
# files, one with the data (i.e. mld.data.csv) and another one with the labels (i.e. mld.labels.csv). The latter will provide
# the names and indexes of the labels


# Generic function that will open the file, check parameters, etc., then calling the proper write.FORMAT function
write.mldr <- function(mld, format = c("MULAN", "MEKA", "KEEL", "CSV"), sparse = FALSE, ...) {
  # if(format == "MULAN") write.mulan(mld, connection ...)
}

write.mulan <- function(mld, connection, sparse) {
  write.mulan.header(mld)
  write.arff.body(mld, sparse)
}

write.meka <- function(mld) {

}

write.keel <- function(mld) {

}

write.mulan.header <- function(mld) {

}


write.meka.header <- function(mld) {

}


write.keel.header <- function(mld) {

}

write.arff.body <- function(mld, sparse) {


}

write.csv.mldr <- function(mld) {

}

write.xml <- function(mld) {

}
