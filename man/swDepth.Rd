\name{swDepth}

\alias{swDepth}
\alias{swZ}

\title{Water depth}

\description{Compute depth from pressure and latitude.}

\usage{
swDepth(pressure, latitude=45, degrees=TRUE)
swZ(pressure, latitude=45, degrees=TRUE)
}

\arguments{
  \item{pressure}{either pressure [dbar], in which case \code{lat} must also be
    given, or a \code{ctd} object, in which case \code{lat} will be
    inferred from the object.}
  \item{latitude}{Latitude in \eqn{^\circ}{deg}N or radians north of the equator.}
  \item{degrees}{Flag indicating whether degrees are used for latitude;
    if set to \code{FALSE}, radians are used.}
}

\details{Depth is calculated from pressure using Saunders and Fofonoff's
  method, with the formula refitted for 1980 UNESCO equation of state
  (UNESCO, 1983).

  Check value: 9712.653 m for 10,000 dbar at 30 deg latitude.}

\value{For \code{swDepth}, depth below the ocean surface, in metres.
  For \code{swZ}, the negative of the depth, i.e. the distance above
  the surface.}

\examples{d <- swDepth(10, 45)}

\references{Unesco 1983. Algorithms for computation of fundamental
      properties of seawater, 1983. \emph{Unesco Tech. Pap. in
      Mar. Sci.}, No. 44, 53 pp.}

\author{Dan Kelley}

\keyword{misc}
