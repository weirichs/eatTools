\name{asNumericIfPossible}
\alias{asNumericIfPossible}
\title{
Convert Columns of a Data Frame Into Numeric Values If Possible
}
\description{
This function converts all columns of a data frame to class \code{numeric} for which this conversion is possible
i.e. without creating \code{NA} when it fails. Non-convertible columns are maintained. Optionally, 
only a logical vector indicating which columns are convertible is returned.
}
\usage{
asNumericIfPossible(dataFrame, set.numeric=TRUE, transform.factors=FALSE, maintain.factor.scores = TRUE,
      verbose=TRUE, ignoreAttributes = FALSE)
}
\arguments{
  \item{dataFrame}{A data frame which should be converted. }
  \item{set.numeric}{Logical: If \code{TRUE}, a data frame with all convertible columns converted to class \code{numeric} is returned. 
                             If \code{FALSE}, a logical vector indicating which columns are convertible to class \code{numeric}.  }
  \item{transform.factors }{Logical indicating whether columns of class \code{factor} should be converted. 
                              If \code{FALSE}, columns of class \code{factor} are maintained. 
                              If \code{TRUE}, conversion of factors is attempted.   } 
  \item{maintain.factor.scores}{Logical: 
                                  If \code{TRUE}, conversion of the factor levels is attempted
                                  (like in \code{as.numeric(as.character(f))}).
                                  If \code{FALSE}, the internal codes of the factor are returned 
                                  (like in \code{as.numeric(f)}).
                                  See 'Details'. This argument is only evaluated if \code{transform.factors = TRUE}.  }
  \item{verbose}{Logical: If \code{TRUE}, information about the class of the columns in the data.frame is given on the console.}
  \item{ignoreAttributes}{Logical: If \code{TRUE}, variable attributes are tried to restore after transformation.}
}
\details{
In \R, factors may represent ordered categories or categorical variables. Depending on the meaning of the variable, a conversion 
of the nominal values (of a factor variable) to numeric values may be desirable or not. The arguments \code{transform.factors} 
and \code{maintain.factor.scores} specify if and how factor variables should be treated. See examples. 
}
\value{
Either a logical vector indicating which columns in the data frame are convertible to class \code{numeric} 
    according to the specified conditions or a data frame in which all convertible columns are converted to class \code{numeric}. 
}
\author{
Sebastian Weirich
}
\examples{
dat <- data.frame(X1 = c("1",NA,"0"), X2 = c("a",NA,"b"), 
                  X3 = c(TRUE,FALSE,FALSE), X4 = as.factor(c("a",NA,"b")), 
                  X5 = as.factor(c("5","6","7")), stringsAsFactors = FALSE)
str(dat)
asNumericIfPossible(dat)
asNumericIfPossible(dat, transform.factors=TRUE, 
                      maintain.factor.scores=FALSE)
asNumericIfPossible(dat, transform.factors=TRUE, 
                      maintain.factor.scores=TRUE)
}
