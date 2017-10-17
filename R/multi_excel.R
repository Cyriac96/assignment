#' Function: multi_excel
#' This function imports all sheets from an xlsx file
#'
#' @param file the xlsx file from which you want to extract sheets
#'
#' @return imports sheets
#' @import readxl
#' @import assertthat
#' @export
#'
#' @examples
#' \dontrun{
#' read_excel_multi("xlsxfile")
#' }
#'
#'
read_excel_multi <- function(file) {
  assert_that(is.dir(dirname(file)))
  all_sheets <- readxl::excel_sheets(file)
  result <- lapply(all_sheets, function(sheet) {
    readxl::read_excel(file, sheet = sheet)
  })
  return(result)
}
