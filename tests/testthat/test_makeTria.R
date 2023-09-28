context("make matrix triangular")

###
dfr <- data.frame ( vars = paste0("var", 2:4), matrix(c(1:3, NA, NA, 5, 4,NA,6),
       nrow=3, ncol=3, dimnames=list(NULL, paste0("var", 1:3))))
dfr1<- makeTria(dfr)
test_that("aequivalence", {
   expect_equal(unname(unlist(dfr1[,-1])) , c(2, 1, 3,  NA, 4, 6 , NA,  NA, 5))
})

