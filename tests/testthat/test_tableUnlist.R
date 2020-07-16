

df <- data.frame(v1 = c("a", "a", "b"),
                 v2 = c("a", "a", "b"),
                 v3 = c("a", "a", "b"),
                 stringsAsFactors = FALSE)

test_that("tableUnlist", {
  out <- tableUnlist(df)
  expect_equal(out["a"], c(a = 6))
  expect_equal(out["b"], c(b = 3))
})

### test fuer warnings
test_that("tableUnlist warnings", {
  expect_warning(tableUnlist(dataFrame=as.matrix(df)), "Argument of 'tableUnlist' has to be of class 'data.frame'. Object will be converted to data.frame.", fixed = TRUE)
})
