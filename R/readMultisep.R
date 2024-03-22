readMultisep <- function(file,sep,colnames=TRUE) {
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


