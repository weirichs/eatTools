### 16. April 2012
### wandelt kontinuierliche in kategorielle Variable um (eine der aeltesten Operationen in R)
num.to.cat <- function(x, cut.points, cat.values = NULL)    {
              stopifnot(is.numeric(x))
              if(is.null(cat.values)) {cat.values <- 1:(length(cut.points)+1)}
              stopifnot(length(cut.points)+1 == length(cat.values))
              isNa<- which ( is.na ( x ) )
              ret <- rep ( cat.values[1], times = length(x))
              for ( a in 1:length(cut.points) ) {
                   crit <- which(x > cut.points[a])
                   if ( length(crit) > 0 ) { ret[crit] <- cat.values[a+1] }
              }
              if ( length ( isNa ) > 0 ) { ret[isNa] <- NA }
              attr(ret, "cat.values") <- cat.values
              return(ret)}
