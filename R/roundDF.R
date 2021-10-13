
roundDF <- function(dat, digits = 3) {
  if(!is.data.frame(dat)) stop("'dat' needs to be a data.frame.")
  if(!is.numeric(digits) || length(digits) != 1) stop("'digits' needs to be a numeric vector of length 1.")

  out <- as.data.frame(lapply(dat, roundCol, digits = digits), stringsAsFactors = FALSE)
  colnames(out) <- colnames(dat)
  rownames(out) <- rownames(dat)
  out
}

roundCol <- function(var, digits) {
  if(!is.numeric(var)) return(var)
  round(var, digits = digits)
}
