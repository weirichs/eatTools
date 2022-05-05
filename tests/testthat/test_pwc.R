

test_that("minimal example", {
  dat <- data.frame ( item1 = c(0,1,1,3), item2 = c(2,3,1,3), item3 = c(1, NA, 3,3))
  out <- pwc(dat)
  expect_equal(names(out), c("item", "corr", "partWholeCorr"))
  expect_equal(out$item, c("item1", "item2", "item3"))
  expect_equal(round(out$partWholeCorr, 2), c(0.75, 0.12, 0.50))
})

test_that("mtcars", {
  out <- pwc(mtcars)
  expect_equal(names(out), c("item", "corr", "partWholeCorr"))
  expect_equal(out$item, names(mtcars))
  # expect_equal(out$item, sort(names(mtcars))) ## aktuell passiert das hier
})

