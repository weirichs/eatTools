\name{wtdHetcor}
\alias{wtdHetcor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Weighted heterogeneous Correlation Matrix}
\description{Computes a weighted heterogenous correlation matrix, consisting of Pearson
product-moment correlations between numeric variables, polyserial correlations between
numeric and ordinal variables, and polychoric correlations between ordinal variables.
Variables in the data.frame should be accordingly classified as numeric or factor variables.
Function resembles the \code{hetcor} function from the \code{polycor} package, but allows
for incorporating weights. For this purpose, the function makes use of the \code{weightedCorr}
function from the \code{wCorr} package.}
\usage{
wtdHetcor ( dataFrame, vars=NULL, weights=NULL, out = c("wide", "long", "both") ) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataFrame}{
a data.frame containing all variables
}
  \item{vars}{
character or numeric vector indicating the variables for which a correlation table should
be computed. If \code{NULL}, all variables in the data.frame will be used.
}
  \item{weights}{
Numeric vector of non-negative weights. If \code{NULL}, equally weighted cases are
assumed, i.e. all weights are defaulted to 1.
}
  \item{out}{
Specifies the output format. \code{"wide"} gives a classical correlation matrix,
\code{"long"} gives a long format table which includes the type of correlation.
}
}
\value{
a correlation table or a list
}
\author{
Sebastian Weirich, based upon the \code{weightedCorr} function of the \code{wCorr} package
}
\examples{
data(mtcars)
# create arbitrary weights
mtcars[,"weight"] <- abs(rnorm(nrow(mtcars), 10,5))
# choose variables
vars <- c("mpg", "cyl", "hp")
# inappropriate classes: variables which are inherently ordinal, have the 'wrong'
# class 'numeric'. (We use only the first imputation of the data set.)
sapply(mtcars[,vars], class)
mtcars[,"cyl"] <- as.factor(mtcars[,"cyl"])
wtdHetcor(mtcars, vars = vars, out = "long")
wtdHetcor(mtcars, vars = vars, weights = "weight", out = "long")
}
