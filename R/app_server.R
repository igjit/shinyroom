#' @import shiny
app_server <- function(input, output, session) {
  image <- function() imager::load.example("parrots")
  callModule(mod_image_server, "image_ui_1", image)
}
