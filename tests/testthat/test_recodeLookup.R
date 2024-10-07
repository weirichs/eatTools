

test_that("Errors", {
  expect_error(recodeLookup(1:3, "a"),
               "'dat' is neither a 'data.frame', 'matrix', 'tibble' or 'data.table' object.")
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
  lookup1 <- data.frame(old = letters[1:3], new = letters[5:3], stringsAsFactors = FALSE)
  out <- recodeLookup(letters[1:3], lookup1)
  expect_equal(out, letters[5:3])
})

test_that("Recode with factors", {
  lookup1 <- data.frame(old = letters[1:3], new = letters[5:3], stringsAsFactors = FALSE)
  out <- recodeLookup(factor(letters[1:3]), lookup1)
  expect_equal(out, letters[5:3])
  lookup2 <- data.frame(old = letters[1:3], new = letters[5:3], stringsAsFactors = TRUE)
  out2 <- recodeLookup(letters[1:3], lookup2)
  expect_equal(out2, factor(letters[5:3]))
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

test_that("Recode into/from different types", {
  lookup1 <- data.frame(old = 1:3, new = letters[1:3], stringsAsFactors = FALSE)
  out <- recodeLookup(1:5, lookup1)
  expect_equal(out, c(letters[1:3],4:5))
  lookup2 <- data.frame(old = letters[1:3], new = 1:3, stringsAsFactors = FALSE)
  out2 <- recodeLookup(letters[1:5], lookup2)
  expect_equal(out2, c(1:3, letters[4:5]))
})

test_that("Recode in data.frame", {
  mtcars1 <- mtcars
  lookup1 <- data.frame(old = c(4, 6, 8), new = c(40, 60, 80))
  mtcars1[, "cyl"] <- recodeLookup(mtcars1$cyl, lookup1)
  expect_equal(mtcars1$cyl, c(mtcars$cyl * 10))
})


#lookup_haven <- data.frame(old = 1, new = 1)
#lookup_haven$old <- haven::labelled(lookup_haven$old)
#lookup_haven$new <- haven::labelled(lookup_haven$new)
#saveRDS(lookup_haven, "tests/testthat/helper_haven_lookup.RDS")

test_that("Recode labeled", {
  # lookup_haven <- readRDS("tests/testthat/helper_haven_lookup.RDS")
  lookup_haven <- readRDS("helper_haven_lookup.RDS")
  expect_error(recodeLookup(1:3, lookup_haven),
               "Variable class 'haven_labelled' is not supported by recodeLookup.")
})


test_that("recode with null", {
  mtcars1 <- mtcars
  lookup1 <- data.frame(old = c(4, 6, 8), new = c(40, 60, 80))
  looktab <- NULL
  cars2 <- NULL
  expect_true(all.equal(recodeLookup(mtcars1, looktab),mtcars1))
  expect_true(all.equal(recodeLookup(cars2, lookup1), cars2))
})
