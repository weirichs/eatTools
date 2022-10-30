### like rbind, but rbinds only columns which occur in all data.frames
rbind.common <- function(...) {
      dfs <- list(...)
      if (length(dfs) == 0) {return()}
      if (is.list(dfs[[1]]) && !is.data.frame(dfs[[1]])) { dfs <- dfs[[1]] }
      dfs <- plyr::compact(dfs)
      ### alternativ, wenn kein plyr importiert werden soll, irgendwi sowas (?)
      # notNull <- which(lapply(dfs, FUN = function (x) {!is.null(x)}))
      # if (length(notNull)==0) {return()})
      # dfs <- dfs[notNull]
      if (length(dfs) == 0) {return()}
      if (length(dfs) == 1) {return(dfs[[1]])}
      isdf<- vapply(dfs, is.data.frame, logical(1))                             ### Check that all inputs are data frames
      if (any(!isdf)) {warning("All inputs to rbind.common must be data.frames", call. = FALSE) }
      cols<- Reduce(intersect, lapply(dfs, colnames))                           ### find common cols
      if ( length(cols) == 0 ) {
         warning("No common column names found.")
         return()
      }
      dat <- do.call(rbind, lapply(dfs, `[`, cols))
      return(dat)}

