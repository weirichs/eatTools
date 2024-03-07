### Matrix dreieckig machen
makeTria <- function(dfr) {
        checkmate::assert_data_frame(dfr)
        cols <- sort(sapply(dfr[,-1, drop=FALSE],
                FUN = function (d) {min(which(!is.na(d))) }))
        dfr  <- dfr[,c(colnames(dfr)[1], names(cols))]
        rows <- sort(apply(dfr[,-1], MARGIN = 1,
                FUN = function (d) {max(which(!is.na(d)))}), decreasing=FALSE, index.return=TRUE)[["ix"]]
        dfr  <- dfr[rows,]
        rownames(dfr) <- NULL
        return(dfr)}



