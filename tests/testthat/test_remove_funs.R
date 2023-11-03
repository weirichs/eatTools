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


context("halveString")

###
test_that("halveString", {
  str1<- c("a__b__c", "a___m___k__")
  str2<- c("a.b.c", "a.m.k.")
  d1  <- halveString(str1, pattern = "__", colnames= c("a", "b"))
  d2  <- halveString(str1, pattern = "__", first=FALSE)
  testthat::expect_equal(class(d1), c("matrix", "array"))
  testthat::expect_equal(colnames(d1), c("a", "b"))
  testthat::expect_equal(colnames(d2), c("X1", "X2"))
  testthat::expect_equal(dim(d2), c(2,2))
  testthat::expect_equal(dim(d1), c(2,2))
  testthat::expect_equal(d1[,1], rep("a", 2))
  testthat::expect_equal(d1[,2], c("b__c", "_m___k__"))
  testthat::expect_equal(d2[,1], c("a__b" ,"a___m___k__"))
  testthat::expect_equal(d2[,2], c("c", NA))
  d3  <- halveString(str2, pattern = "\\.", colnames= c("a", "b"))
  d4  <- halveString(str2, pattern = "\\.", first=FALSE)
  testthat::expect_equal(dim(d3), c(2,2))
  testthat::expect_equal(dim(d4), c(2,2))
  testthat::expect_equal(d3[,1], rep("a", 2))
  testthat::expect_equal(d3[,2], c("b.c", "m.k."))
  testthat::expect_equal(d4[,1], c("a.b" ,"a.m.k."))
  testthat::expect_equal(d4[,2], c("c", NA))
})



