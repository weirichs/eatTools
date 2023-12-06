\name{buildExpr}
\alias{buildExpr}
\title{Build expressions for internally used functions with many arguments}
\description{internally used function to save space and avoid copy/paste when
functions with many arguments are internally called}
\usage{
buildExpr (prefix = "", funName, env, argsUsed, lookup, suffix = "", verbose=TRUE)}
\arguments{
  \item{prefix}{
A string of length 1 which is used as the prefix of the expression
}
  \item{funName}{
name of the function which should be called
}
  \item{env}{
The environment where to look for the arguments
}
  \item{argsUsed}{
optional: numeric vector of the arguments which should be used. If missing,
all arguments will be used.
}
  \item{lookup}{
optional: a lookup table used for replacing argument values (overwriting defaults).
\code{lookup} is a data.frame with exact two columns. First column includes old values,
second column new values. Values which do not occur in the lookup table will be maintained.
}
  \item{suffix}{
A string of length 1 which is used as the suffix of the expression
}
  \item{verbose}{
Logical: print messages to console?
}
}
\value{
a string which can be evaluated with \code{eval(parse(text=[string]))}
}
\examples{
variable <- c(rnorm(n=50, 1, 1), NA)
na.rm    <- TRUE
expr     <- buildExpr (prefix = "descr(", funName="descr",env = environment(),
            lookup = data.frame ( old = "verbose", new = "FALSE"),
            suffix = ")", verbose=TRUE)
eval(parse(text=expr))
}
