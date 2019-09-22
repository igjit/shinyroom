# Module UI

#' @title   mod_sample_image_ui and mod_sample_image_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_sample_image
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
mod_sample_image_ui <- function(id) {
  ns <- NS(id)
  sample_images <- c("parrots", "hubble", "birds")
  selectInput(ns("image_name"), "Image", sample_images)
}

# Module Server

#' @rdname mod_sample_image
#' @export
#' @keywords internal
mod_sample_image_server <- function(input, output, session) {
  reactive(imager::load.example(input$image_name))
}
