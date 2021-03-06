\name{sectionSmooth}

\alias{sectionSmooth}

\title{Smooth a section}

\description{Smooth a section in the lateral (alpha version that may change)}

\usage{sectionSmooth(section, method=c("spline", "barnes"), debug=getOption("oceDebug"), ...)}

\arguments{
    \item{section}{a \code{section} object containing the section to be smoothed.
        For \code{method="spline"}, the pressure levels must match for each
        station in the section.}
    \item{method}{specifies the method to use; see \sQuote{Details}.}
    \item{debug}{a flag that turns on debugging.  Set to 1 to get a
        moderate amount of debugging information, or to 2 to get more.}
    \item{\dots}{optional extra arguments, passed to either
        \code{\link{smooth.spline}} or \code{\link{interpBarnes}}.}
}

\details{This function should be used with caution, as should any operation
    that changes data.  Although smoothing may be desirable to produce
    aesthetically-pleasing plots, it can also introduce artifacts that can lead
    to erroneous conclusions.  The prudent analyst starts by comparing plots of
    the raw data with plots of the smoothed data.
    
    For \code{method="spline"}, the section is smoothed using
    \code{\link{smooth.spline}} on individual pressure levels, with any
    parameters listed in \code{parameters} being passed to that function.  If
    \code{df} is not present in \code{parameters}, then this function sets it
    to the number of stations divided by 5.  Smoothing is done separately for
    temperature, salinity, and sigma-theta.

    For the (much slower) \code{method="barnes"} method, smoothing is done
    across both horizontal and vertical coordinates, using
    \code{\link{interpBarnes}}.  Any arguments in \code{\dots} being passed to
    that function; see \sQuote{Examples}.
}

\value{An object of \code{\link[base]{class}} \code{"section"} that is smoother
    than the input section.}

\seealso{The documentation for \code{\link{section-class}} explains the
    structure of section objects, and also outlines the other functions dealing
    with them.}

\examples{
library(oce)
data(section)
gs <- subset(section, 109<=stationId&stationId<=129)
gsg <- sectionGrid(gs, p=seq(0, 5000, 150))
gss1 <- sectionSmooth(gsg, "spline", df=16)
plot(gss1)
gss2 <- sectionSmooth(gsg, "barnes", xr=24, yr=100)
plot(gss2)
}

\author{Dan Kelley}

\keyword{misc}
