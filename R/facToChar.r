facToChar <- function ( dataFrame, from = "factor", to = "character" ) {
             dataFrame <- makeDataFrame(dataFrame)
             classes <- which( unlist(lapply(dataFrame,class)) == from)
             if(length(classes)>0) {
                for (u in classes) { eval(parse(text=paste("dataFrame[,u] <- as.",to,"(dataFrame[,u])",sep="") )) }}
             return(dataFrame)}
