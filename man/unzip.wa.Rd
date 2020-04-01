\name{unzip.wa}
\alias{unzip.wa}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Unzip files into desired directory}
\description{This is a workaround function for \code{unzip} which provides
unexpected errors especially with data bases. \code{unzip.wa} calls the
unzip.exe via a temporary batch file.}
\usage{
unzip.wa( zipfile, targetdir = tempdir(), unzip.exe = "c:/Program Files/tools/unzip.exe")}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{zipfile}{
%%     ~~Describe \code{file} here~~
Folder of the zip file which should be uncompressed.
}
  \item{targetdir}{
%%     ~~Describe \code{file} here~~
The folder in which the content should be written.
}
  \item{unzip.exe}{
%%     ~~Describe \code{file} here~~
The folder of the unzip.exe program.
}
}
\details{
Function uses the unzip.exe which is freely available at
http://stahlworks.com/dev/index.php?tool=zipunzip#zipexamp
}
\examples{
\dontrun{
### gives error
zip::unzip(zipfile = "q:/BT2016/BT/05_Anschreiben/03_Anschreiben_IQB_an_Eltern_Lehrer_Schulleiter/00_Archiv/20151110_finale_Unterlagen_Genehmigungsverfahren/LV_2016_Unterlagen_BB.zip", exdir=tempdir())
### works fine
unzip.wa(zipfile = "q:/BT2016/BT/05_Anschreiben/03_Anschreiben_IQB_an_Eltern_Lehrer_Schulleiter/00_Archiv/20151110_finale_Unterlagen_Genehmigungsverfahren/LV_2016_Unterlagen_BB.zip")
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
