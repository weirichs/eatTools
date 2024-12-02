
messy_char <- c("(te-st.)", "te\U00DFt", "t\U00E4st", "t\U00C4st", "test\U2026")

test_that("cleanifyString on character vector", {
  out <- cleanifyString(messy_char)
  expect_identical(out, c("test", "tesst", "taest", "tAest", "test"))

  out2 <- cleanifyString(messy_char, replaceSpecialChars = FALSE)
  expect_identical(out2, c("test", "te\U00DFt", "t\U00E4st", "t\U00C4st", "test"))

  out3 <- cleanifyString(messy_char, removeNonAlphaNum = FALSE)
  expect_identical(out3, c("(te-st.)", "tesst", "taest", "tAest", "test..."))
})

test_that("cleanifyString on factor", {
  out <- cleanifyString(as.factor(messy_char))
  expect_identical(out, factor(c("test", "tesst", "taest", "tAest", "test"),
                               levels = c("test", "taest", "tAest", "tesst")))
})

test_that("cleanifyString on factor", {
  input_df <- data.frame(v1 = messy_char,
                         v2 = as.factor(messy_char),
                         v3 = 1:5,
                         v4 = rep(TRUE, 5))

  out <- cleanifyString(input_df)
  expect_identical(out$v1, c("test", "tesst", "taest", "tAest", "test"))
  expect_identical(out$v2, factor(c("test", "tesst", "taest", "tAest", "test"),
                               levels = c("test", "taest", "tAest", "tesst")))
  expect_identical(out$v3, 1:5)
  expect_identical(out$v4, rep(TRUE, 5))
})
