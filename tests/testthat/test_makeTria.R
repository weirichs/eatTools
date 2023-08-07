
dfr <- data.frame(vars = paste0("var", 2:4), matrix(c(1:3, NA, NA, 5, 4,NA,6),
                                                      nrow=3, ncol=3, dimnames=list(NULL, paste0("var", 1:3))))

test_that("makeTria", {
  out <- makeTria(dfr)
  dfr_out <- dfr
  dfr_out[2, 3] <- 4
  dfr_out[1, 4] <- NA
  expect_equal(out, dfr_out)
})
