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
