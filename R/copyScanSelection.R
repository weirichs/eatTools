### foo <- copyScanSelection(codebook, vars=unlist(variablen), dat=dat, id=1, sourceDir = "s:/Vera3-Scans/Deutsch/V3_Pilot_2015/Depot_100", targetDir = "N:/archiv/test")
### prefixPattern = "TH[:digit:]{2}-[:digit:]{2}_[:digit:]{10}"
copyScanSelection <- function ( vars, dat, id, sourceDir, targetDir, codebook, startRow = 4, sheet = "Codebook", varColumn = "Variable", bookletColumnPrefix = "TH", separators = c("-", "_"), suffix = ".TIF") {
    if(length(id) != 1 ) {stop("Argument 'id' must be of length 1.\n",sep="")}
    if(class(vars) != "character") {stop("Argument 'vars' must be of class 'character'.\n",sep="")}
    if(length(vars) != length(unique(vars))) {stop("'vars' is not unique.\n")}
    allV <- list(ID = id, variablen=vars )
    allN <- lapply(allV, FUN=function(ii) {existsBackgroundVariables(dat = dat, variable=ii)})
    if (is.character(codebook)) {codebook <- data.frame ( read_excel(codebook, sheet = "Codebook", skip = startRow-1, col_types = "text"), stringsAsFactors = FALSE) }
    liste<- do.call("rbind", lapply (allN[["variablen"]], FUN = function (va) {
            codes <- setdiff(names(table(dat[,va])), c("mbd", "mnr", "mci", "mnr", "mir", "mbi", "9", "97", "98", "99", "7","8"))
            sepCod<- do.call("rbind", lapply(codes, FUN = function ( co ) {
                id <- dat[which(dat[,va] == co),allN[["ID"]] ]                  ### alle IDs raussuchen, die diesen code haben
                rw <- grep(va, codebook[,varColumn])                            ### in welchen testheften (Zeilen) kommt die variable "va" vor?
                if(length(rw) == 0) {stop(paste0("Cannot find variable '",va,"' in the codebook.\n"))}
                if ( length(setdiff(unique(codebook[rw,"Variable"]), "")) > 1) { 
                   cat(paste0("Item '",va,"' seems to be aggregated from '",paste(setdiff(unique(codebook[rw,"Variable"]), ""), collapse= "', '"),"'. \nScan selection is skipped as aggregated scores do not match variable raw scores.\n"))
                   return(NULL)}
                th <- codebook[rw[1], grep(paste0("^", bookletColumnPrefix), colnames(codebook), value=TRUE)]
                if(all(is.na(th))) {
                   cat(paste0("Variable '",va,"': codebook does not contain any valid information about booklet occurrences. All '",bookletColumnPrefix,"'-columns seem to be empty. Skip '",va,"'.\n"))
                   return(NULL)}
                th <- th[which(!is.na(th))]
                str<- paste0(names(th), separators[1], unlist(th), separators[2])
                str<- expand.grid(str, id)
                str<- paste0(str[,1], str[,2])
                str<- paste0(str, suffix)
                dfr<- data.frame ( variable = va, code = co, scans = str, stringsAsFactors = FALSE)
                return(dfr)}))
            return(sepCod)}))                                                   ### jetzt aus 'liste' alle scans loeschen, die es gar nicht gibt
    scans<- list.files(path = sourceDir, pattern = paste0(suffix, "$"), recursive = TRUE)
    if ( length(scans)==0) {stop(paste0("Cannot found any scan files in source directory '",sourceDir,"'.\n"))}
    scan2<- halveString(string = scans, pattern="/", first=FALSE)
    if (length(intersect(liste[,"scans"], scan2[,2])) == 0) {warning("keine Scans im Verzeichnis gefunden.\n")}
    weg  <- setdiff(liste[,"scans"], scan2[,2])
    if ( length(weg)>0) { liste <- liste[-whereAre(weg, liste[,"scans"], quiet = TRUE),]}
    b    <- match(liste[,"scans"],scan2[,2])
    liste[,"quelle"] <- file.path(sourceDir, scans[b])
    if ( dir.exists(targetDir) == FALSE ) {dir.create(targetDir)}
    foo  <- lapply(unique(liste[,"variable"]), FUN = function(y) {
            dir.create(file.path(targetDir, y))                                 ### Verzeichnis fuer jede einzelne Variable erzeugen, und darunter: Unterverzeichnis fuer jeden einzelnen Code jeder einzelnen Variable erzeugen
            lapply(unique(liste[which(liste[,"variable"] == y),"code"]), FUN = function(co) { dir.create(file.path(targetDir, y, co))}) })
    foo2 <- file.copy(from = liste[,"quelle"], to = file.path(targetDir, liste[,"variable"], liste[,"code"], liste[,"scans"]))
    return(foo2)}


