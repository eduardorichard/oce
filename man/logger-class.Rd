\name{logger-class}

\docType{class}

\alias{logger-class}
\alias{[[,logger-method}
\alias{[[<-,logger-method}
\alias{show,logger-method}

\title{Class to store temperature-depth recorder data}

\description{Class to store temperature-depth recorder data, with standard
    slots \code{metadata}, \code{data} and \code{processingLog}.}

\section{Methods}{Data may be accessed as e.g. \code{logger[["time"]]}, where the
    string could also be \code{"pressure"} or \code{"temperature"}.  Assignment
    to these can be made with e.g. \code{logger[["pressure"]] <- value}, etc.
    Indeed, any quantity in the \code{metadata} slot or the \code{data} slot
    can be retrieved or updated in this way.}

\seealso{A \code{logger} object may be read with \code{\link{read.logger}} or
    created with \code{\link{as.logger}}.  Plots can be made with
    \code{\link{plot.logger}}, while \code{\link{summary.logger}} produces
    statistical summaries and \code{show} produces overviews.   If atmospheric
    pressure has not been removed from the data, the functions
    \code{\link{loggerPatm}} may provide guidance as to its value.  Similarly,
    if the record contains periods when the instrument was in the air,
    \code{\link{loggerTrim}} may prove useful in isolating the times when it
    was in the water.  However, these last two functions are no equal to decent
    record-keeping at sea.}

\author{Dan Kelley}
\keyword{classes}
\keyword{oce}

