library(shinytest)

app <- ShinyDriver$new(".")

test_that("image changes", {
  output <- c("image_ui_1-image", "histogram_ui_1-histogram")
  expectUpdate(app, "contrast_ui_1-contrast" = 1, output = output)
  expectUpdate(app, "luminance_ui_1-luminance" = 1, output = output)
})

app$stop()
