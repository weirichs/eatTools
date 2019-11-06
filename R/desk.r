desk <- function(variable,na=NA, p.weights = NULL, na.rm = FALSE) {
         suppressWarnings(variable <- asNumericIfPossible( data.frame(as.matrix(variable),stringsAsFactors = FALSE) , force.string = TRUE))
         if(!is.null(p.weights)) {
             Mis.weight <- FALSE
             stopifnot( length(p.weights) == nrow(variable) )
         } else { Mis.weight <- TRUE}
         onlyMis  <- sapply(variable, FUN = function ( y ) { all( is.na(y) ) } )
         if(sum(onlyMis)>0) {
            cat("Following variables are excluded due to missing or non-numeric values: \n    ")
            cat(paste0("'", paste(colnames(variable)[which(onlyMis)], collapse = "', '"), "' \n"))
            variable <- variable[, -which(onlyMis), drop = FALSE ]
         }
         if ( ncol ( variable ) == 0 ) {
            cat("No non-missing numeric variables found.\n")
            return(NULL)
         }
         ret      <- do.call("rbind", lapply(variable, FUN = function ( y ) {
                     if(Mis.weight == TRUE ) {
                        Summe      <- sum(y, na.rm = na.rm)
                        Mittelwert <- mean(y, na.rm = na.rm)
                        Varianz    <- var(y, na.rm = na.rm)
                        N          <- length(y)
                        N.valid    <- length(na.omit(y)) }
                     if(Mis.weight == FALSE ) {
                        Summe      <- sum( y * p.weights )
                        Mittelwert <- wtd.mean(x = y, weights = p.weights, na.rm = na.rm)
                        Varianz    <- wtd.var(x = y, weights = p.weights, na.rm = na.rm)
                        N          <- sum(p.weights)
                        N.valid    <- sum(p.weights[which(!is.na(y))]) }
                     dataFrame <- data.frame ( N = N, N.valid = N.valid, Missing = length(y) - length(na.omit(y)), Minimum = min(y, na.rm = na.rm), Maximum = max(y, na.rm = na.rm), Summe = Summe, Mittelwert = Mittelwert, std.err = sd(y, na.rm = na.rm) / sqrt(length(na.omit(y))), sig = ifelse(length(table(y))==1, NA, t.test(x = y)$p.value), Median = median(y, na.rm = na.rm), Streuung = sqrt(Varianz), Varianz = Varianz , stringsAsFactors = FALSE )
                     return(dataFrame)} ))
         rownames(ret) <- colnames(variable)
         return(ret)}