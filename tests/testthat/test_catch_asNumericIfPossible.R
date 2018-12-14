context("Convert vectors to numeric if possible")

### set up test vectors
num <- 3:1
char_num <- c("3", "4", "5")
char_char <- c("a", "b", "d")
char_mixed <- c("la", "le", "1")
fac_num <- as.factor(char_num)
fac_mixed <- as.factor(char_mixed)
fac_char <- as.factor(char_char)

test_that("Numeric vector", {
  expect_equal(catch_asNumericIfPossible(num, warn = "hallo"), num)
  expect_warning(catch_asNumericIfPossible(char_char, warn = "hallo"), "hallo")
})

