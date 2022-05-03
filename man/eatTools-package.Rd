\name{eatTools-package}
\alias{eatTools-package}
\docType{package}
\title{eatTools: Miscellaneous Functions for the Analysis of Educational Assessments}
\description{
The \code{eatTools} package provides various groups of functions. The main groups of functions include:
transformation of vector types, modification of character variables, descriptive analyses and weighted statistics. The package's purpose is mainly to function as a lightweight dependency for other packages.
}
\section{Transformation of vector types}{

The functions \code{\link{asNumericIfPossible}} and \code{\link{catch_asNumericIfPossible}} transform character and factor variables to numeric. \code{\link{facToChar}} transforms factor variables to character. \code{\link{set.col.type}} allows manually setting the type of multiple variables within a \code{data.frame}.
}

\section{Modification of character variables}{

Multiple convenience functions exist for modification of character variables: removing certain pattern (\code{\link{removePattern}}), removing numerics (\code{\link{removeNumeric}}) and removing non numerics (\code{\link{removeNonNumeric}}), substituting multiple patterns within a string (\code{\link{gsubAll}}) and splitting strings into multiple or a fixed number of parts but at specific position (\code{\link{halveString}})
}

\section{Descriptive Statistics}{

The function \code{\link{descr}} provides simple descriptive statistics for a \code{data.frame}, but in a format especially useful for further automated processing (long format \code{data.frame}).
}

\section{Weighted Statistics}{

\code{\link{wtdVar}} provides calculation of weighted variances (this can be done also by the package \code{Hmisc}, which has, however, a very high number of dependencies). \code{\link{wtdTable}} provides a weighted frequency table.
}
