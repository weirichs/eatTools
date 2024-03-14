readMultisep <- function(file,sep) {
  checkmate::assert_file(file)
  checkmate::assert_character(sep)
  lines <- readLines(file)
  datf <- data.frame(do.call(rbind,strsplit(lines, sep, fixed = TRUE)), stringsAsFactors=FALSE)
  datf <- data.frame(lapply(datf,utils::type.convert,as.is=TRUE), stringsAsFactors=FALSE)
  return(datf)
}
