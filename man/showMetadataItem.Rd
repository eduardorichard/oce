\name{showMetadataItem}

\alias{showMetadataItem}

\title{Show metadata item}

\description{Show metadata item}

\usage{showMetadataItem(object, name, label="", postlabel="", isdate=FALSE, quote=FALSE)}

\arguments{
  \item{object}{an object inheriting from the base \code{oce} class.}
  \item{name}{name of item}
  \item{label}{label to print before item}
  \item{postlabel}{label to print after item}
  \item{isdate}{boolean indicating whether the item is a time}
  \item{quote}{boolean indicating whether to enclose the item in quotes}
}

\details{This is a helper function for various \code{summary} functions.}
      
\value{None.}

\examples{
library(oce)
data(ctd)
showMetadataItem(ctd, "ship", "ship")
}

\author{Dan Kelley}

\keyword{misc}
