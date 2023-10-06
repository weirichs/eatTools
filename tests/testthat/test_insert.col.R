

test_that("Errors", {
  expect_error(insert.col(1),
               "Argument dat must be a data.frame.")
})

###
test_that("Insert one column in data.frame by name", {
  out <- insert.col(mtcars, toinsert = "mpg", after = "carb")
  expect_equal(out, mtcars[, c(2:11, 1)])

  out <- insert.col(mtcars, toinsert = "mpg", after = "cyl")
  expect_equal(out, mtcars[, c(2, 1, 3:11)])
})

