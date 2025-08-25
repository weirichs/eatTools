\name{data.timss1}

\docType{data}

\alias{data.timss1}

\title{Example dataset TIMSS 2011}

\description{
The dataset \code{data.timss1} is borrowed from the \code{BIFIEsurvey} package.
\code{data.timss1} is a list containing 5 imputed datasets.
}

\usage{data(data.timss1)}

\format{'list': 5 imputed data sets, each which 4668 observations and 12 variables
  \describe{
    \item{IDSTUD}{individual student identifier}
    \item{TOTWGT}{Total case weight}
    \item{JKZONE}{jackknifing zone}
    \item{JKREP}{jackknife replicate}
    \item{female}{indicator whether student's sex is female}
    \item{books}{Number of books at home}
    \item{lang}{language spoken at home}
    \item{migrant}{student's migration background}
  	\item{scsci}{self concept science}
  	\item{likesc}{pleasure in science}
  	\item{ASMMAT}{student's score in math}
  	\item{ASSSCI}{student's score in science}
 }
}

\references{
  Robitzsch, A., & Oberwimmer, K. (2024). BIFIEsurvey: Tools for survey statistics in
    educational assessment. R package version 3.6-6, https://CRAN.R-project.org/package=BIFIEsurvey.
}
