test_that("reduce_pixel", {
  image <- imager::boats
  expect_equal(dim(reduce_pixel(image, 100)), c(100, 150, 1, 3))
  expect_equal(dim(reduce_pixel(image, 1000)), c(256, 384, 1, 3))
})
