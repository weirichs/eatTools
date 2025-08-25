mergeAttr <- function ( x, y, by = intersect(names(x), names(y)), by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all, sort = TRUE, suffixes = c(".x",".y"), setAttr = TRUE, onlyVarValLabs = TRUE, homoClass = TRUE, unitName = "unit", xName = "x", yName = "y", verbose = c("match", "unique", "class", "dataframe", "common", "convert")) {
             checkmate::assert_character(suffixes, len = 2, unique = TRUE)
             lapply(list(all, all.x, all.y, sort, setAttr, onlyVarValLabs, homoClass), checkmate::assert_logical, len = 1)
             lapply(list(unitName, xName, yName), checkmate::assert_character, len = 1)
     ### verbose setzen
             verb  <- setVerbose(verbose, choices = c("match", "unique", "class", "dataframe", "common", "convert"))
     ### das muessen data.frames sein
             x     <- makeDataFrame(x, verbose = "convert" %in% verb, name = xName)
             y     <- makeDataFrame(y, verbose = "convert" %in% verb, name = yName)
             byvars<- data.frame ( x=by.x, y=by.y, clx = sapply(x[,by.x,drop=FALSE], FUN = function(z) {paste(class(z),collapse="_")}), cly = sapply(y[,by.y,drop=FALSE], FUN = function(z) {paste(class(z),collapse="_")}), stringsAsFactors = FALSE)
     ### schauen, ob zusaetzlich zu den by-Variablen noch weitere gemeinsame Variablen in den Datensaetzen existieren
     ### die kriegen dann ja das suffix. Fall ja, message ausgeben
             comm  <- intersect(colnames(x), colnames(y))
             commby<- setdiff(comm, unique(unlist(byvars[,1:2])))
             if(length(commby)>0) {
                if ("common" %in% verb) {
                    cat(paste0("Additional common variables (beyond the 'by'-variables) found: '",paste(commby, collapse="', '"), "'. Add suffixes '",paste(suffixes, collapse="', '"), "' to these variables in the result data.frame.\n"))
                }
             }
     ### missings auf merge-Variablen?
             foox  <- lapply(byvars[,"x"], FUN = function (vx) { if ( length(which(is.na(x[,vx]))) > 0) {warning(paste0("Merging variable '",vx,"' in dataset '",xName,"' contains ",length(which(is.na(x[,vx])))," missing values."))}})
             fooy  <- lapply(byvars[,"y"], FUN = function (vy) { if ( length(which(is.na(y[,vy]))) > 0) {warning(paste0("Merging variable '",vy,"' in dataset '",yName,"' contains ",length(which(is.na(y[,vy])))," missing values."))}})
     ### pruefen, ob die level der by-variablen in dem anderen datensatz enthalten sind
             levs  <- unlist(Filter(Negate(is.null),apply(X=byvars, MARGIN = 1, FUN = function (v) {
                      nix <- setdiff(unique(y[,v[["y"]]]), unique(x[,v[["x"]]]))
                      if ("match" %in% verb) {if(length(nix)>0) {cat(paste0(length(nix), " of ",length(unique(y[,v[["y"]]])), " " , unitName,"(s) of merging variable '",v[["y"]],"' from data set '",yName,"' not included in data set '",xName,"'.\n"))}}
                      niy <- setdiff(unique(x[,v[["x"]]]), unique(y[,v[["y"]]]))
                      if ("match" %in% verb) {if(length(niy)>0) {cat(paste0(length(niy), " of ",length(unique(x[,v[["x"]]])), " ", unitName,"(s) of merging variable '",v[["x"]],"' from data set '",xName,"' not included in data set '",yName,"'.\n"))}}
                      if ( length(nix)>0 || length(niy)>0) {
                          ret <- eval(parse(text = paste0("list(notIn_",cleanifyString(xName)," = nix, notIn_",cleanifyString(yName)," = niy)")))
                          return(ret)}}, simplify = FALSE)), recursive = FALSE)
     ### pruefen, ob die level der by-variablen unique sind
             if ( nrow(byvars)>1) {
                   xvar<- x[,byvars[,"x"]] |> dplyr::mutate_all(as.character)
                   txt <- paste0("paste(",paste("xvar[,",1:ncol(xvar), "]", collapse=", "), ", sep=\"_\")")
                   xby <- eval(parse(text=txt))
                   yvar<- y[,byvars[,"y"]] |> dplyr::mutate_all(as.character)
                   txt <- paste0("paste(",paste("yvar[,",1:ncol(yvar), "]", collapse=", "), ", sep=\"_\")")
                   yby <- eval(parse(text=txt))
             }  else  {
                   xby <- x[,byvars[1,"x"]]
                   yby <- y[,byvars[1,"y"]]
             }
             if ("unique" %in% verb) {if ( length(xby) != length(unique(xby))) { cat(paste0("Merging levels are not unique in data set '",xName,"'.\n"))}}
             if ("unique" %in% verb) {if ( length(yby) != length(unique(yby))) { cat(paste0("Merging levels are not unique in data set '",yName,"'.\n"))}}
     ### pruefen, ob die Kombinationen der levels der by-variablen in dem anderen datensatz enthalten sind ...
     ### das natuerlich nur, wenn es mehr als eine by-variable gibt
             if ( nrow(byvars)>1) {
                   nix   <- setdiff(yby, xby)
                   if ("match" %in% verb && length(nix)>0 ) {
                      cat(paste0(length(nix), " of ",length(unique(yby)), " " , unitName,"(s) of merging variable combination '",paste(byvars[,"y"], collapse= "'+'"),"' from data set '",yName,"' not included in data set '",xName,"'.\n"))
                      levs[[paste0(paste(byvars[,"x"], collapse= "_"), "_notIn_",cleanifyString(xName))]] <- nix
                   }
                   niy   <- setdiff(xby, yby)
                   if ("match" %in% verb && length(niy)>0 ) {
                      cat(paste0(length(niy), " of ",length(unique(xby)), " " , unitName,"(s) of merging variable combination '",paste(byvars[,"x"], collapse= "'+'"),"' from data set '",xName,"' not included in data set '",yName,"'.\n"))
                      levs[[paste0(paste(byvars[,"x"], collapse= "_"), "_notIn_",cleanifyString(yName))]] <- niy
                   }
             }
     ### jetzt die nicht-matchbaren Datensatzteile zur Liste 'levs' hinzufuegen
             xOHNEy<- setdiff(xby, yby)
             levs[[paste0("noMatch_",cleanifyString(xName))]]<- x[whereAre(xOHNEy, xby, verbose=FALSE),]
             yOHNEx<- setdiff(yby, xby)
             levs[[paste0("noMatch_",cleanifyString(yName))]]<- y[whereAre(yOHNEx, yby, verbose=FALSE),]
     ### von allen by-variablen die Klassen homogenisieren, falls gewuenscht
             for ( i in 1:nrow(byvars) ) {
                   if ( length(unique(unlist(byvars[i,c("clx", "cly")]))) > 1 ) {
                        if ( isTRUE(homoClass)) {
                            if ("class" %in% verb) {cat(paste0("   Merging variable pair '", paste(unlist(byvars[i,c("x", "y")]), collapse = "'<==>'"), "' has different classes: '", paste(unlist(byvars[i,c("clx", "cly")]), collapse = "'<==>'"),"'. Classes will be homogenized to 'character'.\n   Use 'homoClass = FALSE' to suppress this behavior.\n"))}
                            if ( byvars[i,"clx"] != "character" ) { x[, byvars[i,"x"]] <- as.character(x[, byvars[i,"x"]]) }
                            if ( byvars[i,"cly"] != "character" ) { y[, byvars[i,"y"]] <- as.character(y[, byvars[i,"y"]]) }
                        }  else  {
                            if ("class" %in% verb) {cat(paste0("   Merging variable pair '", paste(unlist(byvars[i,c("x", "y")]), collapse = "'<==>'"), "' has different classes: '", paste(unlist(byvars[i,c("clx", "cly")]), collapse = "'<==>'"),"'.\n   Use 'homoClass = TRUE' to homogenize classes.\n"))}
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
             attr(datM, "diag") <- levs
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
