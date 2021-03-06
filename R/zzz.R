.onLoad <- function(libname, pkgname)
{
    op <- options()
    libteos <- if ("unix" == .Platform$OS.type) "/usr/local/lib/libgswteos-10.so" else ""
    opOce <- list(oceTz = "UTC",
                  ##oceMgp = c(2.5,1,0),
                  oceMar=c(3, 3, 2, 2),
                  oceMgp=c(2.0, 0.7, 0),
                  oceDrawTimeRange=TRUE,
                  oceAbbreviateTimeRange=TRUE,
                  oceTimeFormat="%Y-%m-%d %H:%M:%S",
                  oceUnitBracket="[",
                  ##oceFlag1 = 1,
                  eos="unesco",
                  libteos=libteos,
                  webtide="/usr/local/WebTide",
                  oceDebug=0)
    toset <- !(names(opOce) %in% names(op))
    if (any(toset)) {
        options(opOce[toset])
        .C("set_libteos", libteos)
    }
}
