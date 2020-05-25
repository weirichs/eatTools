
mtcars_all <- mtcars
mtcars_all[, "ID"] <- rownames(mtcars)
mtcars_p1 <- mtcars_all[1:5, c("ID", "mpg", "cyl")]
mtcars_p2 <- mtcars_all[4:9, c("ID", "hp", "drat")]

attr(mtcars_p1$mpg, "label") <- "some label"
attr(mtcars_p2$drat, "label") <- "some label 2"

test_that("mergeAttr", {
  out <- mergeAttr(mtcars_p1, mtcars_p2, all = TRUE, onlyVarValLabs = FALSE)
  expect_equal(attr(out$mpg, "label"), "some label")
  expect_equal(attr(out$drat, "label"), "some label 2")
})
