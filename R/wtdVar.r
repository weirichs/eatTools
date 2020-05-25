wtdVar <- function ( x , weights , na.rm = FALSE) {
    if (na.rm) {
      na <- is.na(x) | is.na(weights)
      x <- x[!na]
      weights <- weights[!na]
    }
    out <- sum(weights * (x - weighted.mean(x, weights)) ^ 2) / (sum(weights) - 1)
    return(out)}
