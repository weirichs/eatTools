existsBackgroundVariables <- function(dat, variable )  {
           if(!is.null(variable[1]))  {
               if ( !is.na(variable[1])) {
                     if ( length(variable) != length(unique(variable)) ) {stop("Variable definition is not unique.\n")}
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
                vek  <- do.call("c", lapply(dataFrame, FUN = function ( col ) { return(col)}))
                freqT<- table(vek, useNA = useNA)
                isna <- which(is.na(names(freqT)))
                if ( length(isna)>0) { names(freqT)[isna] <- "NA"}
                return(freqT)}

          
contr.wec.weighted <- function (x, omitted, weights) {
    rawfreq <- table(x)
    if ( length( which(rawfreq == 0))>0) {cat(paste("Warning: Drop ",length( which(rawfreq == 0))," empty level(s): '",paste(names(rawfreq)[which(rawfreq ==0)], collapse="', '"),"'.\n",sep=""))}
    frequencies <- wtd.table(x, weights = weights, type="table")
    n.cat <- length(frequencies)
    omit  <- which(levels(droplevels(x)) == omitted)  
    if ( length(omit)==0){
        stop(paste("Level declared to be omitted ('",omitted,"') does not exist in 'x' or has zero observations.\n",sep=""))
    }
    new.contrasts <- contr.treatment(n.cat, base = omit)
    new.contrasts[omit, ] <- -1 * frequencies[-omit]/frequencies[omit]
    colnames(new.contrasts) <- names(frequencies[-omit])
    return(new.contrasts)}

