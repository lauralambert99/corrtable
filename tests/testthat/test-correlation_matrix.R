test_that("correlation_matrix creates a matrix", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  expect_equal(is.matrix(correlation_matrix(df)), 'TRUE')

  })


test_that("Correlation matrix makes expected matrix", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  mat_test <- matrix(c("1.00", "-0.85", "-0.85", "1.00"), nrow = 2, ncol = 2)

  expect_equal(correlation_matrix(df), mat_test)
})


