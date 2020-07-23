context("Weighted Heterogeneous Correlation Matrix")

###
timss1 <- readRDS("helper_timss1.rds")
long   <- readRDS("helper_timss1_hetcor_out.rds")
vars   <- c("books", "migrant", "ASSSCI")
out2   <- wtdHetcor(timss1, vars = vars, out="long")
out2[,"merge"] <- apply(out2, MARGIN = 1, FUN = function ( z ) { paste(sort(c(z[["Var1"]], z[["Var2"]])), collapse="_")})
long[,"merge"] <- apply(long, MARGIN = 1, FUN = function ( z ) { paste(sort(c(z[["Var1"]], z[["Var2"]])), collapse="_")})
out3 <- merge(long, out2, by="merge" )

### test ob es aequivalent ist
test_that("aequivalence", {
  expect_equal(round(out3[,"value"],3), round(out3[,"cor"],3))
})


