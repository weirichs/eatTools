### wenn vars gleich NULL; werden alle Variablen genommen
wtdHetcor <- function ( dataFrame, vars=NULL, weights=NULL, out = c("wide", "long", "both")  ) {
        out    <- match.arg(arg = out, choices = c("wide", "long", "both"))
        if(!"data.frame" %in% class(dataFrame)) {stop("Object 'dataFrame' must be of class 'data.frame'.")}
        allVars<- list(vars = vars, weights = weights)
        if(is.null(vars)) {vars <- colnames(dataFrame)}
        allNam <- lapply(allVars, FUN=function(ii) {existsBackgroundVariables(dat = dataFrame, variable=ii)})
        dataFrame <- facToChar(dataFrame, from = "integer", to = "numeric")
        classes<- sort(unique(sapply(dataFrame[,allNam[["vars"]]], class)))
        if ( !all(classes %in% c("factor", "numeric")) ) {stop("All variables must be of class 'factor' or 'numeric'")}
        wb     <- ctype(dataFrame=dataFrame, vars = allNam[["vars"]])           ### workbook
        wb     <- do.call("rbind", alply(wb, .margins = 1, .fun = function ( z ) {
                  xvar<- dataFrame[,z[[2]]]
                  yvar<- dataFrame[,z[[1]]]
                  wvar<- dataFrame[,allNam[["weights"]]]
                  if (!is.null(allVars[["weights"]])) {                         ### z = 'zeile'
                      w <- ", weights = wvar"
                  }  else  {
                      w <- ""
                  }
                  na1 <- which(is.na(yvar))
                  na2 <- which(is.na(xvar))
                  if(length(na1)>0) {warning("Found ",length(na1)," missing values in variable '",z[[1]],"'")}
                  if(length(na2)>0) {warning("Found ",length(na2)," missing values in variable '",z[[2]],"'")}
                  if(length(na1)>0 | length(na2)>0) {
                     weg <- unique(c(na1, na2))
                     xvar<- xvar[-weg]
                     yvar<- yvar[-weg]
                     wvar<- wvar[-weg]
                  }
                  str1<- paste0("out <- weightedCorr(y=yvar, x=xvar, method = \"",z[[5]],"\"",w,")")
                  eval(parse(text=str1))
                  z[,"cor"] <- out
                  return(z)}))
        wide   <- data.table::dcast(wb, Var1~Var2, value.var = "cor")
        if ( out == "wide") {return(wide)}
        if ( out == "long") {return(wb)}
        if ( out == "both") {return(list ( long=wb, wide=wide))}}


### ctype = correlation type; Hilfsfunktion fuer 'wtdHetcor'
ctype <- function ( dataFrame, vars ) {
        komb   <- expand.grid(vars, vars, stringsAsFactors=FALSE)
        komb   <- komb[which(komb[,1] != komb[,2]),]
        komb[,"sort"] <- apply(komb, MARGIN = 1, FUN = function (zeile){paste(sort(zeile), collapse="_") })
        komb   <- komb[!duplicated(komb[,"sort"]),]
        komb   <- data.frame ( komb, class1 = NA, class2 = NA, stringsAsFactors = FALSE)
        for ( i in 1:nrow(komb)) { komb[i,"class1"] <- class(dataFrame[, komb[i,"Var1"]]); komb[i,"class2"] <- class(dataFrame[, komb[i,"Var2"]])}
        komb2  <- data.frame ( do.call("rbind", alply(komb, .margins = 1, .fun = function ( zeile) {
                  zle <- unlist(zeile)                                          ### wenn es eine Faktorvariable gibt, muss sie immer zuerst kommen
                  srt <- sort(zle[(length(zle)-1):length(zle)], index.return=TRUE)[["ix"]]
                  zle <- zle[c(srt, srt+3)]
                  if ( all(zle[3:4] == c("factor", "numeric"))) { zle <- c(zle, "Polyserial")}
                  if ( all(zle[3:4] == c("factor", "factor"))) { zle <- c(zle, "Polychoric")}
                  if ( all(zle[3:4] == c("numeric", "numeric"))) { zle <- c(zle, "Pearson")}
                  return(zle)}) ), stringsAsFactors=FALSE)
        colnames(komb2)[5] <- "method"
        return(komb2)}

