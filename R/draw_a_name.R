#' Function: draw_a_name
#' This function returns the graph of the evolution of the occurence of a name over time in France
#'
#' @param the_sex sex of the person
#' @param the_name name of the person
#'
#' @return graph of the evolution of name over time
#' @export
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import dygraphs
#' @import tidyr
#' @examples
#' draw_a_name(the_sex = "M", the_name = "Pierre")
#'
draw_a_name <- function(the_sex, the_name) {
  prenoms::prenoms %>% filter(sex == the_sex, name == the_name) %>%
    group_by(year) %>% summarise(total=sum(n)) %>%
    ggplot( aes(x = year, y = total)) + geom_line()
}

