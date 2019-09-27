#' @import shiny
#' @importFrom shinyloadermessage withLoaderMessage
#' @importFrom shinythemes shinytheme
app_ui <- function() {
  tagList(
    golem_add_external_resources(),
    fluidPage(theme = shinytheme("slate"),
      sidebarLayout(
        mainPanel(
          h1("shinyroom"),
          withLoaderMessage(
            mod_image_ui("image_ui_1")
          )
        ),
        sidebarPanel(
          mod_histogram_ui("histogram_ui_1"),
          mod_luminance_ui("luminance_ui_1"),
          mod_contrast_ui("contrast_ui_1"),
          mod_sample_image_ui("sample_image_ui_1")
        )
      )
    )
  )
}

#' @import shiny
golem_add_external_resources <- function() {
  addResourcePath(
    "www", system.file("app/www", package = "shinyroom")
  )

  tags$head(
    golem::activate_js(),
    golem::favicon()
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    # tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}
