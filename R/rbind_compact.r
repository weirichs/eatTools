### like rbind, but rbinds only columns which occur in all data.frames
rbind_compact <- function(...) {
      dfs <- list(...)
      if (length(dfs) == 0) {return()}
      if (is.list(dfs[[1]]) && !is.data.frame(dfs[[1]])) { dfs <- dfs[[1]] }
      #dfs <- plyr::compact(dfs)
      dfs[sapply(dfs, is.null)] <- NULL
      if (length(dfs) == 0) {return()}
      if (length(dfs) == 1) {return(dfs[[1]])}
      isdf<- vapply(dfs, is.data.frame, logical(1))                             ### Check that all inputs are data frames
      if (any(!isdf)) {stop("All inputs to rbind_compact must be data.frames.") }
      cols<- Reduce(intersect, lapply(dfs, colnames))                           ### find common cols
      if ( length(cols) == 0 ) {
         warning("No common column names found.")
         return()
      }
      dat <- do.call(rbind, lapply(dfs, `[`, cols))
      return(dat)}

