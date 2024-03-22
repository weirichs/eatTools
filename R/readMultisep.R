
readMultisep <- function(file,sep,colnames=TRUE) {
  checkmate::assert_character(sep, len = 1)
  checkmate::assert_logical(colnames, len = 1)
  lines <- readLines(file)
  lines2 <- strsplit(lines, sep, fixed = TRUE)
  lines2 <- lapply(lines2, function(hh) hh <- gsub("\"", "", hh))
  if(colnames) {
    datf <- data.frame(do.call(rbind,lines2[-1]), stringsAsFactors=FALSE)
    names(datf) <- unlist(lines2[1])
  } else {
    datf <- data.frame(do.call(rbind,lines2), stringsAsFactors=FALSE)
  }
  datf <- data.frame(lapply(datf,utils::type.convert,as.is=TRUE), stringsAsFactors=FALSE)
  datf <- data.frame(lapply(datf, function(hh) if(is.character(hh)) {hh <- gsub("\"", "", hh)} else hh))
  return(datf)
}
