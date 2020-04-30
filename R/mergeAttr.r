### mergen mit Attributen, das kann 'merge()' nicht:
### http://stackoverflow.com/questions/20306853/maintain-attributes-of-data-frame-columns-after-merge
mergeAttr <- function ( x, y, by = intersect(names(x), names(y)), by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all, sort = TRUE, suffixes = c(".x",".y"), setAttr = TRUE, onlyVarValLabs = TRUE, homoClass = TRUE) {
     ### erstmal von allen by-variablen die Klassen homogenisieren, falls gewuenscht
             byvars<- data.frame ( x=by.x, y=by.y, clx = sapply(x[,by.x,drop=FALSE], class), cly = sapply(y[,by.y,drop=FALSE], class), stringsAsFactors = FALSE)
             for ( i in 1:nrow(byvars) ) {
                   if ( length(unique(unlist(byvars[i,c("clx", "cly")]))) > 1 ) {
                        cat(paste0("   Merging variable pair '", paste(unlist(byvars[i,c("x", "y")]), collapse = "'<==>'"), "' has different classes: '", paste(unlist(byvars[i,c("clx", "cly")]), collapse = "'<==>'"),"'. Classes will be homogenized to 'character'.\n   Use 'homoClass = FALSE' to depreciate this behavior.\n"))
                        if ( byvars[i,"clx"] != "character" ) { x[, byvars[i,"x"]] <- as.character(x[, byvars[i,"x"]]) }
                        if ( byvars[i,"cly"] != "character" ) { y[, byvars[i,"y"]] <- as.character(y[, byvars[i,"y"]]) }
                   }
             }
     ### jetzt mergen und DANACH die Attribute rekonstruieren
             datM  <- merge ( x=x, y=y, by.x=by.x, by.y=by.y, all=all, all.x=all.x, all.y=all.y, sort=sort, suffixes =suffixes)
             if ( setAttr == TRUE ) {
                   dats<- list(x=x, y=y)
                   for ( d in names(dats)) {
                         for ( v in colnames(dats[[d]])) {
                               vsuf <- paste0(v, suffixes[2])
                               if ( vsuf %in% colnames(datM) ) {
                                    if ( onlyVarValLabs == FALSE ) {
                                         attributes(datM[,vsuf]) <- attributes(dats[[d]][,v])
                                    }  else  {
                                         attr(datM[,vsuf], "varLabel") <- attr(dats[[d]][,v], "varLabel")
                                         attr(datM[,vsuf], "valLabel") <- attr(dats[[d]][,v], "valLabel")
                                    }
                               }  else  {
                                    if ( v %in% colnames(datM) ) {
                                         if ( onlyVarValLabs == FALSE ) {
                                              attributes(datM[,v]) <- attributes(dats[[d]][,v])
                                         }  else  {
                                              attr(datM[,v], "varLabel") <- attr(dats[[d]][,v], "varLabel")
                                              attr(datM[,v], "valLabel") <- attr(dats[[d]][,v], "valLabel")
                                         }
                                    }
                               }
                         }
                   }
             }
             return(datM)}