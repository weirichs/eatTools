### keep = unbenutze wertelabels behalten?
### also wenn Variable x den Wert 6 = 'keine Angabe' gar nicht enthaelt, soll dann trotzdem ein Label
### dafuer geschrieben werden?
createSpssSyntaxSnippet <- function ( dat , file, keep = TRUE ) {
      sink(file=file)
    ### Schritt 1: Variablenlabels
      cat("  VARIABLE LABELS\n")
      for ( i in 1:ncol(dat)) {
            varLab <- attr(dat[,i],"varLabel")
            if ( length(varLab)>0) { cat(paste0("    ",colnames(dat)[i], " \"",varLab,"\" \n"))}
      }
      cat(".\n \n")
    ### Schritt 2: Wertelabels
      for ( i in 1:ncol(dat)) {
            valLab <- attr(dat[,i],"valLabel")
            if ( length(valLab)>0) {
                 if ( keep == FALSE ) {
                      weg <- setdiff ( valLab, dat[,i])
                      if ( length(weg)>0) { valLab <- valLab[-match(weg, valLab)] }
                 }
                 cat(paste(paste0("add value labels ", colnames(dat)[i]), valLab, paste0("'",names(valLab),"'"), sep=" ", collapse = ".\n"))
                 cat(".\n")
            }
      }
    ### Schritt 3: nach dem letzten Wertelabel muss Schraegstrich durch Punkt ersetzt werden
      cat("EXECUTE.\n")
      sink() }

### transformiert spss labels in zkd konvention ... achtung! das macht spss liste zu spss data.frame!
convertLabel <- function ( spssList , stringsAsFactors = TRUE, useZkdConvention = TRUE, replaceSpecialSigns = TRUE) {
                if ( "data.frame" %in% class(spssList )) { stop ( "'spssList' must not be of class 'data.frame'.\n")}
                varLabs<- attr(spssList, "variable.labels")
                valLabs<- lapply ( spssList, attr, "value.labels")
                if ( replaceSpecialSigns == TRUE ) {
                     varLabs <- gsubAll ( string = varLabs, old = c("ä", "ü", "ö", "ß", "Ü"), new = c("ae", "ue", "oe", "ss", "Ue"))
                     valLabs <- lapply ( valLabs, FUN = function ( w ) {
                                if ( !is.null(w)) {
                                     names(w) <- gsubAll ( string = names(w), old = c("ä", "ü", "ö", "ß", "Ü"), new = c("ae", "ue", "oe", "ss", "Ue"))
                                }
                                return(w) } )
                }
                if ( useZkdConvention == TRUE ) { zielnam <- c("varLabel", "valLabel") }  else  { zielnam <- c("variable.labels", "value.labels") }
                datFr  <- data.frame ( spssList, stringsAsFactors = stringsAsFactors)
                for ( u in 1:ncol(datFr)) {
                      if ( !is.na(varLabs[colnames(datFr)[u]] )) { attr(datFr[,u], zielnam[1]) <- varLabs[[u]]}
                      if ( !is.null(valLabs[[colnames(datFr)[u]]] )) { attr(datFr[,u], zielnam[2]) <- valLabs[[u]]}
                }
                return(datFr)}

### mergen mit Attributen, das kann 'merge()' nicht:
### http://stackoverflow.com/questions/20306853/maintain-attributes-of-data-frame-columns-after-merge
mergeAttr <- function ( x, y, by = intersect(names(x), names(y)), by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all, sort = TRUE, suffixes = c(".x",".y"), setAttr = TRUE, onlyVarValLabs = TRUE, homoClass = TRUE) {
     ### erstmal von allen by-variablen die Klassen homogenisieren, falls gewuenscht
             byvars<- data.frame ( x=by.x, y=by.x, clx = sapply(x[,by.x,drop=FALSE], class), cly = sapply(y[,by.y,drop=FALSE], class), stringsAsFactors = FALSE)
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

multiseq <- function ( v ) {
		names ( v ) <- seq ( along = v )
		s <- mapply ( function ( vv , v ) {
								vvv <- v[v==vv]
								s <- seq ( along = vvv )
								names ( s ) <- names( vvv )
								return ( s )
					} , unique ( v ) , MoreArgs = list ( v ) , USE.NAMES = FALSE , SIMPLIFY = FALSE )
		s <- do.call ( "c" , s )
		s <- unname ( s [ match ( names ( v ) , names ( s ) ) ] )
		return(s)
}



### 16. April 2012
### wandelt kontinuierliche in kategorielle Variable um (eine der aeltesten Operationen in R)
num.to.cat <- function(x, cut.points, cat.values = NULL)    {
              stopifnot(is.numeric(x))
              if(is.null(cat.values)) {cat.values <- 1:(length(cut.points)+1)}
              stopifnot(length(cut.points)+1 == length(cat.values))
              isNa<- which ( is.na ( x ) )
              ret <- rep ( cat.values[1], times = length(x))
              for ( a in 1:length(cut.points) ) {
                   crit <- which(x > cut.points[a])
                   if ( length(crit) > 0 ) { ret[crit] <- cat.values[a+1] }
              }
              if ( length ( isNa ) > 0 ) { ret[isNa] <- NA }
              attr(ret, "cat.values") <- cat.values
              return(ret)}



### Hilfsfunktion, wie table(), nur mit festen Werten
### z.B. table.muster(a, c(1,5,7,8,9)) sucht, wie oft jede Zahl in "mustervektor" in "vektor" vorkommt
### Warnung, wenn zusaetzliche Zahlen in Vektor stehen
tablePattern <- function(x, pattern = NULL, weights, na.rm = TRUE, useNA = c("no", "ifany", "always")) {
               if(length(pattern)>0) {
                  additional.values <- na.omit( setdiff(x,pattern))
                  if( length( additional.values ) > 0 )   {
                     cat("Warning: Found additional values not defined in 'pattern':\n")
                     cat(paste(additional.values,collapse=", ")); cat("\n")
                     cat("Concatenate additional values to 'pattern'.\n")
                     pattern <- c(pattern, additional.values)
                  }
                  notInData <- setdiff(pattern, x)
                  if ( length(notInData) > 0) {
                       x <- factor(x, levels = as.character(pattern))
                  }
                }
                  if(missing(weights)) {
                     Table <- table(x, useNA =useNA )
                  }  else  {
                     if ( length(notInData) > 0) {
                          x <- c(x, notInData)
                          weights<- c(weights, rep(0, length(notInData)))
                     }
                     Table <- wtd.table(x = x, weights = weights, na.rm =na.rm  )$sum.of.weights
                  }
                return(Table)}





aggregateDataOld <- function(all.daten,spalten, unexpected.pattern.as.na = TRUE, verboseAll = FALSE ) {
  if(missing(spalten)) {spalten <- colnames(all.daten)} else {spalten <- colnames(all.daten[,spalten,drop=FALSE])}
  noAgg <- setdiff(colnames(all.daten), spalten)
  daten <- all.daten[,spalten, drop=FALSE]
  foo   <- table(nchar(colnames(daten)))                       ### Haben alle Variablennamen die gleiche Anzahl Zeichen?
  if(length(foo)>1) {cat("Variable names with mixed numbers of characters.\n")}
  items     <- unique(substr(colnames(daten),1,nchar(colnames(daten))-1))                       ### wieviele Items wird es geben?
  cat(paste("Aggregate ",ncol(daten)," variable(s) to ",length(items)," item(s).\n",sep="")); flush.console()
  dat.sum <- NULL; dat.agg <- NULL; list.pc <- NULL            ### erstelle leere Datenobjekte fuer Summendatensatz, aggregierten Datensatz und Liste mit partial-credit-Items
  for (i in 1:length(items))      {
    sub.dat      <- data.frame ( lapply( data.frame(daten[, which(substr(colnames(daten),1,nchar(colnames(daten))-1) %in% items[i]), drop=FALSE ], stringsAsFactors = FALSE), as.numeric), stringsAsFactors = FALSE)
    ncol.sub.dat <- ncol(sub.dat)
    last.sign    <- names(table(substr(colnames(sub.dat),nchar(colnames(sub.dat)),nchar(colnames(sub.dat)))))
    toCheck      <- sum((last.sign)==letters[1:length(last.sign)])==length(last.sign)
    ### Check: Ist das letzte Zeichen des Variablennamens immer ein Buchstabe und aufsteigend?
    if(!toCheck) { cat(paste("Item ",items[i],": last character of variable names does not correspond to assumed alphabetic sequence.\n", sep="")); flush.console()}
    isNA         <- table(rowSums(is.na(sub.dat)))
    isNA.names   <- as.numeric(names(isNA))
    unexpected   <- setdiff(isNA.names, c(0,ncol.sub.dat))
    if( length( unexpected ) > 0  )   {
      cases      <- sum(as.numeric(isNA[as.character(unexpected)]))
      cat(paste("Caution! Found unexpected missing pattern in variables for item ",items[i], " in ",cases," cases.\n", sep= "" ) ) ; flush.console()
      whichUnexp <- which( rowSums(is.na(sub.dat)) %in% unexpected)
      if (verboseAll == TRUE) {cat("   Cases in question: "); cat(paste(whichUnexp, collapse=", ")); cat("\n")}
    }
    if(ncol.sub.dat == 1) {sub.dat[,"summe"] <- sub.dat[,1]}
    if(ncol.sub.dat >  1) {sub.dat[,"summe"] <- apply(sub.dat, 1, FUN = function ( uu ) {ifelse( all(is.na(uu)), NA, sum(uu, na.rm=!unexpected.pattern.as.na))}) }
    sub.dat[,"aggregiert"] <- ifelse(sub.dat$summe == ncol.sub.dat,1,0)
    if(is.null(dat.sum)) { dat.sum <- sub.dat[,"summe", drop=FALSE] }     else { dat.sum <- cbind(dat.sum,sub.dat[,"summe", drop=FALSE]) }
    if(is.null(dat.agg)) { dat.agg <- sub.dat[,"aggregiert",drop=FALSE] } else { dat.agg <- cbind(dat.agg,sub.dat[,"aggregiert",drop=FALSE]) }
    colnames(dat.sum)[i] <- items[i]
    colnames(dat.agg)[i] <- items[i]
    maximum <- max(dat.sum[,i],na.rm = TRUE)                ### ist das i-te Item partial credit?
    if(maximum>1) {list.pc <- rbind(list.pc, data.frame(Var=items[i],pc=paste(names(table(dat.sum[,i])),collapse=", "),max=max(as.numeric(names(table(dat.sum[,i])))),stringsAsFactors = FALSE))}}
  if(length(noAgg) > 0) {dat.sum <- data.frame(all.daten[,noAgg, drop=FALSE],dat.sum,stringsAsFactors = FALSE)
  dat.agg <- data.frame(all.daten[,noAgg, drop=FALSE],dat.agg,stringsAsFactors = FALSE)}
  return(list(sum=dat.sum, agg=dat.agg, pc.list=list.pc))}
