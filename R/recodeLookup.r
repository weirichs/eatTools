# var    ... variable
# lookup ... data.frame mit zwei spalten; erste spalte: alte Werte; zweite Spalte: neue Werte
recodeLookup <- function (var, lookup) {
     if(!is.data.frame(lookup) && !is.matrix(lookup)) {stop("The lookup table must be a data.frame or matrix.")}     ### checks ...
     if(ncol(lookup) != 2) {stop("The lookup table must have two colums.")}     ### checks ...
     if(length(unique(lookup[,1])) < nrow(lookup) ) { stop("Old values in lookup table are not unique.")}

     cls    <- sapply(lookup, class)
     if (length(unique(cls)) != 1 ) {warning("Old and new values in lookup table have different classes.")}
     if ( cls[1] != class(var) ) {warning("'var' has class '",class(var), "', old values in lookup table have class '",cls[1],"'.")}

     #browser()
     not_in_lookup <- setdiff(unique(var), lookup[, 1])
     add_lookup <- data.frame(not_in_lookup, not_in_lookup, stringsAsFactors = FALSE)
     names(add_lookup) <- names(lookup)
     lookup <- rbind(lookup, add_lookup)
     return(lookup[match(var, lookup[, 1]), 2])

     #colnames(lookup) <- c("new", "value_new")
     #nam    <- "new"
     #rec_dt <- data.table::as.data.table(data.frame ( old = var, new = var, stringsAsFactors = FALSE))
     #rec_dt[lookup, on = nam, (nam) := i.value_new]
     #return(rec_dt$new)
     }

