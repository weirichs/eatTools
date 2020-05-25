context("Descriptive statistics functions")


###
test_that("descr for one variable", {
  expect_equal(descr(mtcars$cyl)$Mean, mean(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$SD, sd(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$Var, var(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$N, nrow(mtcars))
})


