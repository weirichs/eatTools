\name{checkBackgroundVariables}
\alias{checkBackgroundVariables}
\title{Internally needed function for consistency checks and data preparation.}
\description{Function is necessary for \code{eatRep} and \code{eatModel} to verify
input consistency and therefore exported to namespace.}
\usage{
checkBackgroundVariables (varList, len1 = NULL, overlap = NULL)
}
\arguments{
  \item{varList}{
A non-nested list of objects, where each individual object corresponds to the returned
object of the \code{\link{existsBackgroundVariables}} function.
}
  \item{len1}{
The names of \code{varList} which elements must have length 1.
}
  \item{overlap}{
A list of variable groups which elements must overlap with a given frequency.
}
}
\details{
The function checks whether certain variables or variable groups that are used
for analyses within eatRep or eatModel fulfill certain properties. For example,
there may only be one ID variable, but there must be several item variables (items).
Item variables and other covariates must be disjoint, while variables for group
differences must be a subset of the group variables.
}
\value{
There are no returns. If the input is inconsistent, the functions aborts with an error message.
}
\examples{
\dontrun{
# borrow some data from the BIFIEsurvey package
data(data.timss1)
varGroups <- list(ID = "IDSTUD", wgt = c("TOTWGT","JKZONE"),
    covars = c("female", "books", "lang", "migant"), depVar = "ASMMAT")

# error if one variable does not occur in data due to typo
varList   <- lapply(varGroups, FUN = function (v) {
    existsBackgroundVariables (dat=data.timss1[[1]], variable=v)
})

# correction
varGroups <- list(ID = "IDSTUD", wgt = c("TOTWGT","JKZONE"),
    covars = c("female", "books", "lang", "migrant"), depVar = "ASMMAT")
varList   <- lapply(varGroups, FUN = function (v) {
    existsBackgroundVariables (dat=data.timss1[[1]], variable=v)
})

# however, only one weighting variable is allowed
check     <- checkBackgroundVariables (varList, len1 = c("ID", "wgt", "depVar"),
             overlap = NULL)

# only one of the covariates should be used for group differences
# difference variable must be included in covars
varGroups <- list(ID = "IDSTUD", wgt = "TOTWGT", covars = c("female", "books", "lang"),
             differencesFor = "migrant", depVar = "ASMMAT")
varList   <- lapply(varGroups, FUN = function (v) {
    existsBackgroundVariables (dat=data.timss1[[1]], variable=v)
})
check     <- checkBackgroundVariables (varList, len1 = c("ID", "wgt", "depVar"),
             overlap = list(v1 = list(vars = c("covars","differencesFor"), len = 1)))
}}
