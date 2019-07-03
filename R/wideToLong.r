wideToLong <- function(datWide, noImp, imp) {
      allVars     <- list(noImp = noImp, imp = unlist(imp))                     ### untere zeile, checks: keine Variablen doppelt, Anzahl der Imputationen gleich
      all.Names   <- lapply(allVars, FUN=function(ii) {existsBackgroundVariables(dat = datWide, variable=ii)})
      if ( length(noImp) != length(unique(noImp))) { stop("Duplicated entries in vector of non-imputed variables.\n")}
      if ( length(unlist(imp)) != length(unique(unlist(imp)))) { stop("Duplicated entries in list of imputed variables.\n")}
      if ( length(table(sapply(imp, length))) != 1) {stop("Number of imputations vary between imputed variables.\n")}
      if ("imp" %in% c(noImp, unlist(imp))) {stop("'imp' is not allowed for variables names.\n")}
      if ("imp" %in% names(imp)) {stop("'imp' is not allowed for names of imputed variables.\n")}
      nimp <- unique(sapply(imp, length))
      datl <- do.call("rbind", lapply(1:nimp, FUN = function ( i ) {
              namo <- unlist(lapply(imp, FUN = function ( v ) { v[i]}))         ### alte Namen
              dat  <- datWide[,c(noImp, namo)]
              dat[,"imp"] <- i
              recSt<- paste("'",namo , "' = '" , names(imp),"'",sep="", collapse="; ")
              colnames(dat) <- recode(colnames(dat), recSt)
              return(dat)}))
      return(datl)}
