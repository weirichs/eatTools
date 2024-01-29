# var    ... variable
# lookup ... data.frame mit zwei spalten; erste spalte: alte Werte; zweite Spalte: neue Werte
recodeLookup <- function (var, lookup) {
        lookup <- makeDataFrame(lookup)
        if(ncol(lookup) != 2) {stop("The lookup table must have two colums.")}     ### checks ...
        if(length(unique(lookup[,1])) < nrow(lookup) ) { stop("Old values in lookup table are not unique.")}
        haven_labelled <- lapply(lookup, function(x) {
                classes <- class(x)
                if("haven_labelled" %in% classes) stop("Variable class 'haven_labelled' is not supported by recodeLookup.")
                })

        not_in_lookup <- setdiff(unique(var), lookup[, 1])
        add_lookup <- data.frame(not_in_lookup, not_in_lookup, stringsAsFactors = FALSE)
        names(add_lookup) <- names(lookup)
        lookup <- rbind(lookup, add_lookup)
        return(lookup[match(var, lookup[, 1]), 2])
}

