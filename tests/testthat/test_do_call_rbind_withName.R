
df_list <- lapply(mtcars, function(x) {
  data.frame(m = mean(x), sd = sd(x))
})
df_list2 <- lapply(mtcars, function(x) {
  c(m = mean(x), sd = sd(x))
})

###
test_that("do call with rbind", {
  out <- do_call_rbind_withName(df_list, colName = "variable")
  expect_equal(names(out), c("variable", "m", "sd"))
  expect_equal(out[1, "m"], mean(mtcars[, 1]))
  expect_equal(out[10, "sd"], sd(mtcars[, 10]))
})

test_that("obscure colNames", {
  out <- do_call_rbind_withName(df_list, colName = "placeholder")
  expect_equal(names(out), c("placeholder", "m", "sd"))

  out2 <- do_call_rbind_withName(df_list, colName = "rep.name..nrow.df..")
  expect_equal(names(out2), c("rep.name..nrow.df..", "m", "sd"))
})

test_that("obscure other colNames", {
  df_list3 <- lapply(mtcars, function(x) {
    data.frame(placeholder = mean(x), "rep.name..nrow.df.." = sd(x))
  })

  expect_error(do_call_rbind_withName(df_list3, colName = "placeholder"),
               "'colName' is already in use in the elements of 'df_list'.")

  out2 <- do_call_rbind_withName(df_list3, colName = "variable")
  expect_equal(names(out2), c("variable", "placeholder", "rep.name..nrow.df.."))
})


test_that("errors", {
  expect_error(do_call_rbind_withName(df_list, colName = 1),
               "'colName' must be a character vector of length 1.")
  expect_error(do_call_rbind_withName(df_list, name = as.character(1:10), colName = "variable"),
               "'name' must be a character vector of identical length as 'df_list'.")
  expect_error(do_call_rbind_withName(df_list[[1]], colName = "variable"),
               "'df_list' must be a list of data.frames.")
  expect_error(do_call_rbind_withName(df_list2, colName = "variable"),
               "'df_list' must be a list of data.frames.")

  df_list[[2]] <- df_list[[2]][, 1, drop = FALSE]

  expect_error(do_call_rbind_withName(df_list, colName = "variable"),
               "numbers of columns of arguments do not match")

})
