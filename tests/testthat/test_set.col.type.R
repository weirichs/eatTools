
###
test_that("Insert one column in data.frame by name", {
  out <- set.col.type(mtcars, col.type = list("character" = c("cyl")))
  expect_true(is.character(out$cyl))
  expect_equal(out$cyl, as.character(mtcars$cyl))
})
