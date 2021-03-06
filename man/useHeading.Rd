\name{useHeading}

\alias{useHeading}

\title{Replace the heading for one instrument with the heading for
  another}

\description{Replace the heading for one instrument with the heading for
  another.}

\usage{useHeading(b, g, add=0)}

\arguments{
  \item{b}{object holding data from an instrument whose heading is
    bad, but whose other data are good.}
  \item{g}{object holding data from an instrument whose heading is
    good, and should be interpolated to the time base of \code{b}.}
  \item{add}{an angle, in degrees counterclockwise, to be added to the
    heading.}
}

\value{A copy of \code{b}, but with \code{b$data$heading} replaced
  with an angle that result from linear interpolation of the headings in
  \code{g}, and then adding the angle \code{add}.}

\author{Dan Kelley}

\keyword{misc}
