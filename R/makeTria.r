### Matrix dreieckig machen
makeTria <- function(dfr) {
        dfr <- makeDataFrame(dfr)
        cols <- sort(sapply(dfr[,-1, drop=FALSE], FUN = function (d) {length(which(is.na(d))) }))
        rows <- sort(apply(dfr[,-1], MARGIN = 1, FUN = function (d) {length(which(is.na(d)))}), decreasing = TRUE, index.return=TRUE)[["ix"]]
        dfr  <- dfr[rows,c(colnames(dfr)[1], names(cols))]
        rownames(dfr) <- NULL
        return(dfr)}
