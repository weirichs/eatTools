
#test_tbl <- tibble::as_tibble(mtcars)
#saveRDS(test_tbl, "tests/testthat/helper_tbl_mtcars.RDS")
mtcars_norownames <- mtcars
rownames(mtcars_norownames) <- NULL

test_that("data.table", {
  test_dt <- data.table::as.data.table(mtcars)
  expect_message(out <- makeDataFrame(test_dt),
                 "Convert 'dat' of class 'data.table', 'data.frame' to a data.frame.")
  expect_equal(out, mtcars_norownames)
})

test_that("tibble", {
  test_tbl <- readRDS("helper_tbl_mtcars.RDS")
  expect_message(out <- makeDataFrame(test_tbl),
                 "Convert 'dat' of class 'tbl_df', 'tbl', 'data.frame' to a data.frame.")
  expect_equal(out, mtcars_norownames)
})

test_that("data.frame", {
  expect_silent(out <- makeDataFrame(mtcars))
  expect_equal(out, mtcars)
})

test_that("other", {
  expect_error(out <- makeDataFrame(1),
               "'dat' is neither a 'data.frame', 'tibble' or 'data.table' object.")
})
