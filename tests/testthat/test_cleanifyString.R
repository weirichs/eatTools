messy_char <- c("(te-st.)", "te\U00DFt", "t\U00E4st", "t\U00C4st", "test\U2026")
messy_fac <- factor(messy_char, levels = c("(te-st.)", "te\U00DFt", "t\U00E4st", "t\U00C4st", "test\U2026"))

test_that("cleanifyString on character vector", {
  out <- cleanifyString(messy_char)
  expect_identical(out, c("test", "tesst", "taest", "tAest", "test"))

  out2 <- cleanifyString(messy_char, replaceSpecialChars = FALSE)
  expect_identical(out2, c("test", "te\U00DFt", "t\U00E4st", "t\U00C4st", "test"))

  out3 <- cleanifyString(messy_char, removeNonAlphaNum = FALSE)
  expect_identical(out3, c("(te-st.)", "tesst", "taest", "tAest", "test..."))
})

test_that("cleanifyString on factor", {
  out <- cleanifyString(messy_fac)
  expect_equal(out, factor(c("test", "tesst", "taest", "tAest", "test"),
                               levels = c("test", "tesst", "taest", "tAest")))
})

test_that("cleanifyString on factor", {
  input_df <- data.frame(v1 = messy_char,
                         v2 = messy_fac,
                         v3 = 1:5,
                         v4 = rep(TRUE, 5))

  out <- cleanifyString(input_df)
  expect_identical(out$v1, c("test", "tesst", "taest", "tAest", "test"))
  expect_equal(out$v2, factor(c("test", "tesst", "taest", "tAest", "test"),
                               levels = c("test", "tesst", "taest", "tAest")))
  expect_equal(out$v3, 1:5)
  expect_equal(out$v4, rep(TRUE, 5))
})


badString <- readRDS("helper_badString.rds")

test_that("error on bad encoding", {
  expect_warning(expect_error(cleanifyString(badString), "input string 13 is invalid"), "unable to translate 'Baden-W<fc>rttemberg' to a wide string")
})

# this should work: correct encoding
cleanifyString(badString, oldEncoding = "latin1")

