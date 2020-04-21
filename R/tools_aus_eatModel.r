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
convertLabel <- function ( spssList , stringsAsFactors = TRUE, useZkdConvention = TRUE) {
                if ( "data.frame" %in% class(spssList )) { stop ( "'spssList' must not be of class 'data.frame'.\n")}
                varLabs<- attr(spssList, "variable.labels")
                valLabs<- lapply ( spssList, attr, "value.labels")
                if ( useZkdConvention == TRUE ) { zielnam <- c("varLabel", "valLabel") }  else  { zielnam <- c("variable.labels", "value.labels") }
                datFr  <- data.frame ( spssList, stringsAsFactors = stringsAsFactors)
                for ( u in 1:ncol(datFr)) {
                      if ( !is.null(varLabs[colnames(datFr)[u]]) && !is.na(varLabs[colnames(datFr)[u]] )) { attr(datFr[,u], zielnam[1]) <- varLabs[[u]]}
                      if ( !is.null(valLabs[[colnames(datFr)[u]]] )) { attr(datFr[,u], zielnam[2]) <- valLabs[[u]]}
                }
                return(datFr)}

createLabelList <- function ( dfr ) {
         stopifnot ( class(dfr) == "data.frame")
         varList<- do.call("rbind.fill", lapply(colnames(dfr), FUN = function ( v ) {
                   lbs  <- attributes(dfr[,v])
                   if (!is.null(lbs[["varLabel"]]))  {
                        varLab <- unlist(lbs[["varLabel"]])
                   }  else  {
                        varLab <- NA
                   }
                   if(!is.null(lbs[["valLabel"]]) && length(lbs[["valLabel"]])>0)  {
                        vals <- data.frame ( value = as.vector(unlist(lbs[["valLabel"]])), valLabel = names(lbs[["valLabel"]]), stringsAsFactors = FALSE)
                        ret <- data.frame ( varName = v, class = class(dfr[,v]), varLabel = varLab , vals[,c("value", "valLabel")], stringsAsFactors = FALSE)
                   }  else  {
                        ret <- data.frame ( varName = v, class = class(dfr[,v]), varLabel = varLab , stringsAsFactors = FALSE)
                   }
                   return(ret)}))
         return(varList)}


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


whereAre <- function(a,b,quiet=FALSE) {
            b <- data.frame(1:length(b),b,stringsAsFactors=FALSE)               ### zusaetzliche Syntaxbefehle sind notwendig, damit die Funktion mit missing values umgehen kann.
            if(sum(which(is.na(a)))>0)     {cat("a contains missing values. \n")}
            if(sum(which(is.na(b[,2])))>0) {cat("b contains missing values. \n")}
            if(length(na.omit(a)) > length(unique(na.omit(a))))     {cat("a contains duplicate elements. \n")}
            if(length(intersect(a,b[,2])) == 0) {
               cat("No common elements in a and b. \n")
               reihe <- NULL
            }  else {
               if(quiet==FALSE) { if(length(intersect(a,b[,2])) > 0) {if(length(setdiff(a,b[,2]))>0)      {cat("Not all Elemente of a included in b. \n")} } }
               a <- na.omit(unique(a))                                          ### Sofern vorhanden, werden missing values aus a entfernt
               b <- na.omit(b)                                                  ### Sofern vorhanden, werden missing values aus b entfernt; aber: Rangplatz der
               if(length(a)>0) {                                                ### der nicht fehlenden Elemente in b bleibt erhalten
                  reihe <- b[ which(b[,2] %in% a)  ,1]
                  if(quiet==FALSE) { cat(paste("Found",length(reihe),"elements.\n")) }
               }
               if(length(a)==0) {cat("No valid values in a.\n")}
            }
            return(reihe)}
