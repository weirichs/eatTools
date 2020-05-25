## quiets concerns of R CMD check regarding NSE by data.table
utils::globalVariables(c(".", "wgt", "variable"))

wtdTable <- function ( x, weights, na.rm = FALSE) {
            frm   <- data.frame ( variable=x, wgt=weights, stringsAsFactors=FALSE)
            if ( na.rm == TRUE ) {frm <- na.omit(frm)}
            Table <- as.data.frame(setDT(frm)[, .(n = sum(wgt)), variable])
            Table <- facToChar(Table)
            tab   <- Table[sort(Table[,"variable"],index.return=TRUE)$ix, "n"]
            names(tab) <- sort(Table[,"variable"])
            return(tab)}

