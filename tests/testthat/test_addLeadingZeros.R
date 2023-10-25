
### set up test data frames
dat <- data.frame(v1 = c("0","300","e",NA),
                  v2=c("0","90","10000",NA),
                  v3=c("k","kk","kkk",NA),
                  v4=NA,
                  v5=c("0","90","100","1"))
dat <- set.col.type(dat)
addLeadingZerosToCharInt(dat)

test_that("Errors", {
  expect_error(addLeadingZerosToCharInt(1),
               "Argument dat must be a data.frame.")
  expect_error(addLeadingZerosToCharInt(mtcars),
               "All columns in dat need to be of class character.")
})

test_that("Factor vector drop levels", {
  out <- addLeadingZerosToCharInt(dat)

  expect_equal(out[["v5"]], c("000", "090", "100", "001"))
  expect_equal(out[["v1"]], c("0", "300", "e", NA))
})

