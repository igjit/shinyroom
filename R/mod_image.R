# Module UI

#' @title   mod_image_ui and mod_image_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_image
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
mod_image_ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("image"), height = "100vh")
}

# Module Server

#' @rdname mod_image
#' @export
#' @keywords internal
mod_image_server <- function(input, output, session, image) {
  output$image <- renderPlot({
    plot(as.raster(image()))
  })
}
