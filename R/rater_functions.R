### Voraussetzung: Datensatz im Long-Format, wie ihn das Codiertool ausgibt
### idCol: Nummer oder Name der ID
### varCol: Nummer oder Name der Variablenspalte
### codCol: Nummer oder Name der Kodiererspalte
### n.pseudo: wieviele Pseudocodierer?
### randomize.order: soll die Reihenfolge der Pseudocodes nach Zufall bestimmt werden?
make.pseudo <- function(datLong, idCol, varCol, codCol, valueCol, n.pseudo, randomize.order = TRUE)   {
  allVars     <- list(idCol = idCol, varCol = varCol, codCol = codCol, valueCol=valueCol)
  all.Names   <- lapply(allVars, FUN=function(ii) {existsBackgroundVariables(dat = datLong, variable=ii)})
  if(length(all.Names) != length(unique(all.Names)) ) {stop("'idCol', 'varCol', 'codCol' and 'valueCol' overlap.\n")}
  dat.i       <- datLong[,unlist(all.Names), drop = FALSE]         ### untere zeilen "only for the sake of speed": wir sortieren alle Faelle VORHER aus, wo nichts gesampelt werden kann!
  dat.i[,"index"] <- paste( dat.i[,unlist(all.Names[c("idCol")])], dat.i[,unlist(all.Names[c("varCol")])], sep="_")
  index       <- table(dat.i[,"index"])
  datWeg      <- dat.i[ which ( dat.i[,"index"] %in% names(index)[which ( index <= n.pseudo )] ) , ]
  datSample   <- dat.i[ which ( dat.i[,"index"] %in% names(index)[which ( index > n.pseudo )] ) , ]
  if(nrow(datSample)>0) {
    datPseudo   <- do.call("rbind", by(data = datSample, INDICES = datSample[, unlist(all.Names[c("idCol", "varCol")])], FUN = function ( sub.dat) {
      stopifnot(nrow(sub.dat)>n.pseudo)
      auswahl     <- sample(1:nrow(sub.dat), n.pseudo, replace = FALSE )
      if(!randomize.order) { auswahl <- sort(auswahl) }
      sub.dat     <- sub.dat[auswahl,]
      return(sub.dat)}))
    datWeg   <- rbind(datWeg, datPseudo)
  }
  if(n.pseudo>1) { datWeg[,unlist(all.Names[c("codCol")])] <- paste("Cod",multiseq(datWeg[,"index"]),sep="_") }
  return(datWeg)}

### function by Alexander Robitzsch calculates mean agreement among raters
meanAgree <- function( dat , tolerance = 0 , weight.mean = TRUE ){
  # INPUT:
  # dat       ... dataframe
  # tolerance ... see function agree
  # weight.mean ... = T, if agreement is weighted by number of rater subjects,
  #            = F, if it is averaged among all rater pairs
  R <- ncol(dat)
  dfr <- NULL
  for (ii in 1:(R-1)){
    for (jj in (ii+1):R){
      dat.ii.jj <- na.omit(  dat[ , c(ii,jj)]  )
      if ( dim(dat.ii.jj)[1] > 0 ){
        a.ii.jj <-  agree( dat.ii.jj , tolerance )
        dfr <- rbind( dfr , c( colnames(dat)[ii] , colnames(dat)[jj] , a.ii.jj$subjects , a.ii.jj$value / 100 )  )
      }
    } }
  dfr <- data.frame(dfr)
  colnames(dfr) <- c("Coder1","Coder2","N" , "agree" )
  for (vv in 3:4){ dfr[,vv] <- as.numeric( paste( dfr[,vv] ) ) }
  meanagree <- ifelse( weight.mean == TRUE , weighted.mean( dfr$agree , dfr$N ) , mean( dfr$agree ) )
  list( "agree.pairwise" = dfr , "meanagree" = meanagree )   }

### function by Alexander Robitzsch calculates mean Cohen's kappa among raters
meanKappa <- function( dat , weight = "unweighted" , weight.mean = TRUE ){
  # INPUT:
  # dat       ... dataframe
  # weight    ... see function kappa2 in irr
  # weight.mean ... = T, if agreement is weighted by number of rater subjects,
  #            = F, if it is averaged among all rater pairs
  R <- ncol(dat)
  dfr <- NULL
  for (ii in 1:(R-1)){
    for (jj in (ii+1):R){
      dat.ii.jj <- na.omit(  dat[ , c(ii,jj)]  )
      if ( dim(dat.ii.jj)[1] > 0 ){
        a.ii.jj <-  kappa2( dat.ii.jj , weight )
        dfr <- rbind( dfr , c( colnames(dat)[ii] , colnames(dat)[jj] , a.ii.jj$subjects , a.ii.jj$value  ) )
      }
    } }
  dfr <- data.frame(dfr)
  colnames(dfr) <- c("Coder1","Coder2","N" , "kappa" )
  for (vv in 3:4){ dfr[,vv] <- as.numeric( paste( dfr[,vv] ) ) }
  meankappa <- ifelse( weight == TRUE , weighted.mean( dfr$kappa , dfr$N ) , mean( dfr$kappa , na.rm = TRUE) )
  list( "agree.pairwise" = dfr , "meankappa" = meankappa )     }
