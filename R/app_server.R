#' @import shiny
app_server <- function(input, output, session) {
  image <- callModule(mod_sample_image_server, "sample_image_ui_1")
  callModule(mod_image_server, "image_ui_1", image)
}
