# Module UI

#' @title   mod_histogram_ui and mod_histogram_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_histogram
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
#' @import dplyr
#' @import ggplot2
mod_histogram_ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("histogram"))
}

# Module Server

#' @rdname mod_histogram
#' @export
#' @keywords internal
mod_histogram_server <- function(input, output, session, image) {
  output$histogram <- renderPlot({
    color_df <- image() %>%
      as.data.frame %>%
      mutate(color = c("r", "g", "b")[cc])
    ggplot(color_df, aes(x = value, fill = color)) +
      geom_histogram(position = "identity", bins = 64, alpha = 0.5, show.legend = FALSE) +
      scale_fill_manual(values = c(r = "red", g = "green", b = "blue"))
  })
}
