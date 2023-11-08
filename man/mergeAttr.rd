\name{mergeAttr}
\alias{mergeAttr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Merge Two Data Frames with additional messages and maintain variable attributes}
\description{This is a wrapper for the \code{\link[base]{merge}} function. \code{merge}
does not maintain variable attributes. \code{mergeAttr} might be useful if variable
attributes should be maintained. For example, if SPSS data are imported via
\code{\link[foreign]{read.spss}}, variable and value labels are stored
as attributes which get lost if data are merged subsequently. Moreover, function gives
additional messages if (combinations of) by-variables are not unique in at least one data.frame,
or if by-variables have different classes, or if some units of the by-variables are missing in
one of the data sets. Users are free to specify which kind of messages are desirable.}
\usage{
mergeAttr(x, y, by = intersect(names(x), names(y)),
      by.x = by, by.y = by, all = FALSE, all.x = all, all.y = all,
      sort = TRUE, suffixes = c(".x",".y"), setAttr = TRUE, onlyVarValLabs = TRUE,
      homoClass = TRUE, unitName = "unit", xName = "x", yName = "y",
      verbose = c("match", "unique", "class", "dataframe", "common"))}
\arguments{
  \item{x}{
first data frame to be merged.
}
  \item{y}{
second data frame to be merged.
}
  \item{by}{
specifications of the columns used for merging
}
  \item{by.x}{
specifications of the columns used for merging
}
  \item{by.y}{
specifications of the columns used for merging
}
  \item{all}{
logical; \code{all = L} is shorthand for \code{all.x = L} and \code{all.y = L},
where \code{L} is either \code{TRUE} or \code{FALSE}.
}
  \item{all.x}{
logical; if \code{TRUE}, then extra rows will be added to the output, one for each
row in \code{x} that has no matching row in \code{y}. These rows will have \code{NAs} 
in those columns that are usually filled with values from \code{y}. The default 
is \code{FALSE}, so that only rows with data from both \code{x} and \code{y} are 
included in the output.
}
  \item{all.y}{
logical; analogous to \code{all.x}.
}
  \item{sort}{
logical. Should the result be sorted on the \code{by} columns?
}
  \item{suffixes}{
a character vector of length 2 specifying the suffixes to be used for making unique
the names of columns in the result which not used for merging (appearing in \code{by} etc).
}
  \item{setAttr}{
Logical: restore the variable attributes? If FALSE, the behavior of \code{mergeAttr} equals
the behavior of \code{merge}.
}
  \item{onlyVarValLabs}{
Logical: If TRUE, only the variable and value labels as captured by \code{read.spss} and
stored by \code{convertLabel} from the \code{eatAnalysis} package will be restored.
If FALSE, all variable attributes will be restored.
}
  \item{homoClass}{
Logical: Beginning with R version 3.5, \code{merge} may give an error if the class of the
by-variables differs in both data.frames. If TRUE, class of by-variable(s) will be homogenized
before merging.
}
  \item{unitName}{
Optional: Set the name for the unit variable to get more informative messages. This is mainly
relevant if \code{mergeAttr} is called from other functions.
}
  \item{xName}{
Optional: Set the name for the x data.frame to get more informative messages. This is mainly
relevant if \code{mergeAttr} is called from other functions.
}
  \item{yName}{
Optional: Set the name for the y data.frame to get more informative messages. This is mainly
relevant if \code{mergeAttr} is called from other functions.
}
  \item{verbose}{
Optional: Choose whether messages concerning missing levels in by-variables should be printed
on console (\code{"match"}), or messages concerning uniqueness of by-variables (\code{"unique"}),
or messages concerning different classes of by-variables (\code{"class"}), or messages concerning
appropriate class (\code{data.frame}) of \code{x} and \code{y} (\code{"dataframe"}), or messages
concerning additional common variables (except by-variables; \code{"common"})). Multiple choices
are possible, e.g. \code{verbose = c("match", "class")}. If \code{verbose = TRUE}, all
messages are printed, if \code{verbose = FALSE}, no messages are printed at all. The default
is equivalent to \code{verbose = TRUE}.
}
}
\value{
data frame. See the help page of \code{\link[base]{merge}} for further details.
}
\examples{
### data frame 1, variable 'y' with variable.label 'test participation'
df1 <- data.frame ( id = 1:3, sex = factor ( c("male", "male", "female")),
       happy = c("low", "low", "medium"))
attr(df1[,"happy"], "variable.label") <- "happieness in the workplace"

### data frame 2 without labels 
df2 <- data.frame ( id = as.factor(c(2,2,4)), status = factor ( c("married", "married", "single")),
       convicted = c(FALSE, FALSE, TRUE))

### lost label after merging
df3 <- merge(df1, df2, all = TRUE)
attr(df3[,"happy"], "variable.label")

### maintain label
df4 <- mergeAttr(df1, df2, all = TRUE, onlyVarValLabs = FALSE)
attr(df4[,"happy"], "variable.label")

### adapt messages
df5 <- mergeAttr(df1, df2, all = TRUE, onlyVarValLabs = FALSE, unitName = "student",
       xName = "student questionnaire", yName = "school questionnaire",
       verbose = c("match", "unique"))
}
