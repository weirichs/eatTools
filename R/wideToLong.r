wideToLong <- function(datWide, noImp, imp, multipleColumns = TRUE, variable.name = "variable", value.name = "value") {
      allVars     <- list(noImp = noImp, imp = unlist(imp))                     ### untere zeile, checks: keine Variablen doppelt, Anzahl der Imputationen gleich
      all.Names   <- lapply(allVars, FUN=function(ii) {existsBackgroundVariables(dat = datWide, variable=ii)})
      if ( length(noImp) != length(unique(noImp))) { stop("Duplicated entries in vector of non-imputed variables.")}
      if ( length(unlist(imp)) != length(unique(unlist(imp)))) { stop("Duplicated entries in list of imputed variables.")}
      if ( length(table(sapply(imp, length))) != 1) {stop("Number of imputations vary between imputed variables.")}
      if ("imp" %in% c(all.Names[["noImp"]], unlist(imp))) {stop("'imp' is not allowed for variables names.")}
      if ("imp" %in% names(imp)) {stop("'imp' is not allowed for names of imputed variables.")}
      if ( isFALSE(multipleColumns) ) {
          if ( "imp" %in% c(variable.name, value.name) ) {stop("'imp' is not allowed for 'variable.name' or 'value.name'.")}
      }
      nimp <- unique(sapply(imp, length))
      datl <- do.call("rbind", lapply(1:nimp, FUN = function ( i ) {
              namo <- unlist(lapply(imp, FUN = function ( v ) { v[i]}))         ### alte Namen
              if ( isTRUE(multipleColumns)) {
                   dat   <- datWide[,c(all.Names[["noImp"]], namo)]
                   lookup<- data.frame ( old = as.vector(unlist(namo)), new = names(imp), stringsAsFactors = FALSE)
                   colnames(dat) <- recodeLookup(colnames(dat), lookup)
              }  else  {
                   dat  <- data.frame(data.table::melt(data.table::as.data.table(datWide[,c(all.Names[["noImp"]], namo)]), id.vars = all.Names[["noImp"]], measure.vars = namo, variable.name = variable.name, value.name = value.name ,na.rm = TRUE), stringsAsFactors = FALSE)
              }
              dat[,"imp"] <- i
              return(dat)}))
      if ( isFALSE(multipleColumns)) {
          lookup <- data.frame ( old = as.vector(unlist(imp)), new = rep(names(imp),each = nimp), stringsAsFactors = FALSE)
          datl[,variable.name] <- recodeLookup(datl[,variable.name], lookup)
      }
      return(datl)}



