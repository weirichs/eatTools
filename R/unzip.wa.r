unzip.wa <- function ( zipfile, targetdir = tempdir(), unzip.exe = "c:/Program Files/tools/unzip.exe") {
     tar <- normalizePath(targetdir)
     bat <- c("CD\\", paste0("cd ",tar), paste0("\"",normalizePath(unzip.exe),"\" \"",normalizePath(zipfile),"\""))
     write(bat, file = file.path(tar,"batch.bat"), sep="\n")
     shell.exec(file.path(tar, "batch.bat"))}
