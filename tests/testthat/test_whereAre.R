

test_that("tableUnlist", {
  a <- 12
  b <- c(10, 11, 12, 10, 11, 12)
  expect_equal(whereAre(a=a, b=b), c(3, 6))
})
