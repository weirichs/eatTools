### Matrix dreieckig machen
makeTria <- function(dfr) {
        dfr <- makeDataFrame(dfr)
        checkmate::assert_character(dfr[,1], unique = TRUE)
        cols <- sort(sapply(dfr[,-1, drop=FALSE], FUN = function (d) {length(which(is.na(d))) }))
        stopifnot(all(cols == 0:(ncol(dfr)-2)))
        rows <- sort(apply(dfr[,-1], MARGIN = 1, FUN = function (d) {length(which(is.na(d)))}), decreasing = TRUE, index.return=TRUE)
        stopifnot(all(sort(rows[["x"]]) == 0:(nrow(dfr)-1)))
        dfr  <- dfr[rows[["ix"]],c(colnames(dfr)[1], names(cols))]
        rownames(dfr) <- NULL
        return(dfr)}

