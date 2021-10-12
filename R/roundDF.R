
roundDF <- function(df, roundN = 3) {
  roundCol <- function(var, roundN) {
    if(!is.numeric(var)) return(var)
    round(var, digits = roundN)
  }

  out <- as.data.frame(lapply(df, roundCol, roundN = roundN), stringsAsFactors = FALSE)
  names(out) <- names(df)
  out
}
