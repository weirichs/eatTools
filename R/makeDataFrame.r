makeDataFrame <- function(dat, name = "dat") {
  if(inherits(dat, c("tbl", "data.table"))) {
    old_classes <- paste(class(dat), collapse="', '")
    message("Convert '", name, "' of class '", old_classes, "' to a data.frame.")
      dat <- data.frame ( dat, stringsAsFactors = FALSE)
  }
  if(!inherits(dat, c("data.frame"))) {
    stop("'", name, "' is neither a 'data.frame', 'tibble' or 'data.table' object.")
  }
  return(dat)}
