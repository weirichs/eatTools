na_omit_selection <- function ( dat, varsToOmitIfNA) {
                     if ( !"data.frame" %in% class(dat)) {stop("Objekt 'dat' must be of class 'data.frame'.")}
                     allVar<- list(varsToOmitIfNA = varsToOmitIfNA)
                     allNam<- lapply(allVar, FUN=function(ii) {existsBackgroundVariables(dat = dat, variable=ii)})
                     datr  <- as.data.frame ( na.omit(data.table::as.data.table(dat), cols = allNam[["varsToOmitIfNA"]]))
                     return(datr)}
