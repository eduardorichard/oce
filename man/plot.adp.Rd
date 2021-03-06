\name{plot.adp}

\alias{plot.adp}
\alias{plot,adp,missing-method}
\alias{plot,adp-method}

\title{Plot ADP data}

\description{Plot ADP data}

\usage{\S4method{plot}{adp}(x, which=1:dim(x@data$v)[3],
     mode=c("normal", "diagnostic"),
     col, breaks,
     zlim,
     titles,
     lwd=par('lwd'),
     type='l',
     ytype=c("profile", "distance"),
     adorn=NULL,
     drawTimeRange=getOption("oceDrawTimeRange"),
     useSmoothScatter,
     missingColor="gray",
     mgp=getOption("oceMgp"),
     mar=c(mgp[1]+1.5,mgp[1]+1.5,1.5,1.5),
     mai.palette=rep(0, 4),
     tformat,
     marginsAsImage=FALSE,
     cex=par("cex"), cex.axis=par("cex.axis"), cex.main=par("cex.main"),
     xlim, ylim, 
     control,
     useLayout=FALSE,
     coastline="coastlineWorld",
     main="",
     grid=FALSE, grid.col="darkgray", grid.lty="dotted", grid.lwd=1,
     debug=getOption("oceDebug"),
     \dots)}

\arguments{
  \item{x}{an \code{adp} object, e.g. as read by \code{\link{read.adp}}.}
  \item{which}{list of desired plot types.  These are graphed in
    panels running down from the top of the page.  See
    \dQuote{Details} for the meanings of various values of
    \code{which}.}
  \item{mode}{a string indicating whether to plot the conventional signal
      (\code{normal}) or or, in the special case of Aquadopp single-bin
      profilers, possibly the \code{diagnostic} signal.  This argument is
      ignored except in the case of Aquadopp instruments.  Perhaps a third
      option will become available in the future, for the \code{burst} mode
      that some instruments provide.}
  \item{col}{optional indication of colour(s) to use.  If not provided,
    the default for images is \code{oceColorsPalette(128,1)}, and for
    lines and points is black.}
  \item{breaks}{optional breaks for color scheme}
  \item{zlim}{a range to be used as the \code{zlim} parameter to the
      \code{\link{imagep}} call that is used to create the image.  If omitted,
      \code{zlim} is set for each panel individually, to encompass the data of
      the panel and to be centred around zero.  If provided as a two-element
      vector, then that is used for each panel.  If provided as a two-column
      matrix, then each panel of the graph uses the corresponding row of the
      matrix; for example, setting \code{zlim=rbind(c(-1,1),c(-1,1),c(-.1,.1))}
      might make sense for \code{which=1:3}, so that the two horizontal
      velocities have one scale, and the smaller vertical velocity has another.}

  \item{titles}{optional vector of character strings to be used as
    labels for the plot panels.  For images, these strings will be
    placed in the right hand side of the top margin.  For timeseries,
    these strings are ignored.
    If this is provided, its length must equal that of \code{which}.}
  \item{lwd}{if the plot is of a time-series or scattergraph format with lines,
      this is used in the usual way; otherwise, e.g. for image formats, this is ignored.}
  \item{type}{if the plot is of a time-series or scattergraph format, this is
      used in the usual way, e.g. \code{"l"} for lines, etc.; otherwise, as for
      image formats, this is ignored.}
  \item{ytype}{character string controlling the type of the y axis for
    images (ignored for time series).  If \code{"distance"}, then the y
    axis will be distance from the sensor head, with smaller distances
    nearer the bottom of the graph.  If \code{"profile"}, then this will
    still be true for upward-looking instruments, but the y axis will be
    flipped for downward-looking instruments, so that in either case,
    the top of the graph will represent the sample nearest the sea
    surface.}
  \item{adorn}{list of expressions to be executed for the panels in
    turn, e.g. to adorn the plots.  If the number matches the number of
    panels, then the strings are applied to the appropriate panels, 
    as they are drawn from top-left to bottom-right.   If only a single
    expression is provided, it is used for all panels.  (See
    \dQuote{Examples}.)}
  \item{drawTimeRange}{boolean that applies to panels with time as the
    horizontal axis, indicating whether to draw the time range in 
    the top-left margin of the plot.}
  \item{useSmoothScatter}{boolean that indicates whether to use
      \code{\link{smoothScatter}} in various plots, such as \code{which="uv"}.
      If not provided a default is used, with \code{\link{smoothScatter}} being
      used if there are more than 2000 points to plot.}
  \item{missingColor}{colour used to indicate \code{NA} values in images (see
      \code{\link{imagep}}); set to \code{NULL} to avoid this indication.}
  \item{mgp}{3-element numerical vector to use for \code{par(mgp)}, and
    also for \code{par(mar)}, computed from this.  The default is
    tighter than the R default, in order to use more space for the data
    and less for the axes.}
  \item{mar}{value to be used with \code{\link{par}("mar")}.}
  \item{mai.palette}{margins, in inches, to be added to those calculated
      for the palette; alter from the default only with caution}
  \item{tformat}{optional argument passed to \code{\link{oce.plot.ts}}, for
      plot types that call that function.  (See \code{\link{strptime}} for the
      format used.)}
  \item{marginsAsImage}{boolean, \code{TRUE} to put a wide margin to the
    right of time-series plots, even if there are no images in the \code{which}
    list.  (The margin is made wide if there are some images in the sequence.)}
  \item{cex}{size of labels on axes; see \code{\link[graphics]{par}}("cex").}
  \item{cex.axis}{see \code{\link[graphics]{par}}("cex.axis").}
  \item{cex.main}{see \code{\link[graphics]{par}}("cex.main").}
  \item{xlim}{optional 2-element list for \code{xlim}, or 2-column matrix, in which case
    the rows are used, in order, for the panels of the graph.}
  \item{ylim}{optional 2-element list for \code{ylim}, or 2-column matrix, in which case
    the rows are used, in order, for the panels of the graph.}
  \item{control}{optional list of parameters that may be used for
    different plot types.  Possibilities are \code{drawBottom} (a boolean 
    that indicates whether to draw the bottom) and \code{bin} (a numeric giving
    the index of the bin on which to act, as explained in \dQuote{Details}).}
  \item{useLayout}{set to \code{FALSE} to prevent using
    \code{\link{layout}} to set up the plot.  This is needed if the call
    is to be part of a sequence set up by e.g. \code{par(mfrow)}.}
  \item{coastline}{a \code{coastline} object, or a character string naming one.
      This is used only for \code{which="map"}.  See notes at
      \code{\link{plot.ctd}} for more information on built-in coastlines.}
  \item{main}{main title for plot, used just on the top panel, if there are several panels.}
  \item{grid}{if \code{TRUE}, a grid will be drawn for each panel.  (This
      argument is needed, because calling \code{\link{grid}} after doing a
      sequence of plots will not result in useful results for the individual
      panels.}
  \item{grid.col}{color of grid}
  \item{grid.lty}{line type of grid}
  \item{grid.lwd}{line width of grid}
  \item{debug}{a flag that turns on debugging.  Set to 1 to get a
    moderate amount of debugging information, or to 2 to get more.} 

  \item{\dots}{optional arguments passed to plotting functions.  For example,
      supplying \code{despike=TRUE} will cause time-series panels to be
      de-spiked with \code{\link{despike}}.  Another common action is to set
      the colour for missing values on image plots, with the argument
      \code{missingColor} (see \code{\link{imagep}}).  Note that it is an error
      to give \code{breaks} in \dots, if the formal argument \code{zlim} was
      also given, because they could contradict each other.}
}

\details{Creates a summary plot of data measured by an acoustic doppler
    profiler.  This may have one or more panels, with the content being
    controlled by the \code{which} argument.

  \itemize{ 

    \item \code{which=1:4} (or \code{which="u1"} to \code{"u4"}) yield a
      distance-time image plot of a velocity component.  If \code{x} is
      in \code{beam} coordinates (signalled by
      \code{x@metadata$oce.coordinate=="beam"}), this will be the beam
      velocity, labelled \code{b[1]} etc.  If \code{x} is in xyz
      coordinates (sometimes called frame coordinates, or ship
      coordinates), it will be the velocity component to the right of
      the frame or ship (labelled \code{u} etc).  Finally, if \code{x}
      is in \code{"enu"} coordinates, the image will show the the
      eastward component (labelled \code{east}).  If \code{x} is in
      \code{"other"} coordinates, it will be component corresponding to
      east, after rotation (labelled \code{u\'}).  Note that the
      coordinate is set by \code{\link{read.adp}}, or by
      \code{\link{beamToXyzAdp}}, \code{\link{xyzToEnuAdp}}, or
      \code{\link{enuToOtherAdp}}.
    
    \item \code{which=5:8} (or \code{which="a1"} to \code{"a4"}) yield
      distance-time images of backscatter intensity of the respective beams.
      (For data derived from Teledyn-RDI instruments, this is the item
      called ``echo intensity.'')

    \item \code{which=9:12} (or \code{which="q1"} to \code{"q4"}) yield
    distance-time images of signal quality for the respective beams.  (For RDI
    data derived from instruments, this is the item called ``correlation
    magnitude.'')

    \item \code{which=70:73} (or \code{which="g1"} to \code{"g4"}) yield
    distance-time images of percent-good for the respective beams.  (For data
    derived from Teledyne-RDI instruments, which are the only instruments that
    yield this item, it is called ``percent good.'')

    \item \code{which=13} (or \code{which="salinity"}) yields a
      time-series plot of salinity.

    \item \code{which=14} (or \code{which="temperature"}) yields a
      time-series plot of temperature.

    \item \code{which=15} (or \code{which="pressure"}) yields a
      time-series plot of pressure.

    \item \code{which=16} (or \code{which="heading"}) yields a
      time-series plot of instrument heading.

    \item \code{which=17} (or \code{which="pitch"}) yields a time-series
      plot of instrument pitch.

    \item \code{which=18} (or \code{which="roll"}) yields a time-series
      plot of instrument roll.

    \item \code{which=19} yields a time-series plot of distance-averaged
      velocity for beam 1, rightward velocity, eastward velocity, or
      rotated-eastward velocity, depending on the coordinate system.

    \item \code{which=20} yields a time-series of distance-averaged
      velocity for beam 2, foreward velocity, northward velocity, or
      rotated-northward velocity, depending on the coordinate system.

    \item \code{which=21} yields a time-series of distance-averaged
      velocity for beam 3, up-frame velocity, upward velocity, or
      rotated-upward velocity, depending on the coordinate system.

    \item \code{which=22} yields a time-series of distance-averaged
      velocity for beam 4, for \code{beam} coordinates, or velocity
      estimate, for other coordinates.  (This is ignored for 3-beam
      data.)

    \item \code{which=23} yields a progressive-vector diagram in the
      horizontal plane, plotted with \code{asp=1}.  Normally, the
      depth-averaged velocity components are used, but if the
      \code{control} list contains an item named \code{bin}, then the
      depth bin will be used (with an error resulting if the bin is out
      of range).

    \item \code{which=24} yields a time-averaged profile of the first
      component of velocity (see \code{which=19} for the meaning of the
      component, in various coordinate systems).

    \item \code{which=25} as for 24, but the second component.

    \item \code{which=26} as for 24, but the third component.

    \item \code{which=27} as for 24, but the fourth component (if that
      makes sense, for the given instrument).

    \item \code{which=28} or \code{"uv"} yields velocity plot in the
      horizontal plane, i.e. u[2] versus u[1].  If the number of data
      points is small, a scattergraph is used, but if it is large,
      \code{\link{smoothScatter}} is used.

    \item \code{which=29} or \code{"uv+ellipse"} as the \code{"uv"}
      case, but with an added indication of the tidal ellipse,
      calculated from the eigen vectors of the covariance matrix.

    \item \code{which=30} or \code{"uv+ellipse+arrow"} as the
      \code{"uv+ellipse"} case, but with an added arrow indicating the
      mean current.

    \item \code{which=40} or \code{"bottom range"} for average bottom range
      from all beams of the instrument.

    \item \code{which=41} to \code{44} (or \code{"bottom range1"} to
      \code{"bottom range1"}) for bottom range from beams 1 to 4.

    \item \code{which=50} or \code{"bottom velocity"} for average bottom velocity
      from all beams of the instrument.

    \item \code{which=51} to \code{54} (or \code{"bottom velocity1"} to
      \code{"bottom velocity4"}) for bottom velocity from beams 1 to 4.

    \item \code{which=55} (or \code{"heaving"}) for time-integrated,
    depth-averaged, vertical velocity, i.e. a time series of heaving.

    \item \code{which=100} (or \code{"soundSpeed"}) for a time series of sound
    speed.

    }
    In addition to the above, there are some groupings defined:
    \itemize{
        \item \code{which="velocity"} equivalent to \code{which=1:3} (velocity components)
        \item \code{which="amplitude"} equivalent to \code{which=5:7} (backscatter intensity components)
        \item \code{which="quality"} equivalent to \code{which=9:11} (quality components)
        \item \code{which="hydrography"} equivalent to \code{which=14:15} (temperature and pressure)
        \item \code{which="angles"} equivalent to \code{which=16:18} (heading, pitch and roll)
    }

    The color scheme for image plots (\code{which} in 1:12) is provided
    by the \code{col} argument, which is passed to \code{\link{image}}
    to do the actual plotting.  See \dQuote{Examples} for some
    comparisons.

    A common quick-look plot to assess mooring movement is to use
    \code{which=15:18} (pressure being included to signal the tide, and
    tidal currents may dislodge a mooring or cause it to settle).

    By default, \code{plot.adp} uses a \code{zlim} value for the
    \code{\link{image}} that is constructed to contain all the data, but
    to be symmetric about zero.  This is done on a per-panel basis, and
    the scale is plotted at the top-right corner, along with the name of
    the variable being plotted. You may also supply \code{zlim} as one
    of the \dots arguments, but be aware that a reasonable limit on
    horizontal velocity components is unlikely to be of much use for the
    vertical component.

    A good first step in the analysis of measurements made from a moored
    device (stored in \code{d}, say) is to do \code{plot(d,
    which=14:18)}.  This shows time series of water properties and
    sensor orientation, which is helpful in deciding which data to trim
    at the start and end of the deployment, because they were measured
    on the dock or on the ship as it travelled to the mooring site.
}


\examples{
library(oce)
data(adp)
plot(adp, which=1:3)
plot(adp, which=5, missingColor='gray',
adorn=expression({
    lines(x[["time"]], x[["pressure"]], lwd=3, col='blue')
    }))
plot(adp, which='temperature', tformat='\%H:\%M')
}

\seealso{The documentation for \code{\link{adp-class}} explains the structure
    of ADP objects, and also outlines the other functions dealing with them.}

\author{Dan Kelley}

\keyword{hplot}
