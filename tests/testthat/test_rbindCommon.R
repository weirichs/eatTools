

test_that("Malformed inputs", {
  expect_error(rbind_common(c(a = 1, b = 3), c(a = 3, b = 6)), "All inputs to rbind_common must be data.frames.")
  expect_error(rbind_common(c(a = 1, b = 3), mtcars), "All inputs to rbind_common must be data.frames.")
})

###
test_that("rbind data.frames", {
  df1 <- data.frame(a = 1:3, b = TRUE)
  df1b <- data.frame(a = 4:6, b = TRUE)
  df1c <- data.frame(a = 7:10, b = TRUE)
  df2 <- data.frame(d = 100, a = 11:13)
  df3 <- data.frame(d = 1000, x = 101:103)

  out <- rbind_common(df1, df2)
  expect_equal(out, data.frame(a = c(1:3, 11:13)))

  expect_warning(out2 <- rbind_common(df1, df2, df3),
                 "No common column names found.")
  expect_equal(out2, NULL)

  out3 <- rbind_common(df1, df1b, df1c)
  expect_equal(out3, data.frame(a = 1:10, b = TRUE))

})

