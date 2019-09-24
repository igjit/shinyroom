# Module UI

#' @title   mod_luminance_ui and mod_luminance_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_luminance
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
mod_luminance_ui <- function(id) {
  ns <- NS(id)
  sliderInput(ns("luminance"), "Luminance", -1, 1, 0, step = 0.1)
}

# Module Server

#' @rdname mod_luminance
#' @export
#' @keywords internal
mod_luminance_server <- function(input, output, session, image) {
  reactive(apply_luminance(image(), input$luminance))
}
