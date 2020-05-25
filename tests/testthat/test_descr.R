context("Descriptive statistics functions")


x <- c(50, 0, 25)
w <- c(1, 5, 1)
##saveRDS(Hmisc::wtd.var(x, w), "C:/Users/benjb/Documents/Repositories/eatTools/tests/testthat/hmisc_wtdvar.RDS")

hmisc_wtdvar <- readRDS("C:/Users/benjb/Documents/Repositories/eatTools/tests/testthat/hmisc_wtdvar.RDS")


test_that("wtdvar implementation", {
  expect_equal(wtdVar(x, w), hmisc_wtdvar)
})


###
test_that("descr for one variable", {
  expect_equal(descr(mtcars$cyl)$Mean, mean(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$SD, sd(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$Var, var(mtcars$cyl))
  expect_equal(descr(mtcars$cyl)$N, nrow(mtcars))
})


