\name{set.col.type}
\alias{set.col.type}
\title{
Set the Class of Columns in a Data Frame
}
\description{
This function converts the classes of columns to \code{character}, \code{numeric}, \code{logical}, \code{integer} or \code{factor}.
}
\usage{
set.col.type(dat, col.type = list("character" = NULL), verbose = FALSE, ...)
}
\arguments{
  \item{dat}{ A data frame }
  \item{col.type}{A named list of column names that are to be converted. The names of the list indicate the class to which the respective column should be converted (\code{character}, \code{numeric}, \code{numeric.if.possible}, \code{logical}, \code{integer} or \code{factor}) }
  \item{verbose}{ if \code{TRUE} details about converted columns are printed on the console}
  \item{...}{Additional arguments to be passed to \code{asNumericIfPossible}
}}
\details{
Use \code{col.type="numeric.if.possible"} if conversion to numeric should be tested upfront, see \code{asNumericIfPossible} for details.
}
\value{
A data frame with column classes changed according to the specifications in \code{col.type}
}
\author{
Martin Hecht, Karoline Sachse
}

\seealso{
\code{asNumericIfPossible}}

\examples{
str(d <- data.frame("var1" = 1, "var2" = TRUE, "var3" = FALSE,
    "var4" = as.factor(1), "var5" = as.factor("a"),"var6" = "b",
    stringsAsFactors = FALSE))

str(set.col.type(d))
str(set.col.type(d, list("numeric" = NULL)))
str(set.col.type(d, list("character" = c("var1" , "var2"),
    "numeric" = "var3", "logical" = "var4")))
str(set.col.type(d, list("numeric.if.possible" = NULL)))
str(set.col.type(d, list("numeric.if.possible" = NULL),
    transform.factors = TRUE))
str(set.col.type(d, list("numeric.if.possible" = NULL), transform.factors = TRUE,
    maintain.factor.scores = FALSE))
}
