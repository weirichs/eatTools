\name{createSpssSyntaxSnippet}
\alias{createSpssSyntaxSnippet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Prepare SPSS syntax to transfer variable and value labels into an SPSS data set.}
\description{Usually, variable and value labels are lost if ASCII data is imported into SPSS.
Variable and value labels normally must be reestablished using SPSS syntax file. The function
prepares an SPSS syntax snippet from the variable and value lables stored as attributes in R.
}
\usage{
createSpssSyntaxSnippet(dat , file, keep = TRUE)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{file} here~~
R data frame. Variable and value labels must be stored in attributes as provided, for example,
by the function \code{convertLabel}.
}
  \item{file}{
%%     ~~Describe \code{file} here~~
Character string with the name of syntax file which should be created.
}
  \item{keep}{
%%     ~~Describe \code{file} here~~
Logical: Create value labels even if the value does not occur in the data? For example, if
\code{keep = TRUE}, \code{createSpssSyntaxSnippet} will write labels also for males, even
if the data only contains females.
}
}
\value{
No return, the SPSS syntax file is written to disk.
}
\author{
Sebastian Weirich
}
\examples{
\dontrun{
dat <- foreign::read.spss("q:/BT2016/BT/32_Schulrückmeldungen/01_Input/Daten/Neue_Gadserstellung/BS_LV_Primar_2016_Matchingvorlaeufig_09_erweiterteGadsversion.sav",
       to.data.frame=FALSE, use.value.labels = FALSE, reencode = "65001")
dat <- convertLabel(dat)
createSpssSyntaxSnippet( dat = dat, file = "c:/labels.txt", keep = FALSE)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }
