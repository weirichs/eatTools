context("halveString")

str <- c("a__b__c", "a___m___k__")
d1  <- halveString(str, pattern = "__", colnames= c("a", "b"))
d2  <- halveString(str, pattern = "__", first=FALSE)

###
test_that("halveString", {
  expect_equal(class(d1), c("matrix", "array"))
  expect_equal(colnames(d1), c("a", "b"))
  expect_equal(colnames(d2), c("X1", "X2"))
  expect_equal(dim(d2), c(2,2))
  expect_equal(dim(d1), c(2,2))
  expect_equal(d1[,1], rep("a", 2))
  expect_equal(d1[,2], c("b__c", "_m___k__"))
  expect_equal(d2[,1], c("a__b", "a___m__"))
  expect_equal(d2[,2], c("c", "_k"))
})


