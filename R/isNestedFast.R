isNestedFast <- function(dat, idVar, varName) {
  ## checks
  if(!is.data.frame(dat)) stop("'dat' needs to be a data.frame.")
  if(!idVar %in% names(dat)) stop("'idVar' is not a variable in 'dat'.")
  if(!varName %in% names(dat)) stop("'varName' is not a variable in 'dat'.")

  ## most basic nested case
  if(nrow(dat) == length(unique(dat[[idVar]]))) return(TRUE)

  # .SD stands for Subset of Data created by by
  n_uniques <- data.table::data.table(dat)[, length(unique(.SD[[varName]])), by = idVar][[2]]
  all(n_uniques == 1)
}
