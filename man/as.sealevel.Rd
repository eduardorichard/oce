\name{as.sealevel}
\alias{as.sealevel}
\title{Coerce data into sea-level dataset}
\description{
  Coerces a dataset (minimally, a sequence of times and heights) into
  a sealevel dataset.
}
\usage{as.sealevel(elevation,  time,  header=NULL,
  stationNumber=NA, stationVersion=NA, stationName=NULL,
  region=NULL, year=NA, longitude=NA, latitude=NA, GMTOffset=NA,
  decimationMethod=NA, referenceOffset=NA, referenceCode=NA, deltat)
}
\arguments{
  \item{elevation}{a list of sea-level heights in metres, in an hourly sequence.}
  \item{time}{optional list of times, in POSIXct format.  If missing, the
    list will be constructed assuming hourly samples, starting at
    0000-01-01 00:00:00.}
  \item{header}{a character string as read from first line of a standard
    data file.}
  \item{stationNumber}{three-character string giving station number.}
  \item{stationVersion}{single character for version of station.}
  \item{stationName}{the name of station (at most 18 characters).}
  \item{region}{the name of the region or country of station (at most 19
    characters).}
  \item{year}{the year of observation.}
  \item{longitude}{the longitude in decimal degrees, positive east of
    Greenwich.}
  \item{latitude}{the latitude in decimal degrees, positive north of the
    equator.}
  \item{GMTOffset}{offset from GMT, in hours.}
  \item{decimationMethod}{a coded value, with 1 meaning filtered, 2
    meaning a simple average of all samples, 3 meaning spot readings,
    and 4 meaning some other method.}
  \item{referenceOffset}{?}
  \item{referenceCode}{?}
  \item{deltat}{optional interval between samples, in hours (as for the
    \code{\link{ts}} timeseries function). If this is not provided, and
    \code{t} can be understood as a time, then the difference between
    the first two times is used.  If this is not provided, and \code{t}
    cannot be understood as a time, then 1 hour is assumed.}
}
\details{
  The arguments are based on the standard data format, as described
  at \url{ftp://ilikai.soest.hawaii.edu/rqds/hourly.fmt}.
}

\value{An object of \code{\link[base]{class}} \code{"sealevel"} (for
  details, see \code{\link{read.sealevel}}).}

\seealso{The documentation for \code{\link{sealevel-class}} explains the
    structure of sealevel objects, and also outlines the other functions
    dealing with them.}

\examples{
library(oce)

# Construct a year of M2 tide, starting at the default time
# 0000-01-01T00:00:00.
h <- seq(0, 24*365)
elevation <- 2.0 * sin(2*pi*h/12.4172)
sl <- as.sealevel(elevation)
summary(sl)

# As above, but start at the Y2K time.
time <- as.POSIXct("2000-01-01") + h * 3600
sl <- as.sealevel(elevation, time)
summary(sl)
}
\references{\url{ftp://ilikai.soest.hawaii.edu/rqds/hourly.fmt}.}
\author{Dan Kelley}
\keyword{misc}
