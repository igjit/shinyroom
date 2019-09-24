# Module UI

#' @title   mod_contrast_ui and mod_contrast_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_contrast
#'
#' @keywords internal
#' @export
#' @importFrom shiny NS tagList
mod_contrast_ui <- function(id) {
  ns <- NS(id)
  sliderInput(ns("contrast"), "Contrast", -1, 1, 0, step = 0.1)
}

# Module Server

#' @rdname mod_contrast
#' @export
#' @keywords internal
mod_contrast_server <- function(input, output, session, image) {
  reactive({
    dy <- 0.2 * input$contrast
    xs <- c(0, 0.25, 0.75, 1.0)
    ys <- c(0, 0.25 - dy, 0.75 + dy, 1.0)
    tone_curve <- splinefun(xs, ys)
    apply_tone_curve(image(), tone_curve)
  })
}
