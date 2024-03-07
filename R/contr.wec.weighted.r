contr.wec.weighted <- function (x, omitted, weights) {
    #checkmate::assert_factor(x)
    if (!identical(class(x), "factor")) {stop("Variable 'x' must be of class 'factor'.")}
    checkmate::assert_character(omitted)
    checkmate::assert_numeric(weights, lower = 0)
    rawfreq <- table(x)
    if ( length( which(rawfreq == 0))>0) {warning("Drop ",length( which(rawfreq == 0))," empty level(s): '",paste(names(rawfreq)[which(rawfreq ==0)], collapse="', '"))}
    frequencies <- wtdTable(x, weights = weights)
    n.cat <- length(frequencies)
    omit  <- which(levels(droplevels(x)) == omitted)
    if ( length(omit)==0){
        stop("Level declared to be omitted ('",omitted,"') does not exist in 'x' or has zero observations.")
    }
    new.contrasts <- contr.treatment(n.cat, base = omit)
    new.contrasts[omit, ] <- -1 * frequencies[-omit]/frequencies[omit]
    colnames(new.contrasts) <- names(frequencies[-omit])
    return(new.contrasts)}
