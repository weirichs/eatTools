\name{existsBackgroundVariables}
\alias{existsBackgroundVariables}
\title{Internally needed function for consistency checks and data preparation.}
\description{Function is necessary for \code{eatRep} and \code{eatModel} as well
and therefore exported to namespace.}
\usage{
existsBackgroundVariables (dat, variable, warnIfMissing = FALSE,
     stopIfMissingOnVars = NULL)
}
\arguments{
  \item{dat}{
A data frame
}
  \item{variable}{
column number or variable name
}
  \item{warnIfMissing}{
Logical: gives a warning if the variable contains missing values
}
  \item{stopIfMissingOnVars}{
Optional: Applies only if \code{warnIfMissing = TRUE}. Character vectors with
variable names where missings are strictly forbidden. If missings occur on these
variables, function stops with an error instead of simply producing a warning.
}
}
\value{
a structured list of variable names
}
\examples{
data(mtcars)
existsBackgroundVariables(mtcars, 2:4)
}

