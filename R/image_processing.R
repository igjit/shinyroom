#' @import imager
reduce_pixel <- function(image, max_width) {
  w <- width(image)
  h <- height(image)
  if (w <= max_width) {
    image
  } else {
    resize(image, max_width, max_width * h / w)
  }
}

apply_luminance <- function(image, luminance) {
  image[image < 0] <- 0
  image[image > 1] <- 1
  image ^ 10 ^ -luminance
}
