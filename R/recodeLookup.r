# var    ... variable
# lookup ... data.frame mit zwei spalten; erste spalte: alte Werte; zweite Spalte: neue Werte
recodeLookup <- function (var, lookup) {
     if(ncol(lookup) != 2) {stop("The lookup table must have two colums.")}     ### checks ...
     cls    <- sapply(lookup, class)
     if (length(unique(cls)) != 1 ) {warning("Old and new values in lookup table have different classes.")}
     if ( cls[1] != class(var) ) {warning("'var' has class '",class(var), "', old values in lookup table have class '",cls[1],"'.")}
     if(length(unique(lookup[,1])) < nrow(lookup) ) { warning("Old values in lookup table are not unique.")}
     colnames(lookup) <- c("new", "value_new")
     nam    <- "new"
     rec_dt <- data.table::as.data.table(data.frame ( old = var, new = var, stringsAsFactors = FALSE))
     rec_dt[lookup, on = nam, (nam) := i.value_new]
     return(rec_dt$new)}

