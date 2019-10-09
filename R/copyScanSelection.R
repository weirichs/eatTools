### foo <- copyScanSelection(codebook, vars=unlist(variablen), dat=dat, id=1, sourceDir = "s:/Vera3-Scans/Deutsch/V3_Pilot_2015/Depot_100", targetDir = "N:/archiv/test")
### prefixPattern = "TH[:digit:]{2}-[:digit:]{2}_[:digit:]{10}"
copyScanSelection <- function ( vars, dat, id, sourceDir, targetDir, codebook, varColumn = "Variable", bookletColumnPrefix = "TH", separators = c("-", "_"), suffix = ".TIF") {
    if(length(id) != 1 ) {stop("Argument 'id' must be of length 1.\n",sep="")}
    allV <- list(ID = id, variablen=vars )
    if(inherits(try(allN <- lapply(allV, FUN=function(ii) {existsBackgroundVariables(dat = dat, variable=ii)}), silent=TRUE),"try-error"))  {
       cat("Warning: data seem to contain items, codebook contains variables. Try workaround.\n")
       v <- vars
       while ( !v[1] %in% colnames(dat) ) {
          v <- substr(v, 1, nchar(v)-1)
          if ( nchar(v[1]) < 3 ) {stop("Columns in data do not match variable names in 'var'.\n")}
       }   
       an<- data.frame ( alt = vars, neu = v, stringsAsFactors = FALSE)
       rs<- paste("'",an[,"neu"] , "' = '" , an[,"alt"],"'",sep="", collapse="; ")
       colnames(dat) <- recode(colnames(dat), rs)
       allN <- lapply(allV, FUN=function(ii) {existsBackgroundVariables(dat = dat, variable=ii)})
    }   
    liste<- do.call("rbind", lapply (allN[["variablen"]], FUN = function (va) {
            codes <- setdiff(names(table(dat[,va])), c("mbd", "mnr", "mci", "mnr", "mir", "mbi", "9", "97", "98", "99", "7","8"))
            sepCod<- do.call("rbind", lapply(codes, FUN = function ( co ) {
                id <- dat[which(dat[,va] == co),allN[["ID"]] ]                  ### alle IDs raussuchen, die diesen code haben
                rw <- which(codebook[,varColumn] == va)                         ### in welchen testheften (Zeilen) kommt die variable "va" vor?
                if(length(rw) == 0) {stop(paste0("Cannot find variable '",va,"' in the codebook.\n"))}
                th <- codebook[rw[1], grep(paste0("^", bookletColumnPrefix), colnames(codebook), value=TRUE)]
                th <- th[which(!is.na(th))]
                str<- paste0(names(th), separators[1], unlist(th), separators[2])
                str<- expand.grid(str, id)
                str<- paste0(str[,1], str[,2])
                str<- paste0(str, suffix)
                dfr<- data.frame ( variable = va, code = co, scans = str, stringsAsFactors = FALSE)
                return(dfr)}))
            return(sepCod)}))                                                   ### jetzt aus 'liste' alle scans loeschen, die es gar nicht gibt
    scans<- list.files(path = sourceDir, pattern = paste0(suffix, "$"), recursive = TRUE)
    scan2<- halveString(string = scans, pattern="/", first=FALSE)
    if (length(intersect(liste[,"scans"], scan2[,2])) == 0) {warning("keine Scans im Verzeichnis gefunden.\n")}
    weg  <- setdiff(liste[,"scans"], scan2[,2])
    if ( length(weg)>0) { liste <- liste[-eatModel:::wo.sind(weg, liste[,"scans"]),]}
    b    <- match(liste[,"scans"],scan2[,2])
    liste[,"quelle"] <- file.path(sourceDir, scans[b])
    if ( dir.exists(targetDir) == FALSE ) {dir.create(targetDir)}
    foo  <- lapply(unique(liste[,"variable"]), FUN = function(y) {
            dir.create(file.path(targetDir, y))                                 ### Verzeichnis fuer jede einzelne Variable erzeugen, und darunter: Unterverzeichnis fuer jeden einzelnen Code jeder einzelnen Variable erzeugen
            lapply(unique(liste[which(liste[,"variable"] == y),"code"]), FUN = function(co) { dir.create(file.path(targetDir, y, co))}) })
    foo2 <- file.copy(from = liste[,"quelle"], to = file.path(targetDir, liste[,"variable"], liste[,"code"], liste[,"scans"]))
    return(foo2)}


