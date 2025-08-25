data(data.timss1)

varGroups <- list(ID = "IDSTUD", wgt = c("TOTWGT","JKZONE"), covars = c("female", "books", "lang", "migant"), depVar = "ASMMAT")

test_that("error occurs due to type", {
  lapply(varGroups, FUN = function (v) {
  if(v[[1]] == "female") {expect_error(existsBackgroundVariables (dat=data.timss1[[1]], variable=v))}
  })})

# correction
varGroups <- list(ID = "IDSTUD", wgt = c("TOTWGT","JKZONE"), covars = c("female", "books", "lang", "migrant"), depVar = "ASMMAT")
varList   <- lapply(varGroups, FUN = function (v) {
    existsBackgroundVariables (dat=data.timss1[[1]], variable=v)
})

# however, only one weighting variable is allowed
test_that("error occurs because obly one wgt variable is allowed", {
   expect_error(checkBackgroundVariables (varList, len1 = c("ID", "wgt", "depVar"), overlap = NULL))
})

# only one of the covariates should be used for group differences
# difference variable must be included in covars
varGroups <- list(ID = "IDSTUD", wgt = "TOTWGT", covars = c("female", "books", "lang"),
             differencesFor = "migrant", depVar = "ASMMAT")
varList   <- lapply(varGroups, FUN = function (v) {
    existsBackgroundVariables (dat=data.timss1[[1]], variable=v)
})

test_that("error occurs because some variable groups must have only one element", {
  expect_error(checkBackgroundVariables (varList, len1 = c("ID", "wgt", "depVar"),overlap = list(v1 = list(vars = c("covars","differencesFor"), len = 1))))
})


