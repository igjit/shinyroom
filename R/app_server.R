#' @import shiny
app_server <- function(input, output, session) {
  image <- callModule(mod_sample_image_server, "sample_image_ui_1")
  luminance_image <- callModule(mod_luminance_server, "luminance_ui_1", image)
  out_image <- callModule(mod_contrast_server, "contrast_ui_1", luminance_image)
  callModule(mod_histogram_server, "histogram_ui_1", out_image)
  callModule(mod_image_server, "image_ui_1", out_image)
}
