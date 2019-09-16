existsBackgroundVariables <- function(dat, variable )  {
           if(!is.null(variable[1]))  {
               if ( !is.na(variable[1])) {
      							 if(is.factor(variable))    {
      							    v  <- as.character(variable)
      							    rN <- removeNumeric(v)
      							    if(all (nchar(rN) == 0 ) ) { variable <- as.numeric(v) } else { variable <- as.character(variable)}
             			   }
                     if(is.character(variable))  {
                  	 	  misVariable <- setdiff(variable, colnames(dat))
                  			if(length(misVariable)>0) {
                           stop(paste0("Can't find ",length(misVariable)," variable(s) in dataset: '", paste( misVariable,collapse="', '"), "'\n"))
                        }
                  			varColumn <- match(variable, colnames(dat))
                 	   }
                     if(is.numeric(variable))   {
                        if(ncol(dat) < max(variable) ) {stop("Designated column number exceeds number of columns in dataset.\n")}
                        varColumn <- variable
                     }
                     return(colnames(dat)[varColumn])
              }  else {
                     return(NULL)
              }
            }  else {
               return(NULL)
            } }

facToChar <- function ( dataFrame, from = "factor", to = "character" ) {
             if(!"data.frame" %in% class(dataFrame)) {stop("'dataFrame' must be of class 'data.frame'.\n")}
             classes <- which( unlist(lapply(dataFrame,class)) == from)
             if(length(classes)>0) {
                for (u in classes) { eval(parse(text=paste("dataFrame[,u] <- as.",to,"(dataFrame[,u])",sep="") )) }}
             return(dataFrame)}

### Hilfsfunktion, ersetzt table(unlist( ... ))
tableUnlist <- function(dataFrame, verbose = TRUE, useNA = c("no","ifany", "always"))   {
                useNA<- match.arg(useNA)
                # if(class(dataFrame) != "data.frame" ) {stop("Argument of 'tableUnlist' has to be of class 'data.frame'.\n")}
                if(class(dataFrame) != "data.frame" ) {
                   if(verbose == TRUE ) {cat(paste("Warning! Argument of 'tableUnlist' has to be of class 'data.frame'. Object will be converted to data.frame.\n",sep=""))}
                   dataFrame <- data.frame(dataFrame, stringsAsFactors=FALSE)
                }
                dLong<- melt(dataFrame, measure.vars = colnames(dataFrame), na.rm=FALSE)
                freqT<- table(dLong[,"value"], useNA = useNA)
                names(freqT) <- recode(names(freqT), "NA='NA'")
                return(freqT)}
                
intGen <- function ( vars, upto = 3) {
          snip <- paste(lapply(2:upto, FUN = function ( v ) {
                  spl <- data.frame ( combn(vars,v), stringsAsFactors = FALSE)
                  sni <- paste(lapply(spl, FUN = function ( x ) { paste(x, collapse = " : ")}), collapse = " + ")
                  return(sni) }), collapse = " + ")
          return(snip)}
          
contr.wec.weighted <- function (x, omitted, weights) {
    frequencies <- wtd.table(x, weights = weights, type="table")
    n.cat <- length(frequencies)
    omitted <- which(levels(x) == omitted)
    new.contrasts <- contr.treatment(n.cat, base = omitted)
    new.contrasts[omitted, ] <- -1 * frequencies[-omitted]/frequencies[omitted]
    colnames(new.contrasts) <- names(frequencies[-omitted])
    return(new.contrasts)}

