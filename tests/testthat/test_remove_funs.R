context("Remove functions")

###
test_that("Remove non numerics ", {
  expect_identical(removeNonNumeric("la0la"), "0")
})

test_that("Remove patterns ", {
  expect_identical(removePattern("la0la", "0"), "lala")
})


test_that("Remove non numerics ", {
  expect_identical(removeNumeric("la0la"), "lala")
})
