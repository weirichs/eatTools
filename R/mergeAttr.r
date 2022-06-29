mergeAttr <- function ( x, y, by = intersect(names(x), names(y)), by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all, sort = TRUE, suffixes = c(".x",".y"), setAttr = TRUE, onlyVarValLabs = TRUE, homoClass = TRUE, unitName = "unit", xName = "x", yName = "y", verbose = c("match", "unique", "class", "dataframe")) {
     ### verbose setzen
             verb  <- setVerbose(verbose, choices = c("match", "unique", "class", "dataframe"))
     ### das muessen data.frames sein
             x <- makeDataFrame(x)
             y <- makeDataFrame(y)
             byvars<- data.frame ( x=by.x, y=by.y, clx = sapply(x[,by.x,drop=FALSE], FUN = function(z) {paste(class(z),collapse="_")}), cly = sapply(y[,by.y,drop=FALSE], FUN = function(z) {paste(class(z),collapse="_")}), stringsAsFactors = FALSE)
     ### pruefen, ob die level der by-variablen in dem anderen datensatz enthalten sind
             levs  <- apply(X=byvars, MARGIN = 1, FUN = function (v) {
                      nix <- setdiff(unique(y[,v[["y"]]]), unique(x[,v[["x"]]]))
                      if ("match" %in% verb) {if(length(nix)>0) {message(paste0(length(nix), " of ",length(unique(y[,v[["y"]]])), " " , unitName,"(s) of merging variable '",v[["y"]],"' from data set '",yName,"' not included in data set '",xName,"'."))}}
                      niy <- setdiff(unique(x[,v[["x"]]]), unique(y[,v[["y"]]]))
                      if ("match" %in% verb) {if(length(niy)>0) {message(paste0(length(niy), " of ",length(unique(x[,v[["x"]]])), " ", unitName,"(s) of merging variable '",v[["x"]],"' from data set '",xName,"' not included in data set '",yName,"'."))}} })
     ### pruefen, ob die level der by-variablen unique sind
             if ( nrow(byvars)>1) {
                   xvar<- set.col.type(x[,byvars[,"x"]])
                   txt <- paste0("paste(",paste("xvar[,",1:ncol(xvar), "]", collapse=", "), ", sep=\"_\")")
                   xby <- eval(parse(text=txt))
                   yvar<- set.col.type(y[,byvars[,"y"]])
                   txt <- paste0("paste(",paste("yvar[,",1:ncol(yvar), "]", collapse=", "), ", sep=\"_\")")
                   yby <- eval(parse(text=txt))
             }  else  {
                   xby <- x[,byvars[1,"x"]]
                   yby <- y[,byvars[1,"y"]]
             }
             if ("unique" %in% verb) {if ( length(xby) != length(unique(xby))) { message("Merging levels are not unique in data set '", xName, "'.")}}
             if ("unique" %in% verb) {if ( length(yby) != length(unique(yby))) { message("Merging levels are not unique in data set '", yName, "'.")}}
     ### von allen by-variablen die Klassen homogenisieren, falls gewuenscht
             for ( i in 1:nrow(byvars) ) {
                   if ( length(unique(unlist(byvars[i,c("clx", "cly")]))) > 1 ) {
                        if ( isTRUE(homoClass)) {
                            if ("class" %in% verb) {message(paste0("   Merging variable pair '", paste(unlist(byvars[i,c("x", "y")]), collapse = "'<==>'"), "' has different classes: '", paste(unlist(byvars[i,c("clx", "cly")]), collapse = "'<==>'"),"'. Classes will be homogenized to 'character'.\n   Use 'homoClass = FALSE' to suppress this behavior."))}
                            if ( byvars[i,"clx"] != "character" ) { x[, byvars[i,"x"]] <- as.character(x[, byvars[i,"x"]]) }
                            if ( byvars[i,"cly"] != "character" ) { y[, byvars[i,"y"]] <- as.character(y[, byvars[i,"y"]]) }
                        }  else  {
                            if ("class" %in% verb) {message(paste0("   Merging variable pair '", paste(unlist(byvars[i,c("x", "y")]), collapse = "'<==>'"), "' has different classes: '", paste(unlist(byvars[i,c("clx", "cly")]), collapse = "'<==>'"),"'.\n   Use 'homoClass = TRUE' to homogenize classes."))}
                        }
                   }
             }
     ### jetzt mergen und DANACH die Attribute rekonstruieren
             datM  <- merge ( x=x, y=y, by.x=by.x, by.y=by.y, all=all, all.x=all.x, all.y=all.y, sort=sort, suffixes =suffixes)
             if ( isTRUE(setAttr) ) {
                   dats<- list(x=x, y=y)
                   for ( d in names(dats)) {
                         for ( v in colnames(dats[[d]])) {
                               vsuf <- paste0(v, suffixes[2])
                               if ( vsuf %in% colnames(datM) ) {
                                    if ( onlyVarValLabs == FALSE ) {
                                         if(!is.null(attributes(dats[[d]][,v]))) {attributes(datM[,vsuf]) <- attributes(dats[[d]][,v])}
                                    }  else  {
                                         if(!is.null(attr(dats[[d]][,v], "varLabel"))) {attr(datM[,vsuf], "varLabel") <- attr(dats[[d]][,v], "varLabel")}
                                         if(!is.null(attr(dats[[d]][,v], "valLabel"))) {attr(datM[,vsuf], "valLabel") <- attr(dats[[d]][,v], "valLabel")}
                                    }
                               }  else  {
                                    if ( v %in% colnames(datM) ) {
                                         if ( onlyVarValLabs == FALSE ) {
                                              if(!is.null(attributes(dats[[d]][,v]))) {attributes(datM[,v]) <- attributes(dats[[d]][,v])}
                                         }  else  {
                                              if(!is.null(attr(dats[[d]][,v], "varLabel"))) {attr(datM[,v], "varLabel") <- attr(dats[[d]][,v], "varLabel")}
                                              if(!is.null(attr(dats[[d]][,v], "valLabel"))) {attr(datM[,v], "valLabel") <- attr(dats[[d]][,v], "valLabel")}
                                         }
                                    }
                               }
                         }
                   }
             }
             return(datM)}

### hilfsfunktion fuer mergeAttr()
setVerbose <- function(verbose, choices){
    if(is.logical(verbose)) {
       stopifnot(length(verbose) == 1)
       if ( isTRUE(verbose)) {
            verbose <- choices
       } else {
            verbose <- ""
       }
    }  else  {
       verbose <- match.arg(verbose, choices = choices, several.ok = TRUE)
    }
    return(verbose)}
