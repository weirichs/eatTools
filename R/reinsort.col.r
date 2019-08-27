
reinsort.col <- function ( dat , toreinsort , after ) {

  stopifnot ( is.data.frame ( dat ) )
  if ( is.character ( toreinsort ) ) toreinsort <- which ( colnames ( dat ) %in% toreinsort )
  if ( is.character ( after ) ) after <- which ( colnames ( dat ) %in% after )
  stopifnot ( is.numeric ( toreinsort ) )
  stopifnot ( is.numeric ( after ) )
  stopifnot ( ! identical ( toreinsort , integer(0) ) )
  stopifnot ( ! identical ( after , integer(0) ) )

  sorted <- c ( which ( ! (1:after) %in% toreinsort ) , toreinsort , which ( ! seq ( along = colnames ( dat ) ) %in% c ( 1:after , toreinsort ) ) )

  dat <- dat [ , sorted ]

}
