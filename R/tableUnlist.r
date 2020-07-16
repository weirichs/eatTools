### Hilfsfunktion, ersetzt table(unlist( ... ))
tableUnlist <- function(dataFrame, useNA = c("no","ifany", "always"))   {
                useNA<- match.arg(useNA)
                if( !"data.frame" %in% class(dataFrame) ) {
                   warning("Argument of 'tableUnlist' has to be of class 'data.frame'. Object will be converted to data.frame.")
                   dataFrame <- data.frame(dataFrame, stringsAsFactors=FALSE)
                }
                vek  <- do.call("c", lapply(dataFrame, FUN = function ( col ) { return(col)}))
                freqT<- table(vek, useNA = useNA)
                isna <- which(is.na(names(freqT)))
                if ( length(isna)>0) { names(freqT)[isna] <- "NA"}
                return(freqT)}
