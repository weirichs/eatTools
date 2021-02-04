\name{wideToLong}
\alias{wideToLong}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform wide format data sets into the long format necessary for eatRep analyses}
\description{Data from large-scale assessments often are provided in the wide format. 
This function easily transform data into the long format required by eatRep.}
\usage{
wideToLong (datWide, noImp, imp, multipleColumns = TRUE, variable.name = "variable",
            value.name = "value")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{datWide}{
%%     ~~Describe \code{file} here~~
Data set in the wideformat, i.e. one row per examinee
}
  \item{noImp}{
%%     ~~Describe \code{file} here~~
character vector of non-imputed variables which are desired for following analyses
}
  \item{imp}{
%%     ~~Describe \code{file} here~~
Named list of character vectors which include the imputed variables which are desired for following analyses
}
  \item{multipleColumns}{
Logical: use one column for each imputed variable (if more than one imputed variable is used)?
Alternatively, only one column for all imputed variables is used (this is the default behavior
of the \code{\link[reshape2]{melt}} function from the \code{reshape2} package).
}
  \item{variable.name}{
Applies only if \code{multipleColumns = "TRUE"}: name of variable used to store measured variable names
}
  \item{value.name}{
Applies only if \code{multipleColumns = "TRUE"}: name of variable used to store values
}
}
\value{
A data.frame in the long format.
}
\author{
Sebastian Weirich
}
\examples{
### create arbitrary wide format large-scale assessment data for two
### subjects, each with three imputations
datWide <- data.frame ( id = paste0("P",1:5), weight = abs(rnorm(5,10,1)),
           country = c("USA", "BRA", "TUR", "GER", "AUS"),
           sex = factor(c("female", "male", "female", "female", "male")),
           matrix(data = rnorm(n=15, mean = 500, sd = 75),
                  nrow=5, dimnames = list(NULL, paste0("mat.pv", 1:3))),
           matrix(data = rnorm(n=15, mean = 480, sd = 80),
                  nrow=5, dimnames = list(NULL, paste0("sci.pv", 1:3))),
           stringsAsFactors=FALSE)
datLong <- wideToLong(datWide = datWide, noImp = c("id", "weight", "country", "sex"),
             imp = list ( math = paste0("mat.pv", 1:3),
			             science = paste0("sci.pv", 1:3)))
datLong2<- wideToLong(datWide = datWide, noImp = c("id", "weight", "country", "sex"),
             imp = list ( math = paste0("mat.pv", 1:3),
			             science = paste0("sci.pv", 1:3)),
			       multipleColumns = FALSE, variable.name = "varName", value.name = "val")
}
