

df <- data.frame(v1 = c("a", "a", "b"),
                 v2 = c("a", "a", "b"),
                 v3 = c("a", "a", "b"),
                 stringsAsFactors = FALSE)

test_that("tableUnlist", {
  out <- tableUnlist(df)
  expect_equal(out["a"], c(a = 6))
  expect_equal(out["b"], c(b = 3))
})
