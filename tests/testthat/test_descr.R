context("Descriptive statistics functions")

descr_template <- readRDS("helper_matcars_descr.rds")
wtm <- readRDS("wtm.rds")

###
test_that("descr for one variable", {
  expect_equal(descr(mtcars$cyl)$Mean, mean(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$SD, sd(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$Var, var(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$N, nrow(mtcars))
  expect_equal(descr(mtcars$hp, p.weights = mtcars$wt)$Mean, wtm[["a"]])
  expect_equal(descr(mtcars$hp, p.weights = mtcars$wt)$SD, wtm[["b"]])
  expect_equal(descr(mtcars), descr_template)
})


