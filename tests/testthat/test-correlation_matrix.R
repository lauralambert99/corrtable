#' @importFrom waldo compare
#' @importFrom withr local_options

test_that("correlation_matrix creates a matrix", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  expect_true(is.matrix(correlation_matrix(df)))

  })


test_that("Correlation matrix makes expected matrix - no args", {
  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  rnames <- c("mtcars.mpg", "mtcars.cyl")
  cnames <- c("mtcars.mpg", "mtcars.cyl")
  mat_test <- matrix(c("1.000", "-0.852***", "-0.852***", "1.000"), nrow = 2, ncol = 2,
                     dimnames = list(rnames,cnames))

  format_mat_test = formatC(mat_test, format = 'f', digits = digits, decimal.mark = decimal.mark)

  withr::local_options(width = 40)
  expect_snapshot(
    waldo::compare(correlation_matrix(df), format_mat_test)
  )
})

test_that("Correlation matrix drops string vars", {
  df2 = data.frame(iris)
  df3 <- df2[-5]

  withr::local_options(width = 40)
  expect_snapshot(
    waldo::compare(correlation_matrix(df2), cor(df3))
  )
})
