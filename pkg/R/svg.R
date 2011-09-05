
# General function to apply a function to each element of the
# grid display list - should end up in 'grid' itself
grid.DLapply <- function(fun, ...) {
    # Traverse DL and do something to each entry
    gridDL <- grid:::grid.Call.graphics("L_getDisplayList")
    gridDLindex <- grid:::grid.Call.graphics("L_getDLindex")
    for (i in 1:gridDLindex) {
        elt <- grid:::grid.Call.graphics("L_getDLelt", i)
        grid:::grid.Call.graphics("L_setDLindex", i)
        grid:::grid.Call.graphics("L_setDLelt", fun(elt, ...))
    }
    grid:::grid.Call.graphics("L_setDLindex", gridDLindex)
}

##########################
# gridTreeTips()

# Add tooltip attributes to a graph node on the DL
garnishNodes <- function(elt) {
    if (inherits(elt, "gTree")) {
        garnishGrob(elt,
                    onmouseover=paste("showTooltip(evt, '",
                      gsub("\n", "", elt$children[[2]]$label), "')",
                      sep=""),
                    onmouseout="hideTooltip()")
    } else {
        elt
    }
}

curveToDev <- function(curve, col, lwd, lty, dev) {
    primToDev(curveGrob(curve, col, lwd, lty), dev)
}

# primToDev method for "edgegrob" grobs
primToDev.edgegrob <- function(x, dev) {
    edge <- x$edge
    # FIXME:  assumes arrow at end of edge
    splines <- splines(edge)
    n <- length(splines)
    col <- color(edge)
    lapply(splines, curveToDev, col=col, lwd=edge@lwd, lty=edge@lty, dev=dev)
    lastCP <- pointList(splines[[n]])[[4]]
    arrow <- arrow(angle=10, type="closed", length=x$arrowlen)
    primToDev(segmentsGrob(lastCP[1], lastCP[2],
                           getX(ep(edge)), getY(ep(edge)),
                           default.units="native",
                           arrow=arrow,
                           gp=gpar(col=col, fill=col, lwd=edge@lwd,
                             lty=edge@lty)),
              dev)
}

# User interface
gridTreeTips <- function(filename="Rplots.svg", ..., grid=TRUE) {
    if (!grid)
        stop("Can only add tooltips if scene tree is drawn using grid")
    require(gridSVG)
    gridTree(..., grid=grid)
    grid.DLapply(garnishNodes)
    grid.script(filename=system.file("js", "graphtips.js",
                  package="gridDebug"))
    gridToSVG(filename)
}


##########################
# grobBrowser()

# Add tooltip attributes to a grob on the DL
garnishAllGrobs <- function(elt) {
    if (inherits(elt, "grob")) {
        garnishGrob(elt,
                    onmousemove=paste("showTooltip(evt, '",
                      gsub("\n", " ", elt$name), "')",
                      sep=""),
                    onmouseout="hideTooltip()")
    } else {
        elt
    }
}

grobBrowser <- function(filename="Rplots.svg") {
    grid.DLapply(garnishAllGrobs)
    grid.script(filename=system.file("js", "grobtips.js",
                  package="gridDebug"))
    gridToSVG(filename)
}

