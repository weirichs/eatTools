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
test_that("halveString1", {
  str1<- c("a__b__c", "a___m___k__")
  d1  <- halveString(str1, pattern = "__", colnames= c("a", "b"))
  d2  <- halveString(str1, pattern = "__", first=FALSE)
  expect_equal(class(d1), c("matrix", "array"))
  expect_equal(colnames(d1), c("a", "b"))
  expect_equal(colnames(d2), c("X1", "X2"))
  expect_equal(dim(d2), c(2,2))
  expect_equal(dim(d1), c(2,2))
  expect_equal(d1[,1], rep("a", 2))
  expect_equal(d1[,2], c("b__c", "_m___k__"))
  expect_equal(d2[,1], c("a__b" ,"a___m___k"))
  expect_equal(d2[,2], c("c", NA))
})

test_that("halveString2", {
  str2<- c("a.b.c", "a.m.k.")
  d3  <- halveString(str2, pattern = "\\.", colnames= c("a", "b"))
  d4  <- halveString(str2, pattern = "\\.", first=FALSE)
  expect_equal(dim(d3), c(2,2))
  expect_equal(dim(d4), c(2,2))
  expect_equal(d3[,1], rep("a", 2))
  expect_equal(d3[,2], c("b.c", "m.k."))
  expect_equal(d4[,1], c("a.b" ,"a.m.k"))
  expect_equal(d4[,2], c("c", NA))
})


paths <- c("BB/DHW/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__DHW__ANCHOR.pvl", "BB/GL/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__GL__ANCHOR.pvl",  "BB/GM/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__GM__ANCHOR.pvl")
test_that("halveString3", {
  d1  <- halveString(paths, pattern = "__", colnames= c("a", "b"))
  expect_equal(d1[,"b"], c("DHW__ANCHOR.pvl", "GL__ANCHOR.pvl",  "GM__ANCHOR.pvl"))
  expect_equal(d1[,"a"], c("BB/DHW/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB", "BB/GL/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB", "BB/GM/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB"))
})

test_that("halveString4", {
  d1  <- halveString(paths, pattern = "__", first=FALSE, colnames= c("a", "b"))
  expect_equal(d1[,"b"], rep("ANCHOR.pvl", 3))
  expect_equal(d1[,"a"], c("BB/DHW/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__DHW", "BB/GL/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__GL","BB/GM/LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__GM"))
})

test_that("halveString5", {
  d1  <- halveString(paths, pattern = "/", first=FALSE, colnames= c("a", "b"))
  expect_equal(d1[,"b"], c("LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__DHW__ANCHOR.pvl", "LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__GL__ANCHOR.pvl",  "LV2011_MA_PV-Ziehung_ohneKBimHGM_BB__GM__ANCHOR.pvl"))
  expect_equal(d1[,"a"], c("BB/DHW", "BB/GL", "BB/GM" ))
})


