

x <- c(50, 0, 25)
w <- c(1, 5, 1)
##saveRDS(Hmisc::wtd.table(x, w), "C:/Benjamin_Becker/02_Repositories/packages/eatTools/tests/testthat/helper_hmisc_wtdtable.RDS")

hmisc_wtdtable <- readRDS("helper_hmisc_wtdtable.RDS")

test_that("wtdvar implementation", {
  out <- wtdTable(x, w)
  expect_equal(as.numeric(out), hmisc_wtdtable$sum.of.weights)
  expect_equal(as.numeric(names(out)), hmisc_wtdtable$x)
})
