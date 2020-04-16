unzip.wa <- function ( zipfile, targetdir = tempdir(), unzip.exe = "c:/Program Files/tools/unzip.exe") {
     old_wd <- getwd()
     on.exit(setwd(old_wd))
     setwd(targetdir)
     system(paste0("\"",normalizePath(unzip.exe),"\" \"",normalizePath(zipfile),"\""), show.output.on.console = TRUE)}


