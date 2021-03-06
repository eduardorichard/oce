\name{numberAsHMS}

\alias{numberAsHMS}

\title{Convert a numeric time to hour, minute, and second}

\description{Convert a numeric time to hour, minute, and second}

\usage{numberAsHMS(t, default=0)}

\arguments{

    \item{t}{a vector of factors or character strings, in the format 1200 for
        12:00, 0900 for 09:00, etc.}
    
    \item{default}{value to be used for the returned hour, minute and second if
        there is something wrong with the input value (e.g. its length exceeds
        4 characters, or it contains non-numeric characters)}

}

\value{A list containing \code{hour}, \code{minute}, and \code{second}, the
    last of which is always zero.}

\examples{
t <- c("0900", "1234")
numberAsHMS(t)
}

\seealso{\code{\link{numberAsHMS}}}

\author{Dan Kelley}

\keyword{misc}
