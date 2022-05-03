makeDataFrame <- function(dat, name = "dat") {
    if(!"data.frame" %in% class(dat) || "tbl" %in% class(dat) || "data.table" %in% class(dat) ) { cat(paste0("Convert '",name,"' of class '",paste(class(dat), collapse="', '"),"' to a data.frame.\n"))
        dat <- data.frame ( dat, stringsAsFactors = FALSE)}
    return(dat)}