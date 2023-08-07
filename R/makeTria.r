### Matrix dreieckig machen
makeTria <- function(dfr) {
        cols <- sort(sapply(dfr[,-1, drop=FALSE], FUN = function (d) {
          length(which(is.na(d)))
          }), decreasing =FALSE)
        dfr  <- dfr[,c(colnames(dfr)[1], names(cols))]
        rows <- sort(apply(dfr[,-1], MARGIN = 1, FUN = function (d) {
          length(which(is.na(d)))
          }), decreasing=TRUE, index.return=TRUE)[["ix"]]
        dfr  <- dfr[rows,]
        rownames(dfr) <- NULL
        return(dfr)}


