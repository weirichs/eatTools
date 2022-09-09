descr <- function(variable,na=NA, p.weights = NULL, na.rm = FALSE, verbose=TRUE) {
         suppressWarnings(variable <- asNumericIfPossible( data.frame(as.matrix(variable),stringsAsFactors = FALSE) , force.string = TRUE))
         unwgtN <- FALSE                                                        ### initialisieren: unweighted N? (das ist nur noetig, wenn descr() von eatRep::conv.mean() aufgerufen wird
         if(!is.null(p.weights)) {
             Mis.weight <- FALSE
             stopifnot( length(p.weights) == nrow(variable) )
             if(isTRUE(attr(p.weights, "onlyUnweightedN"))) {unwgtN <- TRUE}
         } else { Mis.weight <- TRUE}
         onlyMis  <- sapply(variable, FUN = function ( y ) { all( is.na(y) ) } )
         if(sum(onlyMis)>0) {
            if ( verbose ) {
                  cat("Following variables are excluded due to missing or non-numeric values: \n    ")
                  cat(paste0("'", paste(colnames(variable)[which(onlyMis)], collapse = "', '"), "' \n"))
            }
            variable <- variable[, -which(onlyMis), drop = FALSE ]
         }
         if ( ncol ( variable ) == 0 ) {
            if (verbose){cat("No non-missing numeric variables found.\n")}
            return(NULL)
         }
         ret      <- do.call("rbind", lapply(variable, FUN = function ( y ) {
                     if(isTRUE(Mis.weight)) {
                        Sum    <- sum(y, na.rm = na.rm)
                        Mean   <- mean(y, na.rm = na.rm)
                        Var    <- var(y, na.rm = na.rm)
                        N      <- length(y)
                        N.valid<- length(na.omit(y))
                        err    <- sd(y, na.rm = na.rm) / sqrt(length(na.omit(y)))
                     }
                     if(isFALSE(Mis.weight)) {
                        valid  <- which(!is.na(y))
                        if ( length(which(is.na(p.weights)))>0) { warning("Found ",length(which(is.na(p.weights))), " missing values on weighting variable.")  }
                        Sum    <- sum( y * p.weights , na.rm = na.rm)
                        Mean   <- weighted.mean(x = y, w = p.weights, na.rm = na.rm)
                        Var    <- wtdVar(x = y, weights = p.weights, na.rm = na.rm)
                        N      <- sum(p.weights)
                        N.valid<- sum(p.weights[valid])                         ### 't1' = erster Term der Formel
                        if(unwgtN) {
                           N      <- length(y)                                  ### wird ueberschrieben, wnn IMMER ungewichtete Ns berichtet werden sollen
                           N.valid<- length(na.omit(y))
                        }
                        t1     <- length(na.omit(y)) / ( (length(na.omit(y)) - 1) * sum(p.weights[valid])^2)
                        t2     <- sum(p.weights[valid]^2 * ((na.omit(y) - Mean)^2))
                        err    <- sqrt(t1*t2)                                   ### https://en.wikipedia.org/wiki/Weighted_arithmetic_mean
                     }                                                          ### Abschnitt 'Bootstrapping validation'
                     dataFrame <- data.frame ( N = N, N.valid = N.valid, Missing = length(y) - length(na.omit(y)), Minimum = min(y, na.rm = na.rm), Maximum = max(y, na.rm = na.rm), Sum = Sum, Mean = Mean, std.err = err, sig = ifelse(length(table(y))==1, NA, t.test(x = y)$p.value), Median = median(y, na.rm = na.rm), SD = sqrt(Var), Var = Var , stringsAsFactors = FALSE )
                     return(dataFrame)} ))
         rownames(ret) <- colnames(variable)
         return(ret)}
