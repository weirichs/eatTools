makeDataFrame <- function(dat, name = "dat", minRow = 1, onlyWarn=TRUE, verbose=TRUE) {
  checkmate::assert_logical(onlyWarn, len = 1)
  checkmate::assert_logical(verbose, len = 1)
  if(inherits(dat, c("tbl", "data.table", "matrix", "list"))) {
    old_classes <- paste(class(dat), collapse="', '")
    if(verbose){message("Convert '", name, "' of class '", old_classes, "' to a data.frame.")}
      dat <- data.frame ( dat, stringsAsFactors = FALSE)
  }
  if(!inherits(dat, c("data.frame"))) {
    stop("'", name, "' is neither a 'data.frame', 'matrix', 'tibble' or 'data.table' object.")
  }
    if(nrow(dat) < minRow) {
        if(onlyWarn) {
           warning("'",name,"' has only ",nrow(dat), " rows.")
        }
        else  {
           stop("'",name,"' has only ",nrow(dat), " rows.")
        }
    }
  return(dat)}
