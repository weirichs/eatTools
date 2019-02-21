get.lmer.effects.forBootMer <- function ( lmerObj) {get.lmer.effects ( lmerObj=lmerObj , saveData = FALSE)[,"value"]}

### needs lme4 version >1
get.lmer.effects <- function ( lmerObj , bootMerObj = NULL, conf = .95, saveData = FALSE) {
             model    <- as.character(substitute(lmerObj))                      ### implementieren wie in p:\ZKD\07_Code\dev\get.lmer.effects\get.lmer.effects_Konzept.xlsx
             # eatRep:::checkForPackage (namePackage = "reshape", targetPackage = "eatGet")### Beispiel in c:\diskdrv\Winword\Psycho\IQB\Dropbox\Literatur\R_help\Bates_2010_lme4_book.rsy
             # if(!exists("fixef"))        {library(lme4)}
             random   <- VarCorr( lmerObj ) 
             fixed    <- fixef(lmerObj)                                   
     ### Sektion 'random effects einlesen'
             randomF  <- do.call("rbind", lapply(names(random), FUN = function ( y ) {
                         ret <- data.frame(model = model, Var1 = colnames(random[[y]]), Var2 = NA, type = "random", group = y, par = "var", derived.par = NA, value = diag(random[[y]]), stringsAsFactors = FALSE )
                         ret <- rbind(ret, data.frame(model = model, Var1 = colnames(random[[y]]), Var2 = NA, type = "random", group = y, par = "sd", derived.par = NA, value = sqrt(diag(random[[y]])), stringsAsFactors = FALSE ))
                         if(nrow(attr(random[[y]], "correlation")) > 1)  {      ### Gibt es Korrelationen?
                            korTab   <- melt(attr(random[[y]], "correlation"))
                            wahl2    <- which(!korTab[,1] == korTab[,2])
                            for (u in 1:2) {korTab[,u] <- as.character(korTab[,u])}
                            wahl1    <- which(!duplicated(apply(korTab, 1, FUN = function ( xx ) { paste( sort(c(xx[1], xx[2])), collapse="_") })))
                            ret      <- rbind.fill( ret, data.frame ( model=model, korTab[intersect(wahl1, wahl2),], type = "random", group = y, par = "correlation", derived.par = NA, stringsAsFactors = FALSE ) )
                         }
                         return(ret)}))
             if ( !is.na(attr(random, "sc"))) {                                 ### vergleichen zwischen Versionen!
                  randomF  <- rbind.fill ( randomF, rbind ( data.frame ( model=model, Var1 = "residual", type = "random", par = "var", derived.par = NA, value = attr(random, "sc")^2, stringsAsFactors = FALSE ), data.frame ( model=model, Var1 = "residual", type = "random", par = "sd", derived.par = NA, value = attr(random, "sc"), stringsAsFactors = FALSE )))
             }                                                                  ### jetzt kommen die fixed effects
     ### Sektion 'fixed effects einlesen'
             fixedF   <- data.frame ( model=model, Var1 = names(fixed), Var2 = NA, type = "fixed", group = NA, par = "est", derived.par = NA, value = as.numeric(fixed), stringsAsFactors = FALSE )
             fixedF   <- rbind(fixedF, data.frame ( model=model, Var1 = names(fixed), Var2 = NA, type = "fixed", group = NA, par = "se", derived.par = NA, value = sqrt(diag(vcov(lmerObj))), stringsAsFactors = FALSE ))
             fixedF   <- rbind(fixedF, data.frame ( model=model, Var1 = names(fixed), Var2 = NA, type = "fixed", group = NA, par = "z.value", derived.par = NA, value = fixedF[fixedF[,"par"] == "est","value"] / fixedF[fixedF[,"par"] == "se","value"], stringsAsFactors = FALSE ))
             fixedF   <- rbind(fixedF, data.frame ( model=model, Var1 = names(fixed), Var2 = NA, type = "fixed", group = NA, par = "p.value", derived.par = NA, value = 2*(1-pnorm(abs(fixedF[fixedF[,"par"] == "z.value","value"]))), stringsAsFactors = FALSE ))
             #if(lme4Ver == "0"){
             #    rr       <- as(sigma(lmerObj)^2 * chol2inv(lmerObj@RX, size = lmerObj@dims['p']), "dpoMatrix")
             #    nms      <- colnames(lmerObj@X)                                ### extract matrix of fixed effects, for lme4 version < 1 
			       #} else { 
             # lme4 version > 1 
                 rr       <- as(sigma(lmerObj)^2 * chol2inv(getME(lmerObj, name = "RX")), "dpoMatrix")
                 nms      <- colnames(lmerObj@pp$X)                             ### for lme4 version > 1
             #}    
             dimnames(rr) <- list(nms, nms)
             if(is.null(nms)) {dimnames(rr) <- list(names(fixed), names(fixed))}
             korMat <- as.matrix(as(rr, "corMatrix"))	
             if(nrow( korMat ) > 1 ) {
                 korTab   <- melt(korMat)
                 wahl2    <- which(!korTab[,1] == korTab[,2])
                 namenFixed <- gsub(":", "________XX________",names(fixed))     ### That's the problem: a <- 1:3; car::recode(a, "1 = 'test'; 2 = 'mist'; 3 = 'test:mist'")
                 recodeString <- paste("'", 1:length(fixed),"' = '", namenFixed,"'", sep = "", collapse = "; ")
                 for ( u in 1:2) {
                       if(inherits(try( korTab[,u] <- recode(korTab[,u], recodeString) ),"try-error"))  { cat("Umbenennung der Spalten der Korrelationsmatrix misslungen.\n")}
                       if(inherits(try( korTab[,u] <- gsub("________XX________",":",korTab[,u]) ),"try-error"))  { cat("Umbenennung der Spalten der Korrelationsmatrix misslungen.\n")}
                 }
                 wahl1    <- which(!duplicated(apply(korTab, 1, FUN = function ( xx ) { paste( sort(c(xx[1], xx[2])), collapse="_") })))
                 fixedF   <- rbind.fill( fixedF, data.frame ( model=model, korTab[intersect(wahl1, wahl2),], type = "fixed", group = NA, par = "correlation", derived.par=NA, stringsAsFactors = FALSE ) )
             }
     ### Sektion 'deviance measures einlesen' 
             LogLik   <- logLik(lmerObj)                                       
             # if(lme4Ver == "0"){ deviancF <- data.frame(model=model, type = "model", par = c("LogLik", "df", paste("Deviance",names(lmerObj@deviance),sep="_"), "AIC", "BIC"), value = c(LogLik[[1]], attr(LogLik, "df"), lmerObj@deviance, AIC(LogLik ), BIC(LogLik)), stringsAsFactors = FALSE ) 
             deviancF <- data.frame(model=model, type = "model", par = c("LogLik", "df", paste("Deviance",names(lmerObj@devcomp$cmp),sep="_"), "AIC", "BIC"), value = c(LogLik[[1]], attr(LogLik, "df"), lmerObj@devcomp$cmp, AIC(LogLik ), BIC(LogLik)), stringsAsFactors = FALSE )  
             err      <- NA                                                     ### Fehlerterm initialisieren
             if(class(lmerObj) %in% "glmerMod") {                               ### jetzt das R^2, dazu Fehlerkomponente bestimmen, haengt von Linkfunktion ab
                if ( lmerObj@resp$family$family == "binomial" & lmerObj@resp$family$link == "logit")  {err <- pi^2/3}
                if ( lmerObj@resp$family$family == "binomial" & lmerObj@resp$family$link == "probit") {err <- 1} 
                ### Achtung, kompliziert: poisson-models brauchen das Nullmodell (alle random effects, keine fixed effects)
                if ( lmerObj@resp$family$family == "poisson" & lmerObj@resp$family$link == "log") {
                     cat("Calculation of r^2 needs estimation of the null model. Will be implemented at a later date.\n")}
             }                                                                  ### problem: was, wenn LMMs ueber "glmer" mit family=gaussian aufgerufen werden? --> ok, gibt eine lme4-Warnung
             if(class(lmerObj) %in% "lmerMod") { err <- attr(VarCorr(lmerObj), "sc")^2 }
             if(!is.na(err)) {                                                  ### r^2 wird nur berechnet, wenn es irgendwie gelungen ist, die Fehlerkomponente zu identifizieren
                 VarFixed <- var(as.vector(fixef(lmerObj) %*% t(getME(lmerObj, name="X"))))
                 namesRan <- names(VarCorr(lmerObj))
                 string   <- paste("VarCorr(lmerObj)[[\"",namesRan,"\"]][1]", sep="", collapse=" + ")
                 R2_m     <- paste("VarFixed/(VarFixed + ", string, " + err)",sep="")
                 R2_m     <- eval(parse(text=R2_m))
                 R2_c     <- paste("(VarFixed + ",string,")/(VarFixed + ",string," + err)", sep="")
                 R2_c     <- eval(parse(text=R2_c))
                 deviancF <- rbind(deviancF, data.frame(model=model, type = "model", par = c("R2_m", "R2_c"), value = c(R2_m, R2_c), stringsAsFactors = FALSE))
             }
     ### Sektion 'Ergebnisse sammeln'
             ret      <- rbind.fill(randomF, fixedF)
             ret      <- rbind.fill(ret, deviancF)
             groups   <- lapply(names(table(randomF[,"group"])), FUN = function ( rg ) {
                         checkVar <- rg %in% colnames(lmerObj@frame)
                         if(checkVar == TRUE) {return(length(unique(lmerObj@frame[,rg])))} else { return(NULL)} })
             groups   <- groups[ which ( unlist(lapply(groups, is.null)) == FALSE)]
             names(groups) <- names(table(randomF[,"group"])) [ which(unlist ( lapply(names(table(randomF[,"group"])), FUN = function ( rg ) {
                              checkVar <- rg %in% colnames(lmerObj@frame)
                              if(checkVar == TRUE) {return(TRUE)} else { return(FALSE)} })))]
             groups$obs    <- nrow(lmerObj@frame)
             attr(ret, "groups")  <- groups
             #if(lme4Ver == "0"){ attr(ret, "formula") <- lmerObj@call } else {  ### dies beides fuer lme4 version < 1; pruefen ob das andere auch klappt ...
             attr(ret, "formula") <- list(completeCall =  gsub(" +"," ", paste(deparse(lmerObj@call),collapse="", sep="")), sepCall = as.character(lmerObj@call))
             if(saveData == TRUE ) { attr(ret, "data")    <- lmerObj@frame }
             ret      <- data.frame ( ret[,1,drop=FALSE], source = attr(ret, "formula")$sepCall[1], ret[,-1], stringsAsFactors = FALSE)
             class(ret) <- c("data.frame", "lmer.effects")                      ### untere Zeile: wenn bootMerObj uebergeben, dann werden jetzt bootstrap-Parameter angebunden
             if(!is.null(bootMerObj)) { 
                stopifnot(length(bootMerObj$t0) == nrow(ret))                   ### check: passen bootMerObj und lmerObj zusammen?
                stopifnot(all ( round(na.omit(bootMerObj$t0),digits=4) == round(na.omit(ret[,"value"]), digits=4)))
                btSE<- sapply(data.frame ( bootMerObj$t), sd)                   ### bootstrap standard errors 
                btBs<- sapply(data.frame ( bootMerObj$t), mean) - bootMerObj$t0 ### bootstrap bias 
                btMe<- sapply(data.frame ( bootMerObj$t), mean)                 ### bootstrap mean
                btMd<- sapply(data.frame ( bootMerObj$t), median)               ### bootstrap median
                ci  <- do.call("rbind", lapply(1:length(bootMerObj$t0), FUN = function ( l ) { 
                       if(!is.na(bootMerObj$t0[l]) & length(table(bootMerObj$t[,l])) > 1) { 
                          ci.l <- boot.ci(bootMerObj, type=c("norm", "basic"), conf=conf, index=l)
                          if(is.null(ci.l)) { ci.d <- NULL} else { 
                             ci.nb<- data.frame ( source = "boot.ci", derived.par = paste ( rep(c("lb","ub"), 2), ci.l$normal[1]*10^(nchar(ci.l$normal[1])-2) , rep(c("normal", "basic"),each=2),sep="."), value = c ( ci.l$normal[(length(ci.l$normal)-1):length(ci.l$normal)], ci.l$basic[(length(ci.l$basic)-1):length(ci.l$basic)]), stringsAsFactors = FALSE)
                             bt.SE<- data.frame ( source = "boot.ci", derived.par = c("bootSE", "bootMean", "bootMedian", "bootBias"), value = c(btSE[l], btMe[l], btMd[l], btBs[l]), stringsAsFactors = FALSE)
                             bootM<- data.frame ( source = "bootMer", derived.par = paste("Iteration", gsub(" ", "0", formatC(1:nrow(bootMerObj$t), width= nchar(nrow(bootMerObj$t)))),sep=""), value = bootMerObj$t[,l], stringsAsFactors = FALSE)
                             ci.d <- data.frame ( ret[l,-match(c("source", "derived.par", "value"), colnames(ret)) ], rbind(ci.nb, bt.SE, bootM), stringsAsFactors = FALSE)
                          }
                       } else { ci.d <- NULL}
                       return(ci.d)}))   
                ret <- rbind(ret, ci)
             }   
             colnames(ret) <- tolower(colnames(ret))
             return(ret) } 

             
save.lmer.effects <- function ( lmerObj, lmerObjRestrict = NULL, fileName, scipen=6) {    
           ret   <- get.lmer.effects(lmerObj, saveData = FALSE)
           save(ret, file = paste0(fileName,".rda")) 
           orSci <- options()$scipen                                            ### lmerObj und lmerObjRestrict muessen zueinander genestet sein!
           if(scipen != unlist(orSci) ) { options(scipen=scipen) }
           sink(file = paste0(fileName,".txt"))                                 ### file to sink wird geoeffnet
     ### get version information
           ver   <- session_info(pkgs = "eatTools")
           ver   <- ver[["packages"]][which(ver[["packages"]][,"package"] == "eatTools"),]
           cat(paste0("Output captured by 'eatTools', Version ",ver[["version"]],", build ",ver[["date"]],".\n"))
           inf   <- Sys.getenv()
           cat(paste("User: ",inf["USERNAME"],", computer: ",inf["COMPUTERNAME"],", ", R.version$version.string , ", Time: ",date(),"\n", sep=""))
           if(!is.null(lmerObjRestrict)) { cat("H1 model:\n\n")}
           print(summary(lmerObj), correlation=TRUE)
     ### Sektion R^2 abspeichern (falls vorhanden)
           zeileC<- match("R2_c", ret[,"par"])
           zeileM<- match("R2_m", ret[,"par"])
           if( length(zeileC) == 1 ) {
               cat(paste("\nR^2 according to Nakagawa & Schielzeth (2013), p. 137:\n     marginal R2: ",formatC(round(100*ret[zeileM,"value"], digits = 2),width=5)," %\n  conditional R2: ",formatC(round(100*ret[zeileC,"value"],digits = 2),width=5)," %\n",sep=""))
           }
     ### Sektion 'Modellvergleich' (optional) ... auch hier das R^2 abspeichern!    
           if(!is.null(lmerObjRestrict)) { 
               retR  <- get.lmer.effects(lmerObjRestrict, saveData = FALSE)
               cat("\n\nH0 model:\n\n")
               print(summary(lmerObjRestrict)) 
               zeileC<- match("R2_c", retR[,"par"])
               zeileM<- match("R2_m", retR[,"par"])
               if( length(zeileC) == 1 ) {
                   cat(paste("\nR^2 according to Nakagawa & Schielzeth (2013), p. 137:\n     marginal R2: ",formatC(round(100*retR[zeileM,"value"], digits = 2),width=5)," %\n  conditional R2: ",formatC(round(100*retR[zeileC,"value"],digits = 2),width=5)," %\n",sep=""))
               }
               cat("\n\nModel comparison:\n\n")
               print(anova(lmerObj, lmerObjRestrict))
           }    
           sink()                                                               ### file to sink wird geschlossen
           if(!is.null(lmerObjRestrict)) { 
               retR    <- get.lmer.effects(lmerObjRestrict, saveData = FALSE)
               save(retR, file = paste0(fileName,"_Restrict.rda")) }  
           if(scipen != unlist(orSci) ) {options(scipen=orSci)}   }             ### scipen-Option wieder zuruecksetzen


