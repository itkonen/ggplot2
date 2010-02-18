\name{geom_quantile}
\alias{geom_quantile}
\alias{GeomQuantile}
\title{geom\_quantile}
\description{Add quantile lines from a quantile regression}
\details{
This page describes geom\_quantile, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom\_quantile.  Aesthetics are mapped to variables in the data with the aes function: \code{geom\_quantile(aes(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{weight}: observation weight used in statistical transformation 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{alpha}: transparency 
}
}
\section{Advice}{
This can be used as a continuous analogue of a geom\_boxplot.

}
\usage{geom_quantile(mapping = NULL, data = NULL, stat = "quantile", 
    position = "identity", lineend = "butt", linejoin = "round", 
    linemitre = 1, na.rm = FALSE, ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{stat}{statistic used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{lineend}{Line end style (round, butt, square)}
 \item{linejoin}{Line join style (round, mitre, bevel)}
 \item{linemitre}{Line mitre limit (number greater than 1)}
 \item{na.rm}{NULL}
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \code{\link{geom_line}}: Functional (ordered) lines
  \item \code{\link{geom_polygon}}: Filled paths (polygons)
  \item \code{\link{geom_segment}}: Line segments
  \item \url{http://had.co.nz/ggplot2/geom_quantile.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
# See stat_quantile for examples
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
