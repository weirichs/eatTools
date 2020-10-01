
### set up test vectors
num <- 3:1
char_num <- c("3", "4", "5")
char_char <- c("a", "b", "d")
char_mixed <- c("la", "le", "1")
fac_num <- as.factor(char_num)
fac_mixed <- as.factor(char_mixed)
fac_char <- as.factor(char_char)

test_that("Numeric vector", {
  expect_equal(asNumericIfPossible(num), num)
})

test_that("Factor vector drop levels", {
  expect_equal(asNumericIfPossible(fac_num, maintain.factor.scores = FALSE), 1:length(fac_num))
  expect_equal(asNumericIfPossible(fac_char, maintain.factor.scores = FALSE), 1:length(fac_char))
  # Achtung: Factor Levels werden alphabetisch sortiert
  expect_equal(asNumericIfPossible(fac_mixed, maintain.factor.scores = FALSE), c(2, 3, 1))
})

test_that("Factor vector keep levels", {
  expect_equal(asNumericIfPossible(fac_num, maintain.factor.scores = TRUE), c(3, 4, 5))
  expect_warning(asNumericIfPossible(fac_char, maintain.factor.scores = TRUE, force.string = FALSE),
                 "Variable can not be transformed to numeric. Use force.string = TRUE to force this.")
  expect_equal(suppressWarnings(asNumericIfPossible(fac_char, maintain.factor.scores = TRUE, force.string = FALSE)),
               as.factor(c("a", "b", "d")))
  expect_warning(asNumericIfPossible(fac_char, maintain.factor.scores = TRUE, force.string = TRUE),
                 "Variable has been coerced to numeric, NAs have been induced.")
  expect_equal(suppressWarnings(asNumericIfPossible(fac_char, maintain.factor.scores = TRUE, force.string = TRUE)),
               c(NA_real_, NA_real_, NA_real_))
})


test_that("Character vector (levels always kept, maintain scores has not impact)", {
  expect_equal(asNumericIfPossible(char_num, maintain.factor.scores = FALSE), c(3, 4, 5))
  expect_equal(asNumericIfPossible(char_num, maintain.factor.scores = TRUE), c(3, 4, 5))
  expect_warning(asNumericIfPossible(char_char, maintain.factor.scores = TRUE, force.string = FALSE),
                 "Variable can not be transformed to numeric. Use force.string = TRUE to force this.")
  expect_equal(suppressWarnings(asNumericIfPossible(char_char, maintain.factor.scores = TRUE, force.string = FALSE)),
               c("a", "b", "d"))
  expect_warning(asNumericIfPossible(char_char, maintain.factor.scores = TRUE, force.string = TRUE),
                 "Variable has been coerced to numeric, NAs have been induced.")
  expect_equal(suppressWarnings(asNumericIfPossible(char_char, maintain.factor.scores = TRUE, force.string = TRUE)),
               c(NA_real_, NA_real_, NA_real_))
})


# data frames
#######
df_num <- data.frame(a = num, b = fac_num, d = char_num, stringsAsFactors = F)
df_char <- data.frame(a = num, b = fac_char, d = char_char, stringsAsFactors = F)

test_that("Data frame vector drop factor levels", {
  df_num_out <- data.frame(a = c(3, 2, 1), b = 1:3, d = 3:5)
  df_char_out <- data.frame(a = c(3, 2, 1), b = 1:3, d = NA_real_)
  expect_equal(asNumericIfPossible(df_num, maintain.factor.scores = FALSE), df_num_out)
  expect_equal(suppressWarnings(asNumericIfPossible(df_char, maintain.factor.scores = FALSE, force.string = TRUE)), df_char_out)
})

test_that("Data frame keep levels", {
  df_num_out <- data.frame(a = c(3, 2, 1), b = 3:5, d = 3:5)
  expect_equal(asNumericIfPossible(df_num, maintain.factor.scores = TRUE), df_num_out)
  df_char_warns <- capture_warnings(asNumericIfPossible(df_char, maintain.factor.scores = TRUE, force.string = FALSE))
  expect_equal(df_char_warns[[1]], "'b' can not be transformed to numeric. Use force.string = TRUE to force this.")
  expect_equal(df_char_warns[[2]], "'d' can not be transformed to numeric. Use force.string = TRUE to force this.")
  expect_equal(suppressWarnings(asNumericIfPossible(df_char, maintain.factor.scores = TRUE, force.string = FALSE)),
               df_char)

  df_char_NAs <- df_char
  df_char_NAs[, 2:3] <- NA_real_
  df_char_warns2 <- capture_warnings(asNumericIfPossible(df_char, maintain.factor.scores = TRUE, force.string = TRUE))
  expect_equal(df_char_warns2[[1]], "'b' has been coerced to numeric, NAs have been induced.")
  expect_equal(df_char_warns2[[2]], "'d' has been coerced to numeric, NAs have been induced.")
  expect_equal(suppressWarnings(asNumericIfPossible(df_char, maintain.factor.scores = TRUE, force.string = TRUE)),
               df_char_NAs)
})


##### Archiv
test_that("Extract original call to retrieve variable name", {
  expect_warning(extract_original_call(fun_name = "test", escape = "Variable"),
                 "Original function call could not be retrieved. Variable has been inserted.")
  expect_equal(suppressWarnings(extract_original_call(fun_name = "test", escape = "Variable")),
               as.list(rep("Variable", 20)))
})



# matrices
######
matrix_char <- matrix(data = c(letters[1:4]), nrow=2)
matrix_char2 <- matrix(data = c(1:4), nrow=2)
class(matrix_char2) <- "character"
matrix_num <- matrix(data = c(1:4), nrow=2)
matrix_mix <- matrix(data = c(letters[1:2], 1:2), nrow=2)
# not necessary to test factors, as there are no factor-matrices
matrix_fac <- matrix(data = factor(letters[1:4]), nrow=2)


test_that("Matrices asnumeric defaults", {
  out_num <- asNumericIfPossible(matrix_num)
  expect_equal(out_num, matrix_num)

  out_char2 <- asNumericIfPossible(matrix_char2)
  expect_equal(out_char2, matrix_num)
  expect_warning(out_char <- asNumericIfPossible(matrix_char),
                 "'Matrix' has been coerced to numeric, NAs have been induced.")
  expect_equal(out_char, matrix(NA_real_, nrow = 2, ncol = 2))

  expect_warning(out_mix <- asNumericIfPossible(matrix_mix),
                 "'Matrix' has been coerced to numeric, NAs have been induced.")
  expect_equal(out_mix, matrix(c(NA_real_, NA_real_, 1, 2), nrow = 2, ncol = 2))
})

test_that("Matrices asnumeric other options", {
  expect_warning(out_char <- asNumericIfPossible(matrix_char, force.string = FALSE),
                 "'Matrix' can not be transformed to numeric. Use force.string = TRUE to force this.")
  expect_equal(out_char, matrix_char)
})
