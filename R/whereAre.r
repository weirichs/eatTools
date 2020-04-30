whereAre <- function(a,b,quiet=FALSE) {
            b <- data.frame(1:length(b),b,stringsAsFactors=FALSE)               ### zusaetzliche Syntaxbefehle sind notwendig, damit die Funktion mit missing values umgehen kann.
            if(sum(which(is.na(a)))>0)     {cat("a contains missing values. \n")}
            if(sum(which(is.na(b[,2])))>0) {cat("b contains missing values. \n")}
            if(length(na.omit(a)) > length(unique(na.omit(a))))     {cat("a contains duplicate elements. \n")}
            if(length(intersect(a,b[,2])) == 0) {
               cat("No common elements in a and b. \n")
               reihe <- NULL
            }  else {
               if(quiet==FALSE) { if(length(intersect(a,b[,2])) > 0) {if(length(setdiff(a,b[,2]))>0)      {cat("Not all Elemente of a included in b. \n")} } }
               a <- na.omit(unique(a))                                          ### Sofern vorhanden, werden missing values aus a entfernt
               b <- na.omit(b)                                                  ### Sofern vorhanden, werden missing values aus b entfernt; aber: Rangplatz der
               if(length(a)>0) {                                                ### der nicht fehlenden Elemente in b bleibt erhalten
                  reihe <- b[ which(b[,2] %in% a)  ,1]
                  if(quiet==FALSE) { cat(paste("Found",length(reihe),"elements.\n")) }
               }
               if(length(a)==0) {cat("No valid values in a.\n")}
            }
            return(reihe)}
