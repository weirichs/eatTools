context("frequency tables")

### example from wec paper
dat <- data.frame ( group = as.factor(c(rep(1,3), rep(2,2))), wgt = c(2/3, 4/3, 2, 3/8, 5/8))
t1  <- tablePattern(x=dat[,"group"],pattern = 0:2)
t2  <- tablePattern(x=dat[,"group"],pattern = 2:3)
t3  <- tablePattern(x=dat[,"group"],pattern = 0:3, weights = dat[,"wgt"])


###
test_that("unweighted and weighted frequency tables", {
  expect_equal(names(t1), as.character(0:2))
  expect_equal(as.numeric(t1), c(0,3,2))
  expect_equal(names(t2), as.character(c(2,3,1)))
  expect_equal(as.numeric(t2), c(2,0,3))
  expect_equal(names(t3), as.character(0:3))
  expect_equal(as.numeric(t3), c(0,4,1,0))
})


