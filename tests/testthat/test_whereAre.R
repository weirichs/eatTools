

test_that("where are", {
  a <- 12
  b <- c(10, 11, 12, 10, 11, 12)
  out <- capture_output(cont <- whereAre(a=a, b=b))
  out2 <- capture_output(cont <- whereAre(a=a, b=b, quiet = TRUE))

  expect_equal(cont, c(3, 6))
  expect_equal(out, "Found 2 elements.")
  expect_equal(out2, "")
})
