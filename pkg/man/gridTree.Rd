\name{gridTree}
\alias{gridTree}
\title{ Draw a grid scene graph }
\description{
  This function draws a node-and-edge graph representing
  the current \pkg{grid} scene.
}
\usage{
gridTree(grobNodeAttrs=list(shape="circle", fillcolor="black",
                            fontcolor="white"),
         vpNodeAttrs=list(shape="box", fillcolor="grey90",
                          fontcolor="black"),
         grob2grobAttrs=list(color="black", lty="solid", lwd=1),
         vp2vpAttrs=list(color="black", lty="solid", lwd=1),
         grob2vpAttrs=list(color="black", lty="dotted", lwd=1),
         vp2grobAttrs=list(color="grey", lty="solid", lwd=2),
         split=TRUE, grid=TRUE, 
         grobs=TRUE, viewports=TRUE, draw=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{grobNodeAttrs}{
Named list of attribute settings for nodes
representing grobs.
}
\item{vpNodeAttrs}{
Named list of attribute settings for nodes
representing viewports.
}
\item{grob2grobAttrs}{
Named list of attribute settings for edges between
two grobs.
}
\item{vp2vpAttrs}{
Named list of attribute settings for edges between
two viewports.
}
\item{grob2vpAttrs}{
Named list of attribute settings for edges from a grob to a viewport.
}
\item{vp2grobAttrs}{
  Named list of attribute settings for edges from a viewport to a grob.
}
\item{split}{
  Logical indicating whether to break long node names across multiple
  lines.
}
\item{grid}{
  Logical indicating whether to draw the graph using traditional
  graphics or \pkg{grid}.
}
\item{grobs}{
  Logical indicating whether to include nodes in the graph
  for grobs in the scene.
}
\item{viewports}{
  Logical indicating whether to include nodes in the graph
  for viewports in the scene.
}
\item{draw}{
  Logical indicating whether to draw the graph.
}
}
\details{
The attribute names must be valid graphviz attribute names.
}
\value{
  Invisibly returns a graph object.
}
\author{ Paul Murrell }
\keyword{ dplot }% at least one, from doc/KEYWORDS
