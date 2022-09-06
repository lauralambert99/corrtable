test_that("a file is created", {
 file <- tempfile()

 save_correlation_matrix(df, filename = file)

 expect_true(file.exists(file))
 on.exit(unlink(file))
})
