test_that("correlation_matrix creates a matrix", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  expect_equal(is.matrix(correlation_matrix(df)), TRUE)

  })


test_that("Correlation matrix makes expected matrix", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  rnames <- c("mtcars.mpg", "mtcars.cyl")
  cnames <- c("mtcars.mpg", "mtcars.cyl")
  mat_test <- matrix(c("1.000", "-0.852***", "-0.852***", "1.000"), nrow = 2, ncol = 2,
                     dimnames = list(rnames,cnames))

  withr::local_options(width = 20)
  expect_snapshot(
    waldo::compare(correlation_matrix(df), mat_test)
  )
})


