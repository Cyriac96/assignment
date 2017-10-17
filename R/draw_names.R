#' Function: draw_names_dygraph
#' This function plots the occurence of two names over time
#' @param names noms recherchés
#'
#' @return graph
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import dygraphs
#' @import tidyr
#' @import assertthat
#' @export
#'
#' @examples
#' draw_names_dygraph(names = "Pierre")
#'
draw_names_dygraph <- function(names){
  assert_that(is.character(names))
  prenoms::prenoms %>%
    group_by(year, name) %>%
    summarise (total = sum(n)) %>%
    filter (name %in% names) %>%
    spread(key = name, value = total) %>%
    dygraph()
}
