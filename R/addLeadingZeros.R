
addLeadingZerosToCharInt <- function(dat) {

  if(!is.data.frame(dat)) {
    stop("Argument dat must be a data.frame.")
  }
  is_character <- sapply(dat, is.character )
  if(!all(is_character)) {
    stop("All columns in dat need to be of class character.")
  }

  pattern <- "(^(-|\\+)?\\d+$)|(^(-|\\+)?(\\d*)e(-|\\+)?(\\d+)$)"
  elToCorrect <- lapply(dat,function(hh) grepl(pattern, hh)|is.na(hh))
  isna <- lapply(dat,function(hh) is.na(hh))
  lenToCorrect <- unlist(lapply(dat, FUN=function(ii) { max(nchar(c(ii,"a")),na.rm=TRUE)}))
  act <- sapply(seq(along=dat), function(jj) all(elToCorrect[jj][[1]]) & !all(isna[jj][[1]]) & lenToCorrect[jj]>1)
   if(any(act)) {
     dat[,act] <- data.frame(lapply(which(act), function(x) ifelse(is.na(dat[,x]), NA, stringi::stri_pad(dat[, x], width = lenToCorrect[x], side = "left", pad = "0"))))
  }
  return(dat)
}
