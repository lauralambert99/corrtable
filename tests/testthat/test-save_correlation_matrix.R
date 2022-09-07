test_that("a file is created", {

  file <- tempfile()
  on.exit(unlink(file))

  df = data.frame(
    mtcars$mpg, mtcars$cyl)

  expect_false(file.exists(file))

  save_correlation_matrix(df, filename = file)

  expect_true(file.exists(file))

})
