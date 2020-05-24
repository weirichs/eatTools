context("define weighted contrasts")

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


