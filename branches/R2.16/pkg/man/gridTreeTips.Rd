\name{gridTreeTips}
\alias{gridTreeTips}
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
gridTreeTips(filename = "Rplots.svg", ..., grid = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{
    The name of the SVG file that is produced.
  }
  \item{\dots}{
    Arguments that will be passed to \code{gridTree()}.
  }
  \item{grid}{
    Logical indicating whether to draw the scene graph using
    grid;  setting this to \code{FALSE} will produce an error.
  }
%%     ~~Describe \code{filename} here~~
}
\details{
  This function first produces a grid scene graph from the current page,
  then produces an SVG version (with tooltips).
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
