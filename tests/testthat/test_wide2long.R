context("Wide to long")

datWide <- data.frame ( id = paste0("P",1:5), weight = abs(rnorm(5,10,1)),
                        country = c("USA", "BRA", "TUR", "GER", "AUS"),
                        sex = factor(c("female", "male", "female", "female", "male")),
                        matrix(data = rnorm(n=15, mean = 500, sd = 75),
                               nrow=5, dimnames = list(NULL, paste0("mat.pv", 1:3))),
                        matrix(data = rnorm(n=15, mean = 480, sd = 80),
                               nrow=5, dimnames = list(NULL, paste0("sci.pv", 1:3))),
                        stringsAsFactors=FALSE)
datLong <- wideToLong(datWide = datWide, noImp = c("id", "weight", "country", "sex"),
                      imp = list ( math = paste0("mat.pv", 1:3),
                                   science = paste0("sci.pv", 1:3)))

###
test_that("wide to long", {
  expect_equal(nrow(datLong), 15)
  expect_equal(datLong$id, c(rep(paste0("P", 1:5), 3)))
  expect_equal(datLong$imp, c(rep(1, 5), rep(2, 5), rep(3, 5)))
})


