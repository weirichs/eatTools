
dat <- data.frame(idstud = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
                                     imp = rep(1:3, 3),
                                     var1 = c(10, 10, 10, 9, 8, 9, 6, 6, 6))
dat2 <- data.frame(idstud = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
                  imp = rep(1:3, 3),
                  var1 = c(10, 10, 10, 9, 9, 9, 6, 6, 6))
dat3 <- data.frame(idstud = 1:3,
                  var1 = 1:3)


test_that("isNestedFast errors", {
  expect_error(isNestedFast(0), "'dat' needs to be a data.frame.")
  expect_error(isNestedFast(dat, idVar = "ID"), "'idVar' is not a variable in 'dat'.")
  expect_error(isNestedFast(dat, idVar = "idstud", varName = "v1"), "'varName' is not a variable in 'dat'.")
})


test_that("isNestedFast", {
  expect_false(isNestedFast(dat, idVar = "idstud", varName = "var1"))
  expect_true(isNestedFast(dat2, idVar = "idstud", varName = "var1"))
  expect_true(isNestedFast(dat3, idVar = "idstud", varName = "var1"))
})

