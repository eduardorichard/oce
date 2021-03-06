% vim:textwidth=100:expandtab:shiftwidth=2:softtabstop=2
\name{landsatTrim}

\alias{landsatTrim}

\title{Trim a landsat image to a lat-lon box}

\description{Trim a landsat image to a lat-lon box.}

\usage{landsatTrim(x, ll, ur, debug=getOption("oceDebug"))}

\arguments{
  \item{x}{A \code{landsat} object, e.g. as read by \code{\link{read.landsat}}.}

  \item{ll}{A list containing \code{longitude} and \code{latitude}, for the lower-left corner of the
    portion of the image to retain.}

  \item{ur}{A list containing \code{longitude} and \code{latitude}, for the upper-right corner of
    the portion of the image to retain.}
  
  \item{debug}{a flag that turns on debugging.  Set to 1 to get a moderate amount of debugging
    information, or a higher value for more debugging.}

}

\details{An error results if there is no intersection between the trimming box and the image box.
  Although the trimming box is specified in longitude-latitude coordinates, the actual trimming is
  done in UTM coordinates, because this is how Landsat image data are georeferenced.}
  
\value{An object of \code{\link[base]{class}} \code{"landsat"}, with data having been trimmed in
  some way.}

\seealso{The documentation for \code{\link{landsat-class}} explains the structure
    of landsat objects, and also outlines the other functions dealing with them.}

\author{Dan Kelley}

\keyword{misc}

