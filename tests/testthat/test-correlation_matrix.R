test_that("correlation_matrix creates a table", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  expect_equal(is.matrix(correlation_matrix(df)), 'TRUE')

})


