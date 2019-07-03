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
Data set in the wideformat, i.e. one row per examinee
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
data(data.timss3, package = "BIFIEsurvey")
timssLong <- wideToLong(datWide = data.timss3, noImp = c("IDSTUD", "TOTWGT", "JKZONE", "JKREP", "female"), 
             imp = list ( mat = c("ASMMAT1", "ASMMAT2", "ASMMAT3", "ASMMAT4", "ASMMAT5"), 
			             nawi = c("ASSSCI1", "ASSSCI2", "ASSSCI3", "ASSSCI4", "ASSSCI5")))
}
