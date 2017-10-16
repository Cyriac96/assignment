#' Function: my_cv_reader
#' This function takes all the csv from a folder, imports them, puts them in a list and returns the list

#' @param folder the folder where the csv are

#' @return list of the csv
#' @export
#' @import readxl
#' @import assertthat
#' @importFrom utils read.csv2
#' @examples
#'
#' \dontrun{
#' my_csv_reader("cheminversundossier")
#' }
#'
#'
my_csv_reader <- function(folder){
  assert_that(is.dir(folder))
  l <- list.files(path = folder, pattern = ".*csv$"
                  , full.names = TRUE)
  result <- lapply(l,read.csv2)
  return(result)
}
