
addLeadingZerosToCharInt <- function(dat) {
  stopifnot(is.data.frame(dat))
  stopifnot(all(sapply(dat, is.character )))
  pattern <- "(^(-|\\+)?\\d+$)|(^(-|\\+)?(\\d*)e(-|\\+)?(\\d+)$)"
  elToCorrect <- lapply(dat,function(hh) grepl(pattern, hh)|is.na(hh))
  isna <- lapply(dat,function(hh) is.na(hh))
  lenToCorrect <- unlist(lapply(dat, FUN=function(ii) { max(nchar(c(ii,"a")),na.rm=TRUE)}))
  act <- sapply(seq(along=dat), function(jj) all(elToCorrect[jj][[1]]) & !all(isna[jj][[1]]) & lenToCorrect[jj]>1)
   if(any(act)) {
     dat[,act] <- data.frame(lapply(which(act), function(x) ifelse(is.na(dat[,x]), NA, formatC(as.numeric(dat[,x]), width = lenToCorrect[x], format = "d", flag = "0"))))
  }
  return(dat)
}
