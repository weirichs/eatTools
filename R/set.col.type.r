set.col.type <- function ( dat , col.type = list ( "character" = NULL ) , verbose = FALSE , ... ) {
		# Definitionen
		d <- dat
		# Checks
		notlist <- !inherits ( col.type , "list" )
		if ( notlist ) warning ( "'col.type' is not a list. 'dat' is returned unchanged." )
		notdataframe <- !inherits ( d , "data.frame" )
		if ( notdataframe ) warning ( "'dat' is not a data.frame. 'dat' is returned unchanged." )
		# weiter wenn Checks ok
		if ( !any ( c ( notlist , notdataframe ) ) ) {
				# Defaults
				if ( is.null ( col.type[[1]] ) ) {
						col.type[[1]] <- colnames ( d )
						col.type <- col.type[1]
				}
				# Check ob alle Variablen im Datensatz, ggf. droppen
				w <- !( vars <- unname ( unlist ( col.type ) ) ) %in% colnames ( d )
				if ( any ( w ) ) {
						warning ( paste ( "Variable(s)" , paste ( sort ( vars [ w ] ) , collapse = ", " ) , "is/are not in the dataset." ) )
						col.type <- mapply ( function ( el , excl ) {
								el [ !el %in% excl ]
						} , col.type , MoreArgs = list ( vars [ w ] ) , SIMPLIFY = FALSE )
				}
				# ggf. schrott Elemente droppen
				del <- which ( unname ( sapply ( col.type , function ( el ) { is.null ( el ) | identical ( el , character(0) ) } ) ) )
				if ( !identical ( del , integer(0) ) ) col.type <- col.type[-del]
				# erlaubte Umwandlungen
				allowed <- c ( "character" , "numeric" , "numeric.if.possible" , "logical" , "integer" , "factor" )
				del <- which ( !names ( col.type ) %in% allowed )
				if ( !identical ( del , integer(0) ) ) {
						warning ( paste ( "Conversion to" , paste ( names ( col.type ) [ del ] , collapse = " & " ) , "is not supported." ) )
						col.type <- col.type [ -del ]
				}
				# wenn noch was uebrig dann umwandeln
				if ( length ( col.type ) > 0 ) {
						# genamten Vektor erzeugen
						col.type <- unlist ( mapply ( function ( el , name ) {
								v <- rep ( name , length ( el ) )
								names ( v ) <- el
								v
						} , col.type , names ( col.type ) , SIMPLIFY = FALSE , USE.NAMES = FALSE ) )
						# Vektoren umwandeln
						vars.new <- mapply ( function ( var , to , ... ) {
								if ( to %in% c ( "numeric.if.possible" ) ) {
										str <- paste ( "if (!is.numeric(var)) {
																	tried <- try(var <- asNumericIfPossible(var,force.string=FALSE,...),silent=TRUE);
																	if (inherits(tried,'try-error')) var <- var;
																	var;
																	} else var" , sep = "" )
								} else {
										str <- paste ( "if (!is." , to , "(var)) {
																	tried <- try(var <- as." , to , "(var),silent=TRUE);
																	if (inherits(tried,'try-error')) var <- var;
																	var;
																	} else var" , sep = "" )
								}
								eval ( parse ( text = str ) )
						} , d[,names(col.type), drop = FALSE] , col.type , MoreArgs = list ( ... ) , SIMPLIFY = FALSE )
						# setzen
						do <- paste ( mapply ( function ( el ) { paste ( "try(d$" , el , "<-vars.new[['" , el , "']],silent=TRUE)" , sep = "" ) } , names ( vars.new ) ) , collapse = ";" )
						eval ( parse ( text = do ) )
						# check ob Conversion geklappt
						notok <- mapply ( function ( var , to ) {
								if ( to %in% c ( "numeric.if.possible" ) ) to <- "numeric"
								str <- paste ( "!is." , to , "(var)" , sep = "" )
								eval ( parse ( text = str ) )
						} , d[,names(col.type)] , col.type , SIMPLIFY = TRUE )
						if ( any ( notok ) ) warning ( paste ( "Conversion of variable(s)" , paste ( names ( col.type )[notok] , collapse = ", " ) ,
															   "to" , paste ( unique ( col.type[notok] ) , collapse = ", " ) , "failed." ) )
						# Ausgabe wenn verbose
						if ( verbose & length( ok <- col.type[!notok] ) ) {
								out <- paste ( paste ( names ( ok ) , "has been converted to" , unname ( ok ) ) , collapse = "\n" )
								cat ( paste ( out , "\n" ) )
						}
				}
		}
		return ( d )
}


# str ( d <- data.frame ( "var1" = 1 , "var2" = TRUE , "var3" = FALSE , "var4" = as.factor ( 1 ) , "var5" = as.factor ( "a" ) ,"var6" = "b" , stringsAsFactors = FALSE ) )
# str ( set.col.type ( d ) )
# str ( set.col.type ( d , list ( "numeric" = NULL ) ) )
# str ( set.col.type ( d , list ( "character" = c ( "var1" , "var2" ) , "numeric" = "var3" , "logical" = "var4" ) ) )
# str ( set.col.type ( d , list ( "numeric.if.possible" = NULL ) ) )
# str ( set.col.type ( d , list ( "numeric.if.possible" = NULL ) , transform.factors = TRUE ) )
# str ( set.col.type ( d , list ( "numeric.if.possible" = NULL ) , transform.factors = TRUE , maintain.factor.scores = FALSE ) )

