# internally used function to save space and avoid copy/paste when functions with many arguments are internally called
# argsUsed ... numerisch
buildExpr <- function (prefix = "", funName, env, argsUsed, lookup, suffix = "", verbose=TRUE) {
       args <- eval(parse(text=paste0("formalArgs(",funName,")")))
       if(missing(env)) {stop("Argument '",env,"' must be specified.")}
       if(!missing(argsUsed)) {args <- args[argsUsed]}                          ### hier noch einen check einbauen
       if(!missing(lookup))   {args2 <- recodeLookup(var = args, lookup=lookup)} else {args2 <- args}
       stopifnot(length(args) == length(args2))
       notEq<- which( (args == args2) == FALSE)                                 ### diese Elemente wurden durch recodeLookup geaendert
       if(length(notEq)>0) {args3 <- args2[-notEq]} else {args3 <- args2[-notEq]}
       notEx<- unlist(lapply(args3, FUN = function (y) { eval(parse(text = paste0("exists(\"",y,"\", envir=env)")))}))
       notEx<- args3[which(notEx == FALSE)]                                     ### diese Elemente existieren nicht
       if ( length(notEx)>0) {
           mat <- whereAre(notEx, args2, verbose=FALSE)
           if(verbose) {message("Delete ",length(notEx) , " arguments which do not exist: '",paste(args[mat], collapse= "', '"), "'") }
           args<- args[-mat]; args2 <- args2[-mat]
       }
       do   <- paste0(prefix,paste(args,args2, sep=" = ", collapse= ", "), suffix)
       return(do)}