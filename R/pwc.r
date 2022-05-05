# part-whole correlation
pwc <- function(dat) {
            dat <- makeDataFrame(dat)
            cl  <- all(sapply(dat, inherits, what = c("numeric", "integer")))
            if ( !cl) {
                 warning("All columns in 'dat' must be numeric or integer.")
                 dat <- asNumericIfPossible(dat, force.string = FALSE)
            }
            ret <- sapply(colnames(dat), FUN = function(i) {
                    if(inherits(try(res <- cor(dat[,i],rowMeans(dat[,-match(i, colnames(dat)), drop = FALSE],na.rm = TRUE) ,use = "complete.obs"), silent = TRUE  ),"try-error"))  {
                       res <- NA
                    }
                    return(res)})
    ### der Vollstaendigkeit halber jetzt noch konventionelle Korrelation (ohne dass das Item ausgeschlossen wird)
            dat2<- dat
            dat2[,"additionalRowMean"] <- rowMeans(dat2, na.rm=TRUE)
            cor1<- cor(dat2, use="pair")
            cor1<- data.frame ( item = rownames(cor1)[-nrow(cor1)], corr = cor1[-nrow(cor1),ncol(cor1)], stringsAsFactors = FALSE)
            ret <- merge(cor1, data.frame(item=colnames(dat), partWholeCorr = ret,stringsAsFactors = FALSE), by="item", all=TRUE, sort = FALSE)
            return(ret)}
