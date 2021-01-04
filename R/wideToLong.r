wideToLong <- function(datWide, noImp, imp) {
      allVars     <- list(noImp = noImp, imp = unlist(imp))                     ### untere zeile, checks: keine Variablen doppelt, Anzahl der Imputationen gleich
      all.Names   <- lapply(allVars, FUN=function(ii) {existsBackgroundVariables(dat = datWide, variable=ii)})
      if ( length(noImp) != length(unique(noImp))) { stop("Duplicated entries in vector of non-imputed variables.")}
      if ( length(unlist(imp)) != length(unique(unlist(imp)))) { stop("Duplicated entries in list of imputed variables.")}
      if ( length(table(sapply(imp, length))) != 1) {stop("Number of imputations vary between imputed variables.")}
      if ("imp" %in% c(all.Names[["noImp"]], unlist(imp))) {stop("'imp' is not allowed for variables names.")}
      if ("imp" %in% names(imp)) {stop("'imp' is not allowed for names of imputed variables.")}
      nimp <- unique(sapply(imp, length))
      datl <- do.call("rbind", lapply(1:nimp, FUN = function ( i ) {
              namo <- unlist(lapply(imp, FUN = function ( v ) { v[i]}))         ### alte Namen
              dat  <- datWide[,c(all.Names[["noImp"]], namo)]
              dat[,"imp"] <- i
              for ( j in 1:length(namo)) {                                      ### Funktion verwendet kein 'recode' aus 'car'
                 colnames(dat)[match(namo[j], colnames(dat))] <- names(imp)[j]
              }
              return(dat)}))
      return(datl)}
