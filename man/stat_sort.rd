\name{stat_sort}
\alias{stat_sort}
\alias{StatSort}
\title{stat\_sort}
\description{Sort in order of ascending x}
\details{
This page describes stat\_sort, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\usage{stat_sort(mapping=NULL, data=NULL, geom="path", position="identity", variable="x", ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{geom}{geometric used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{variable}{variable to sort by}
 \item{...}{ignored}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/stat_sort.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # See geom_line for the main use of this
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
