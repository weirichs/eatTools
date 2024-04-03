

test_that("Errors", {
  expect_error(insert.col(1),
               "'dat' is neither a 'data.frame', 'matrix', 'tibble' or 'data.table' object.")
})

###
test_that("Insert one column in data.frame by name", {
  out <- insert.col(mtcars, toinsert = "mpg", after = "carb")
  expect_equal(out, mtcars[, c(2:11, 1)])

  out <- insert.col(mtcars, toinsert = "mpg", after = "cyl")
  expect_equal(out, mtcars[, c(2, 1, 3:11)])
})

###
test_that("Insert one column in data.table by name", {
  mtcars_table <- as.data.table(mtcars)
  suppressMessages(out <- insert.col(mtcars_table, toinsert = "mpg", after = "carb"))

  mtcars2 <- mtcars
  rownames(mtcars2) <- NULL
  expect_equal(out, mtcars2[, c(2:11, 1)])
})

