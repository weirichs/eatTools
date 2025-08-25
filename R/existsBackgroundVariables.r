existsBackgroundVariables <- function(dat, variable, warnIfMissing = FALSE, stopIfMissingOnVars = NULL )  {
           checkmate::assert_data_frame(dat)
           checkmate::assert_vector(variable, null.ok = TRUE, unique=TRUE)
           checkmate::assert_logical(warnIfMissing, len = 1)
           checkmate::assert_character(stopIfMissingOnVars, null.ok = TRUE)
           if(is.null(variable))  {return(NULL)}
           if(any(is.na(variable))) {stop("'variable' must not contain missing values (i.e., NA values).")}
           if(is.factor(variable))    {
	             v  <- as.character(variable)
      				 rN <- removeNumeric(v)
      				 if(all (nchar(rN) == 0 ) ) { variable <- as.numeric(v) } else { variable <- as.character(variable)}
   			   }
           if(is.character(variable))  {
            	 misVariable <- setdiff(variable, colnames(dat))
               if(length(misVariable)>0) {
                  stop(paste0("Can't find ",length(misVariable)," variable(s) in dataset: '", paste( misVariable,collapse="', '"), "'"))
               }
               varColumn <- match(variable, colnames(dat))
           }
           if(is.numeric(variable))   {
               if ( !all(round(variable) == variable)) {stop("If provided as column number, variable '",variable,"' must be integer.")}
               if(ncol(dat) < max(variable) ) {stop("Designated column number exceeds number of columns in dataset.")}
               varColumn <- variable
           }
           if (warnIfMissing) { checkMis(dat, varColumn, stopIfMissingOnVars=stopIfMissingOnVars) }
           return(colnames(dat)[varColumn]) }

checkBackgroundVariables <- function(varList, len1 = NULL, overlap = NULL) {
    ### check uniqueness
           lapply(names(varList), FUN = function (nam) {if(length(varList[[nam]]) != length(unique(varList[[nam]]))) {stop(paste0("Variable '",nam,"' must be unique, but isn't. Duplicated values are '",paste(varList[[nam]][duplicated(varList[[nam]])], collapse="', '"),"'."))}})
    ### check length
           if(!is.null(len1)) {
              comm <- intersect(names(varList), len1)
              if(length(comm)>0) {
                 lapply(comm, FUN = function (nam) {if( !is.null(varList[[nam]]) && length(varList[[nam]]) !=1) {stop(paste0("Variable '",nam,"' must have length 1, but has length ",length(varList[[nam]])," with values: '",paste(varList[[nam]], collapse="', '"),"'."))}})
              }
           }
    ### check overlap
           if(!is.null(overlap)) {
              weg  <- unlist(lapply(overlap, FUN = function (o) {
                      if(!is.null(varList[[o[["vars"]][2]]])) {
                          comm <- intersect(varList[[o[["vars"]][1]]], varList[[o[["vars"]][2]]])
                          if(length(comm) != o[["len"]]) {stop(paste0("'",o[["vars"]][[1]], "' and '", o[["vars"]][[2]],"' must have ",o[["len"]], " common elements, but have ",length(comm),": \n \n", print_and_capture(varList[c(o[["vars"]][[1]], o[["vars"]][[2]])], spaces = 5)))}
                          return(o[["vars"]][2])}}))
              if(!is.null(weg)) {noOv <- varList[-whereAre(weg, names(varList), verbose=FALSE)]} else {noOv <- varList}
           } else {
              noOv <- varList
           }
           if(length(unlist(noOv)) != length(unique(unlist(noOv)))) {stop(paste0("Overlapping variables: '",paste(unlist(noOv)[duplicated(unlist(noOv))], collapse="', '"),"'."))}
    }


checkMis  <- function (dat, varColumn, stopIfMissingOnVars) {
             lapply(varColumn, FUN = function ( col ) {
                 isna <- length(which(is.na(dat[,col])))
                 if (isna>0) {
                     if ( colnames(dat)[col] %in% stopIfMissingOnVars) {
                        stop("Found ",isna," missing values in variable '",colnames(dat)[col],"'.")
                     } else {
                        warning("Found ",isna," missing values in variable '",colnames(dat)[col],"'.")
                     }
                 }
             })}
