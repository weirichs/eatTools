

x <- c(50, 0, 25)
w <- c(1, 5, 1)
##saveRDS(Hmisc::wtd.var(x, w), "C:/Users/benjb/Documents/Repositories/eatTools/tests/testthat/helper_hmisc_wtdvar.RDS")

hmisc_wtdvar <- readRDS("helper_hmisc_wtdvar.RDS")

test_that("wtdvar implementation", {
  expect_equal(wtdVar(x, w), hmisc_wtdvar)
})

