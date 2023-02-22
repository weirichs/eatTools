existsBackgroundVariables <- function(dat, variable, warnIfMissing = FALSE )  {
           if(!is.null(variable[1]))  {
               if ( !is.na(variable[1])) {
                     if ( length(variable) != length(unique(variable)) ) {stop("Variable definition is not unique.")}
                     if(is.factor(variable))    {
      							    v  <- as.character(variable)
      							    rN <- removeNumeric(v)
      							    if(all (nchar(rN) == 0 ) ) { variable <- as.numeric(v) } else { variable <- as.character(variable)}
             			   }
                     if(is.character(variable))  {
                  	 	  misVariable <- setdiff(variable, colnames(dat))
                  			if(length(misVariable)>0) {
                           stop("Can't find ",length(misVariable)," variable(s) in dataset: '", paste( misVariable,collapse="', '"))
                        }
                  			varColumn <- match(variable, colnames(dat))
                 	   }
                     if(is.numeric(variable))   {
                        if ( !all(round(variable) == variable)) {stop("If provided as column number, variable '",variable,"' must be integer.")}
                        if(ncol(dat) < max(variable) ) {stop("Designated column number exceeds number of columns in dataset.")}
                        varColumn <- variable
                     }
                     if (warnIfMissing) { checkMis(dat, varColumn) }
                     return(colnames(dat)[varColumn])
              }  else {
                     return(NULL)
              }
            }  else {
               return(NULL)
            } }

checkMis  <- function (dat, varColumn) {
             lapply(varColumn, FUN = function ( col ) {
                 isna <- length(which(is.na(dat[,col])))
                 if (isna>0) {warning(paste0("Found ",isna," missing values in variable '",colnames(dat)[col],"'.") )} }) }