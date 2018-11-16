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
  expect_equal(asNumeric_new(num), num)
})

test_that("Factor vector drop levels", {
  expect_equal(asNumeric_new(fac_num, maintain.factor.scores = FALSE), 1:length(fac_num))
  expect_equal(asNumeric_new(fac_char, maintain.factor.scores = FALSE), 1:length(fac_char))
  # Achtung: Factor Levels werden alphabetisch sortiert
  expect_equal(asNumeric_new(fac_mixed, maintain.factor.scores = FALSE), c(2, 3, 1))
})

test_that("Factor vector keep levels", {
  expect_equal(asNumeric_new(fac_num, maintain.factor.scores = TRUE), c(3, 4, 5))
  expect_warning(asNumeric_new(fac_char, maintain.factor.scores = TRUE, force.string = FALSE),
                 "Variable can not be transformed to numeric. Use force.string = T to force this.")
  expect_equal(suppressWarnings(asNumeric_new(fac_char, maintain.factor.scores = TRUE, force.string = FALSE)),
               as.factor(c("a", "b", "d")))
  expect_warning(asNumeric_new(fac_char, maintain.factor.scores = TRUE, force.string = TRUE),
                 "Variable has been coerced to numeric, NAs have been induced.")
  expect_equal(suppressWarnings(asNumeric_new(fac_char, maintain.factor.scores = TRUE, force.string = TRUE)),
               c(NA_real_, NA_real_, NA_real_))
})

test_that("Character vector drop levels", {
  expect_equal(asNumeric_new(char_num, maintain.factor.scores = FALSE), 1:length(char_num))
  expect_equal(asNumeric_new(char_char, maintain.factor.scores = FALSE), 1:length(char_char))
  # Achtung: Factor Levels werden alphabetisch sortiert
  expect_equal(asNumeric_new(char_mixed, maintain.factor.scores = FALSE), c(2, 3, 1))
})

test_that("Character vector keep levels", {
  expect_equal(asNumeric_new(char_num, maintain.factor.scores = TRUE), c(3, 4, 5))
  expect_warning(asNumeric_new(char_char, maintain.factor.scores = TRUE, force.string = FALSE),
                 "Variable can not be transformed to numeric. Use force.string = T to force this.")
  expect_equal(suppressWarnings(asNumeric_new(char_char, maintain.factor.scores = TRUE, force.string = FALSE)),
               c("a", "b", "d"))
  expect_warning(asNumeric_new(char_char, maintain.factor.scores = TRUE, force.string = TRUE),
                 "Variable has been coerced to numeric, NAs have been induced.")
  expect_equal(suppressWarnings(asNumeric_new(char_char, maintain.factor.scores = TRUE, force.string = TRUE)),
               c(NA_real_, NA_real_, NA_real_))
})


# data frames
#######
df_num <- data.frame(a = num, b = fac_num, d = char_num, stringsAsFactors = F)
df_char <- data.frame(a = num, b = fac_char, d = char_char, stringsAsFactors = F)

test_that("Data frame vector drop levels", {
  df_num_out <- data.frame(a = c(3, 2, 1), b = 1:3, d = 1:3)
  expect_equal(asNumeric_new(df_num, maintain.factor.scores = FALSE), df_num_out)
  expect_equal(asNumeric_new(df_char, maintain.factor.scores = FALSE), df_num_out)
})

test_that("Data frame keep levels", {
  df_num_out <- data.frame(a = c(3, 2, 1), b = 3:5, d = 3:5)
  expect_equal(asNumeric_new(df_num, maintain.factor.scores = TRUE), df_num_out)
  df_char_warns <- capture_warnings(asNumeric_new(df_char, maintain.factor.scores = TRUE, force.string = FALSE))
  expect_equal(df_char_warns[[1]], "simpleWarning: b can not be transformed to numeric. Use force.string = T to force this.\n")
  expect_equal(df_char_warns[[2]], "simpleWarning: d can not be transformed to numeric. Use force.string = T to force this.\n")
  expect_equal(suppressWarnings(asNumeric_new(df_char, maintain.factor.scores = TRUE, force.string = FALSE)),
               df_char)

  df_char_NAs <- df_char
  df_char_NAs[, 2:3] <- NA_real_
  df_char_warns2 <- capture_warnings(asNumeric_new(df_char, maintain.factor.scores = TRUE, force.string = TRUE))
  expect_equal(df_char_warns2[[1]], "simpleWarning: b has been coerced to numeric, NAs have been induced.\n")
  expect_equal(df_char_warns2[[2]], "simpleWarning: d has been coerced to numeric, NAs have been induced.\n")
  expect_equal(suppressWarnings(asNumeric_new(df_char, maintain.factor.scores = TRUE, force.string = TRUE)),
               df_char_NAs)
})


##### Archiv
test_that("Extract original call to retrieve variable name", {
  expect_warning(extract_original_call(fun_name = "test", escape = "Variable"),
                 "Original function call could not be retrieved. Variable has been inserted.")
  expect_equal(suppressWarnings(extract_original_call(fun_name = "test", escape = "Variable")),
               as.list(rep("Variable", 20)))
})



