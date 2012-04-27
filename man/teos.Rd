\name{teos}

\alias{teos}

\title{Interface to TEOS-10 library}

\description{Interface to TEOS-10 library}

\usage{teos(name, a1, a2, a3, a4, a5, a6, lib='/usr/local/lib/libgswteos-10.so')}

\arguments{
  \item{name}{the name of a TEOS-10 function}
  \item{a1}{the first argument to the TEOS-10 function}
  \item{a2}{the second argument to the TEOS-10 function}
  \item{a3}{the third argument to the TEOS-10 function}
  \item{a4}{the fourth argument to the TEOS-10 function}
  \item{a5}{the fifth argument to the TEOS-10 function, if there is one}
  \item{a6}{the sixth argument to the TEOS-10 function, if there is one}
  \item{lib}{the name of the shared library that provides TEOS-10.}
}

\details{This is a provisional support function, whose name and interface
    characteristics may change.  In particular, the present version of
    \code{teos} only permits 3 or 4 arguments to be provided.
    
    For \code{teos} to work, the user must download the C version of TEOS-10
    from the website listed in the references, then type \code{make install} at
    the command line, and finally copy the resultant \code{libgswteos-10.so}
    file to the directory \code{/usr/local/lib}.   For example, the steps
    listed below were used on the author's (OSX-based) machine.
\preformatted{
curl -OL http://www.teos-10.org/software/gsw_c_v3_0.zip
unzip gsw_c_v3_0.zip 
cd gsw-3.0
make library
sudo mv libgswteos-10.so /usr/local/lib
}
}

\value{Whatever the TEOS-10 function returns, with dimensions matching those of
    \code{a1}.}

\examples{
\dontrun{
## do not run this in checks, because it will fail unless TEOS-10 is installed
library(oce)
data(ctd)
sp <- ctd[["salinity"]]
temperature <- ctd[["temperature"]]
n <- length(sp)
p <- ctd[["pressure"]]
lat <- rep(ctd[["latitude"]], n)
lon <- rep(ctd[["longitude"]], n)
sa <- teos("gsw_sa_from_sp", sp, p, lon, lat)
par(mfrow=c(1,2))
plot(ctd, which="salinity")
lines(sa, p, col='red')
plot(ctd, which="density")
rhopot <- teos("gsw_pot_rho_t_exact", sa, temperature, p, rep(0,length(p)))
lines(rhopot - 1000, p, col='red')
}
}

\references{The TEOS-10 library is provided at \url{www.teos-10.org}.}

\author{Dan Kelley}

\keyword{misc}