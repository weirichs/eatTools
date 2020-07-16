
### example from wec paper
dat <- data.frame ( group = as.factor(c(rep(1,3), rep(2,2))), wgt = c(2/3, 4/3, 2, 3/8, 5/8))
con <- contr.wec.weighted(x= dat[,"group"], omitted=1,weights=dat[,"wgt"])
con1<- contr.wec.weighted(x= dat[,"group"], omitted=1,weights=rep(1,nrow(dat)))


###
test_that("weighted contrasts", {
  expect_equal(dim(con), 2:1)
  expect_equal(as.vector(con), c(-0.25,1))
  expect_equal(dim(con1), 2:1)
  expect_equal(as.vector(con1), c(-2/3,1))
})


test_that("weighted contrasts errors", {
  dat2 <- data.frame ( group = c(rep(1,3), rep(2,2)), wgt = c(2/3, 4/3, 2, 3/8, 5/8))
  expect_error(contr.wec.weighted(x= dat2[,"group"], omitted=1,weights=rep(1,nrow(dat))), "Variable 'x' must be of class 'factor'.")
})

test_that("weighted contrasts errors", {
  expect_error(contr.wec.weighted(x= dat[,"group"], omitted=4,weights=rep(1,nrow(dat))), "Level declared to be omitted ('4') does not exist in 'x' or has zero observations.", fixed = TRUE)
})
