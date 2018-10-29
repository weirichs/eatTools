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

asNumericIfPossible <- function(dataFrame, set.numeric=TRUE, transform.factors=FALSE, maintain.factor.scores = TRUE, verbose=TRUE, ignoreAttributes = FALSE)   {
            wasInputVector  <- FALSE
            if( !"data.frame" %in% class(dataFrame) ) {
              if(verbose == TRUE )  {cat(paste("Warning! Argument of 'asNumericIfPossible' has to be of class 'data.frame'. Object will be converted to data.frame. Labels might be lost.\n",sep="")) }
              dataFrame <- data.frame(dataFrame, stringsAsFactors=FALSE)
              wasInputVector <- ifelse(ncol(dataFrame) == 1, TRUE, FALSE)
            }
            currentAttr    <- lapply ( dataFrame, attributes)
            currentClasses <- sapply(dataFrame, FUN=function(ii) {class(ii)})
            summaryCurrentClasses <- names(table(currentClasses))
            if(verbose == TRUE )  {
               cat(paste("Current data frame consists of following ",length(summaryCurrentClasses), " classe(s):\n    ",sep=""))
               cat(paste(summaryCurrentClasses,collapse=", ")); cat("\n")
            }
            suppressWarnings(numericable <- sapply(dataFrame, FUN=function(ii)   {
                  n.na.old       <- sum(is.na(ii))
                  transformed    <- as.numeric(ii)
                  transformed.factor <- as.numeric(as.character(ii))
                  n.na.new       <- sum(is.na(transformed))
                  n.na.new.factor <- sum(is.na(transformed.factor))
                  ret            <- rbind(ifelse(n.na.old == n.na.new, TRUE, FALSE),ifelse(n.na.old == n.na.new.factor, TRUE, FALSE))
                  if(transform.factors == FALSE)   {
                     if(class(ii) == "factor")   {
                        ret <- rbind(FALSE,FALSE)
                     }
                  }
                  return(ret)}))
            changeVariables <- colnames(dataFrame)[numericable[1,]]             ### welche Variablen sollen transformiert werden?
            alreadyNum      <- currentClasses[which(currentClasses %in% c("numeric", "integer"))]
            if(length(alreadyNum)>0) { changeVariables <- setdiff(changeVariables, alreadyNum)}
            changeFactorWithIndices   <- NULL                                   ### obere zeile: diejenigen ausschliessen, die bereits numerisch sind!
            if(transform.factors == TRUE & maintain.factor.scores == TRUE)   {
               changeFactorWithIndices   <- names(which(sapply(changeVariables,FUN=function(ii) {class(dataFrame[[ii]])=="factor"})))
               changeFactorWithIndices   <- setdiff(changeFactorWithIndices, names(which(numericable[2,] == FALSE)) )
               changeVariables           <- setdiff(changeVariables, changeFactorWithIndices)
            }
            if(length(changeVariables) >0)   {                                  ### hier werden alle Variablen (auch Faktoren, wenn maintain.factor.scores = FALSE) ggf. geaendert
               do <- paste ( mapply ( function ( ii ) { paste ( "try(dataFrame$'" , ii , "' <- as.numeric(dataFrame$'",ii, "'), silent=TRUE)" , sep = "" ) } , changeVariables  ) , collapse = ";" )
               eval ( parse ( text = do ) )
            }
            if(length(changeFactorWithIndices) >0)   {                          ### hier werden ausschliesslich FAKTOREN, wenn maintain.factor.scores = TRUE, ggf. geaendert
               do <- paste ( mapply ( function ( ii ) { paste ( "try(dataFrame$'" , ii , "' <- as.numeric(as.character(dataFrame$'",ii, "')), silent=TRUE)" , sep = "" ) } , changeFactorWithIndices  ) , collapse = ";" )
               eval ( parse ( text = do ) )
            }
            if(set.numeric==FALSE) {return(numericable[1,])}
            if(set.numeric==TRUE)  {
              if(verbose == TRUE)      {
                 if( sum ( numericable[1,] == FALSE ) > 0 )  {
                     cat(paste("Following ",sum ( numericable[1,] == FALSE )," variable(s) won't be transformed:\n    ",sep=""))
                     cat(paste(colnames(dataFrame)[as.numeric(which(numericable[1,] == FALSE))],collapse= ", ")); cat("\n")
                 }
              }
              if(wasInputVector == TRUE) {dataFrame <- unname(unlist(dataFrame))}
            }                                                                   ### Attribute wieder ranklatschen
            if ( ignoreAttributes == FALSE ) {
                 for ( u in names(currentAttr)) {
                    stopifnot( u %in% colnames(dataFrame))
                    if ( length ( currentAttr[[u]] ) >0 )  {
                         for ( j in names(currentAttr[[u]]) ) { try(attr(dataFrame [,u], j) <- currentAttr[[u]][[j]], silent = TRUE) }
                    }
                 }
            }
            return(dataFrame)
          }


