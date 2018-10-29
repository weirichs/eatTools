\name{mergeAttr}
\alias{mergeAttr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Merge Two Data Frames and maintain variable attributes}
\description{This is a wrapper for the \code{merge} function from the \code{base} 
package. \code{merge} does not maintain variable attributes. \code{mergeAttr} might
be useful if variable attributes should be maintained.}
\usage{
mergeAttr(x, y, by = intersect(names(x), names(y)),
      by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all,
      sort = TRUE, suffixes = c(".x",".y"), setAttr = TRUE, onlyVarValLabs = TRUE,
      homoClass = TRUE)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{file} here~~
first data frame to be merged. 
}
  \item{y}{
%%     ~~Describe \code{file} here~~
second data frame to be merged. 
}
  \item{by}{
%%     ~~Describe \code{file} here~~
specifications of the columns used for merging
}
  \item{by.x}{
%%     ~~Describe \code{file} here~~
specifications of the columns used for merging
}
  \item{by.y}{
%%     ~~Describe \code{file} here~~
specifications of the columns used for merging
}
  \item{all}{
%%     ~~Describe \code{file} here~~
logical; \code{all = L} is shorthand for \code{all.x = L} and \code{all.y = L}, 
where \code{L} is either \code{TRUE} or \code{FALSE}.
}
  \item{all.x}{
%%     ~~Describe \code{file} here~~
logical; if \code{TRUE}, then extra rows will be added to the output, one for each 
row in \code{x} that has no matching row in \code{y}. These rows will have \code{NAs} 
in those columns that are usually filled with values from \code{y}. The default 
is \code{FALSE}, so that only rows with data from both \code{x} and \code{y} are 
included in the output.
}
  \item{all.y}{
%%     ~~Describe \code{file} here~~
logical; analogous to \code{all.x}.
}
  \item{sort}{
%%     ~~Describe \code{file} here~~
logical. Should the result be sorted on the \code{by} columns?
}
  \item{suffixes}{
%%     ~~Describe \code{file} here~~
a character vector of length 2 specifying the suffixes to be used for making unique 
the names of columns in the result which not used for merging (appearing in \code{by} etc).
}
  \item{setAttr}{
%%     ~~Describe \code{file} here~~
Logical: restore the variable attributes? If FALSE, the behavior of \code{mergeAttr} equals
the behavior of \code{merge}.
}
  \item{onlyVarValLabs}{
%%     ~~Describe \code{file} here~~
Logical: If TRUE, only the variable and value labels will be restored. If FALSE, all
variable attributes will be restored.
}
  \item{homoClass}{
%%     ~~Describe \code{file} here~~
Logical: Beginning with R version 3.5, \code{merge} may give an error if the class of the
by-variables differs in both data.frames. If TRUE, class of by-variable(s) will be homogenized
before merging.
}
}
\value{
data frame. See the help page of \code{merge} for further details. 
}
\author{
Sebastian Weirich
}
\examples{
### data frame 1, variable 'y' with variable.label 'test participation'
df1 <- data.frame ( id = 1:3, sex = factor ( c("male", "male", "female")), y = c(TRUE,FALSE,FALSE))
attr(df1[,"y"], "variable.label") <- "test participation"

### data frame 2 without labels 
df2 <- data.frame ( id = c(2,4), status = factor ( c("married", "single")), z = c(TRUE,FALSE))

### lost label after merging
df3 <- merge(df1, df2, all = TRUE)
attr(df3[,"y"], "variable.label")

### maintain label
df4 <- mergeAttr(df1, df2, all = TRUE, onlyVarValLabs = FALSE)
attr(df4[,"y"], "variable.label")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
