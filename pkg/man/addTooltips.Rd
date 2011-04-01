\name{addTooltips}
\alias{addTooltips}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Add tooltips to a grid scene graph.
%%  ~~function to do ... ~~
}
\description{
  Produces an SVG version of a scene graph with tooltips
  that show node labels when the mouse hovers over a graph node.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
addTooltips(filename = "Rplots.svg")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{
    The name of the SVG file that is produced.
%%     ~~Describe \code{filename} here~~
}
}
\details{
  This function assumes that the current scene contains a grid
  scene graph, as produced by \code{\link{gridTree}}.
  Its behaviour is otherwise undefined.
%%  ~~ If necessary, more details than the description above ~~
}
\author{
  Paul Murrell
%%  ~~who you are~~
}

\seealso{
  \code{\link{gridTree}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\keyword{ dplot }
