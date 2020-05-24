### Hilfsfunktion, wie table(), nur mit festen Werten
### z.B. table.muster(a, c(1,5,7,8,9)) sucht, wie oft jede Zahl in "mustervektor" in "vektor" vorkommt
### Warnung, wenn zusaetzliche Zahlen in Vektor stehen
tablePattern <- function(x, pattern = NULL, weights, na.rm = TRUE, useNA = c("no", "ifany", "always")) {
               if(length(pattern)>0) {
                  additional.values <- na.omit( setdiff(x,pattern))
                  if( length( additional.values ) > 0 )   {
                     cat("Warning: Found additional values not defined in 'pattern':\n")
                     cat(paste(additional.values,collapse=", ")); cat("\n")
                     cat("Concatenate additional values to 'pattern'.\n")
                     pattern <- c(pattern, additional.values)
                  }
                  notInData <- setdiff(pattern, x)
                  if ( length(notInData) > 0) {
                       y <- factor(x, levels = as.character(pattern))
                  }
                }
                  if(missing(weights)) {
                     Table <- table(y, useNA =useNA )
                  }  else  {
                     if ( length(notInData) > 0) {
                          x <- c(x, notInData)
                          weights<- c(weights, rep(0, length(notInData)))
                     }
                     Table <- wtdTable(x = x, weights = weights, na.rm =na.rm  )
                  }
                return(Table)}
