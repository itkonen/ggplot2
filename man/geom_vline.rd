\name{geom_vline}
\alias{geom_vline}
\alias{GeomVline}
\title{geom\_vline}
\description{Line, vertical}
\details{
This geom allows you to annotate the plot with vertical lines (see geom\_hline and geom\_abline for other types of lines)


There are two ways to use it.  You can either specify the intercept of the line in the call to the geom, in which case the line will be in the same position in every panel.  Alternatively, you can supply a different intercept for each panel using a data.frame.  See the examples for the differences

This page describes geom\_vline, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom\_vline.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom\_vline(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_vline(mapping=NULL, data=NULL, stat="vline", position="identity", ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{stat}{statistic used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_hline}}: for horizontal lines
  \item \code{\link{geom_abline}}: for lines defined by a slope and intercept
  \item \code{\link{geom_segment}}: for a more general approach
  \item \url{http://had.co.nz/ggplot2/geom_vline.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
# Fixed lines
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p + geom_vline(xintercept = 5)
p + geom_vline(xintercept = 1:5)
p + geom_vline(xintercept = 1:5, colour="green")
p + geom_vline(xintercept = "mean", size=2, colour = alpha("red", 0.2))

last_plot() + coord_equal()
last_plot() + coord_flip()

# Lines from data
p <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
p + geom_vline(xintercept = "mean") + facet_grid(. ~ cyl)
p + geom_vline(aes(colour = factor(cyl)), xintercept = "mean")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
