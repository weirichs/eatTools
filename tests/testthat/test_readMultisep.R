
###
filePath <- tempfile(fileext = ".txt")
dat <- data.frame(v1 = c("0","300","e",NA),
                  v2=c(0, 90, 10000, NA),
                  v3=c("k","kk","kkk",NA),
                  v4=NA,
                  v5=c(0, 90, 100, 1))
write.table(dat, file = filePath, row.names = FALSE, col.names = TRUE, sep = "]&;")

test_that("test main functionality", {
  f1 <- readMultisep(filePath, sep="]&;")
  expect_equal(f1, dat)
})

write.table(dat, file = filePath, row.names = FALSE, col.names = FALSE, sep = "]&;")

test_that("test main functionality no colnames", {
  f1 <- readMultisep(filePath, sep="]&;", colnames=FALSE)
  names(dat) <- paste0("X", 1:5)
  expect_equal(f1, dat)
})
