test_that("reduce_pixel", {
  image <- imager::boats
  expect_equal(dim(reduce_pixel(image, 100)), c(100, 150, 1, 3))
  expect_equal(dim(reduce_pixel(image, 1000)), c(256, 384, 1, 3))
})

luminance <- . %>% as.vector %>% mean

test_that("apply_luminance", {
  image <- imager::boats
  luminance_before <- image %>% luminance
  expect_gt(apply_luminance(image, 0.5) %>% luminance, luminance_before)
  expect_lt(apply_luminance(image, -0.5) %>% luminance, luminance_before)
})

test_that("apply_tone_curve", {
  image <- imager::boats
  luminance_before <- image %>% luminance
  expect_gt(apply_tone_curve(image, splinefun(c(0, 0.5, 1), c(0, 0.6, 1))) %>% luminance,
            luminance_before)
  expect_lt(apply_tone_curve(image, splinefun(c(0, 0.5, 1), c(0, 0.4, 1))) %>% luminance,
            luminance_before)
})
