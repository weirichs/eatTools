

test_that("existBackgroundVariables", {
  expect_equal(existsBackgroundVariables(mtcars, "cyl"), "cyl")
  expect_equal(existsBackgroundVariables(mtcars, 2), "cyl")
  expect_equal(existsBackgroundVariables(mtcars, c(1, 2)), c("mpg", "cyl"))
  expect_equal(existsBackgroundVariables(mtcars, c()), NULL)
})
