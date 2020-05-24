contr.wec.weighted <- function (x, omitted, weights) {
    if ( class(x) != "factor") {stop("Variable 'x' must be of class 'factor'.\n")}
    rawfreq <- table(x)
    if ( length( which(rawfreq == 0))>0) {cat(paste("Warning: Drop ",length( which(rawfreq == 0))," empty level(s): '",paste(names(rawfreq)[which(rawfreq ==0)], collapse="', '"),"'.\n",sep=""))}
    frequencies <- wtdTable(x, weights = weights)
    n.cat <- length(frequencies)
    omit  <- which(levels(droplevels(x)) == omitted)  
    if ( length(omit)==0){
        stop(paste("Level declared to be omitted ('",omitted,"') does not exist in 'x' or has zero observations.\n",sep=""))
    }
    new.contrasts <- contr.treatment(n.cat, base = omit)
    new.contrasts[omit, ] <- -1 * frequencies[-omit]/frequencies[omit]
    colnames(new.contrasts) <- names(frequencies[-omit])
    return(new.contrasts)}

wtdTable <- function ( x, weights, na.rm = FALSE) {
            frm   <- data.frame ( variable=x, wgt=weights, stringsAsFactors=FALSE)
            if ( na.rm == TRUE ) {frm <- na.omit(frm)}
            Table <- as.data.frame(setDT(frm)[, .(n = sum(wgt)), variable])
            Table <- facToChar(Table)
            tab   <- Table[sort(Table[,"variable"],index.return=TRUE)$ix, "n"]
            names(tab) <- sort(Table[,"variable"])
            return(tab)}


