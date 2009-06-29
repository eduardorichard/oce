\name{adp}

\docType{data}

\alias{adp}

\title{Sample ADP dataset}

\description{This is a sampling of measurements made with an
  upward-pointing ADP (acoustic doppler current profiler) manufactured
  by Teledyne-RDI, as part of the St Lawrence Internal Wave Experiment.}

\examples{
library(oce)
data(adp)
adp.earth <- adp.frame2earth(adp.beam2frame(adp))

# Plot overview images
plot(adp.earth)

# Plot diagnostic timeseries.  Angles should be constant for a mooring.
plot(adp.earth, which=13:18)
}

\usage{data(adp)}

\source{This file was created with the following command (which uses
  a large file that is not provided with the package).  Note the
  use of UTC, to match how the instrument was set up.
\preformatted{
adp <- read.oce("~/SL08F001.000", 
                from=as.POSIXct("2008-06-26", tz="UTC"),
                to=as.POSIXct("2008-06-27", tz="UTC"), 
                by="30:00")
}
}

\seealso{See \code{\link{read.adp}} for notes on the contents of
  \code{adp} objects, and for functions to work with them.}

\author{Dan Kelley}

\keyword{misc}