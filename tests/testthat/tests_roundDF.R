
test_that("roundDF", {
  out <- roundDF(mtcars, 0)
  expect_equal(names(out), names(mtcars))
  expect_equal(out$disp, round(mtcars$disp, 0))
  expect_equal(dim(out), dim(mtcars))

  out2 <- roundDF(iris, 0)
  expect_equal(names(out2), names(iris))
  expect_equal(out2$Species, iris$Species)
  expect_equal(dim(out2), dim(iris))
  expect_equal(out2$Sepal.Length, round(iris$Sepal.Length, 0))
})

