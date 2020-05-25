

test_that("multiseq", {
  v <- c("a", "a", "a", "c", "b", "b" , "a")
  vF <- factor(c("a", "a", "a", "c", "b", "b" , "a"))
  n <- c(1, 1, 2, 4, 1)
  expect_equal(multiseq(v), c(1, 2, 3, 1, 1, 2, 4))
  expect_equal(multiseq(vF), c(1, 2, 3, 1, 1, 2, 4))
  expect_equal(multiseq(n), c(1, 2, 1, 1, 3))
})
