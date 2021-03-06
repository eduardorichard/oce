\name{ctdRaw}
\docType{data}
\alias{ctdRaw}
\title{Seawater CTD profile, without trimming of extraneous data}

\description{This is sample CTD profile provided for testing.  It
  includes not just the (useful) portion of the dataset during which the
  instrument was being lowered, but also data from the upcast and from
  time spent near the surface.  Spikes are also clearly evident in the
  pressure record.  With such real-world wrinkles, this dataset provides a good
  example of data that need trimming with the Oce function \code{ctdTrim}.}

\usage{data(ctdRaw)}

\source{The data were acquired near the centre of the Bedford Basin of the
    Halifax Harbour, during an October 2003 field trip of Dalhousie
    University's Oceanography 4120/5120 class.}

\author{Dan Kelley}

\seealso{The documentation for \code{ctd-class} in the Oce package explains the
    structure of CTD objects, and also outlines the other functions dealing
    with them.}

\keyword{datasets}
