makeDataFrame <- function(dat, name = "dat", minRow = 1, onlyWarn=TRUE) {
  if(inherits(dat, c("tbl", "data.table"))) {
    old_classes <- paste(class(dat), collapse="', '")
    message("Convert '", name, "' of class '", old_classes, "' to a data.frame.")
      dat <- data.frame ( dat, stringsAsFactors = FALSE)
  }
  if(!inherits(dat, c("data.frame"))) {
    stop("'", name, "' is neither a 'data.frame', 'tibble' or 'data.table' object.")
  }
    if(nrow(dat) < minRow) {
        if(onlyWarn) {
           warning("'",name,"' has only ",nrow(dat), " rows.")
        else  {
           stop("'",name,"' has only ",nrow(dat), " rows.")
        }
    }
  return(dat)}
