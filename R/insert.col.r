
insert.col <- function ( dat , toinsert , after ) {

  stopifnot ( is.data.frame ( dat ) )
  if ( is.character ( toinsert ) ) toinsert <- which ( colnames ( dat ) %in% toinsert )
  if ( is.character ( after ) ) after <- which ( colnames ( dat ) %in% after )
  stopifnot ( is.numeric ( toinsert ) )
  stopifnot ( is.numeric ( after ) )
  stopifnot ( ! identical ( toinsert , integer(0) ) )
  stopifnot ( ! identical ( after , integer(0) ) )

  sorted <- c ( which ( ! (1:after) %in% toinsert ) , toinsert , which ( ! seq ( along = colnames ( dat ) ) %in% c ( 1:after , toinsert ) ) )

  dat <- dat [ , sorted ]

}
