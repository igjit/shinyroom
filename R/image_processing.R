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

apply_tone_curve <- function(image, tone_curve) {
  ycb_img <- RGBtoYCbCr(image)
  luma <- ycb_img[,, 1, 1]
  adjusted <- luma %>% as.vector %>% `/`(256) %>% tone_curve %>% matrix(dim(luma))
  ton_img <- ycb_img
  ton_img[,, 1, 1] <- adjusted * 256
  YCbCrtoRGB(ton_img)
}
