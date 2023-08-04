

test_that("existBackgroundVariables", {
  expect_equal(existsBackgroundVariables(mtcars, "cyl"), "cyl")
  expect_equal(existsBackgroundVariables(mtcars, 2), "cyl")
  expect_equal(existsBackgroundVariables(mtcars, c(1, 2)), c("mpg", "cyl"))
  expect_equal(existsBackgroundVariables(mtcars, c()), NULL)
})

mtMiss <- mtcars
mtMiss[2,2] <- mtMiss[3,3] <- NA

test_that("existBackgroundVariables with missings", {
  expect_warning(existsBackgroundVariables(mtMiss, c("cyl", "disp", "hp"), warnIfMissing = TRUE), "Found 1 missing values in variable 'cyl'")
  expect_warning(existsBackgroundVariables(mtMiss, c("cyl", "disp", "hp"), warnIfMissing = TRUE), "Found 1 missing values in variable 'disp'.")
  expect_error(existsBackgroundVariables(mtMiss, c("cyl", "disp", "hp"), warnIfMissing = TRUE, stopIfMissingOnVars = "cyl"), "Found 1 missing values in variable 'cyl'.")
})

