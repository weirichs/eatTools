wtdVar <- function ( x , weights , na.rm = FALSE) {
    checkmate::assert_numeric(x)
    checkmate::assert_numeric(weights, lower = 0)
    if (na.rm) {
      na <- is.na(x) | is.na(weights)
      x <- x[!na]
      weights <- weights[!na]
    }
    out <- sum(weights * (x - weighted.mean(x, weights)) ^ 2) / (sum(weights) - 1)
    return(out)}
