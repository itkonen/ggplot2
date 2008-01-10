\name{scale_manual}
\alias{scale_manual}
\alias{scale_colour_manual}
\alias{scale_fill_manual}
\alias{scale_size_manual}
\alias{scale_shape_manual}
\alias{scale_linetype_manual}
\alias{ScaleManual}
\title{scale\_manual}
\description{Simple way of manually controlling scale}
\details{
This page describes scale\_manual, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\usage{scale_colour_manual(name=NULL, values=NULL, ...)
scale_fill_manual(name=NULL, values=NULL, ...)
scale_size_manual(name=NULL, values=NULL, ...)
scale_shape_manual(name=NULL, values=NULL, ...)
scale_linetype_manual(name=NULL, values=NULL, ...)}
\arguments{
 \item{name}{name of scale to appear in legend or on axis}
 \item{values}{NULL}
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/scale_manual.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    p <- qplot(mpg, wt, data=mtcars, colour=factor(cyl))

    p + scale_colour_manual(values = c("red","blue", "green"))
    p + scale_colour_manual(values = c("8" = "red","4" = "blue","6" = "green"))
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
