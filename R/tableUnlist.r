### Hilfsfunktion, ersetzt table(unlist( ... ))
tableUnlist <- function(dataFrame, useNA = c("no","ifany", "always"))   {
                useNA<- match.arg(useNA)
                dataFrame <- makeDataFrame(dataFrame)
                vek  <- do.call("c", lapply(dataFrame, FUN = function ( col ) { return(col)}))
                freqT<- table(vek, useNA = useNA)
                isna <- which(is.na(names(freqT)))
                if ( length(isna)>0) { names(freqT)[isna] <- "NA"}
                return(freqT)}
