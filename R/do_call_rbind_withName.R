do_call_rbind_withName <- function (df_list, name = names(df_list), colName){
  if(!is.list(df_list) || any(sapply(df_list, function(x) !is.data.frame(x)))) stop("'df_list' must be a list of data.frames.")
  if(!is.character(name) || length(df_list) != length(name)) stop("'name' must be a character vector of identical length as 'df_list'.")
  if(!is.character(colName) || length(colName) != 1) stop("'colName' must be a character vector of length 1.")

  df_list2 <- Map(function(df, name) {
    if (is.null(df))
      return(df)
    data.frame(placeHolder = rep(name, nrow(df)), df, stringsAsFactors = FALSE)
  }, df = df_list, name = name)
  df_df <- do.call(rbind, df_list2)
  rownames(df_df) <- NULL
  names(df_df)[1] <- colName
  df_df
}
