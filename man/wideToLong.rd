\name{wideToLong}
\alias{wideToLong}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Transform wide format data sets into the long format necessary for eatRep analyses}
\description{Data from large-scale assessments often are provided in the wide format.
This function easily transform data into the long format required by eatRep.}
\usage{
wideToLong (datWide, noImp, imp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{datWide}{
%%     ~~Describe \code{file} here~~
Data set in the wide format, i.e. one row per examinee
}
  \item{noImp}{
%%     ~~Describe \code{file} here~~
character vector of non-imputed variables which are desired for following analyses
}
  \item{imp}{
%%     ~~Describe \code{file} here~~
Names list of character vectors which include the imputed variables which are desired for following analyses
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
}
