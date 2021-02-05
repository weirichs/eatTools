

test_that("Errors", {
  expect_error(recodeLookup(1:3, "a"),
               "The lookup table must be a data.frame or matrix.")
  expect_error(recodeLookup(1:3, mtcars),
               "The lookup table must have two colums.")
  expect_error(recodeLookup(1:3, data.frame(old = rep(1, 2), new = 2:1)),
               "Old values in lookup table are not unique.")
})

test_that("Recode numeric", {
  lookup1 <- data.frame(old = 1:3, new = 3:1)
  out <- recodeLookup(1:3, lookup1)
  expect_equal(out, 3:1)

  lookup1 <- data.frame(old = 1:3, new = 3:1)
  out <- recodeLookup(1:10, lookup1)
  expect_equal(out, c(3:1, 4:10))
})

test_that("Recode string", {
  lookup1 <- data.frame(old = letters[1:3], new = letters[5:3])
  out <- recodeLookup(letters[1:3], lookup1)
  expect_equal(out, letters[5:3])
})

test_that("Recode with NAs", {
  lookup1 <- data.frame(old = 1:3, new = 3:1)
  out <- recodeLookup(c(NA, 1, 5, 3, NA), lookup1)
  expect_equal(out, c(NA, 3, 5, 1, NA))

  lookup2 <- data.frame(old = c(NA, 1, 2), new = c(3, 2, 1))
  out2 <- recodeLookup(c(NA, 1, 5, 3, NA), lookup2)
  expect_equal(out2, c(3, 2, 5, 3, 3))

  lookup3 <- data.frame(old = c(NA, 1, 2), new = c(3, NA, 10))
  out3 <- recodeLookup(c(NA, 1, 5, 3, NA), lookup3)
  expect_equal(out3, c(3, NA, 5, 3, 3))
})

test_that("Recode in data.frame", {
  mtcars1 <- mtcars
  lookup1 <- data.frame(old = c(4, 6, 8), new = c(40, 60, 80))
  mtcars1[, "cyl"] <- recodeLookup(mtcars1$cyl, lookup1)
  expect_equal(mtcars1$cyl, c(mtcars$cyl * 10))
})

requireNamespace("haven", quietly = TRUE)
if("haven" %in% rownames(installed.packages())){
test_that("Recode labeled", {
  lookup1 <- data.frame(old = 1, new = 1)
  lookup1$old <- haven::labelled(lookup1$old)
  lookup1$new <- haven::labelled(lookup1$new)

  expect_silent(recodeLookup(1:3, lookup1))
})
}
