\name{geom_crossbar}
\alias{geom_crossbar}
\title{Hollow bar with middle indicated by horizontal line.}
\usage{
  geom_crossbar(mapping = NULL, data = NULL,
    stat = "identity", position = "identity", fatten = 2,
    ...)
}
\arguments{
  \item{fatten}{a multiplicate factor to fatten middle bar
  by}

  \item{mapping}{The aesthetic mapping, usually constructed
  with \code{\link{aes}} or \code{\link{aes_string}}. Only
  needs to be set at the layer level if you are overriding
  the plot defaults.}

  \item{data}{A layer specific dataset - only needed if you
  want to override the plot defaults.}

  \item{stat}{The statistical transformation to use on the
  data for this layer.}

  \item{position}{The position adjustment to use for
  overlappling points on this layer}

  \item{...}{other arguments passed on to
  \code{\link{layer}}. This can include aesthetics whose
  values you want to set, not map. See \code{\link{layer}}
  for more details.}
}
\description{
  Hollow bar with middle indicated by horizontal line.
}
\section{Aesthetics}{
  \Sexpr[results=rd,stage=build]{ggplot2:::rd_aesthetics("geom",
  "crossbar")}
}
\examples{
# See geom_linerange for examples
}
\seealso{
  \code{\link{geom_errorbar}} for error bars,
  \code{\link{geom_pointrange}} and
  \code{\link{geom_linerange}} for other ways of showing
  mean + error, \code{\link{stat_summary}} to compute
  errors from the data, \code{\link{geom_smooth}} for the
  continuous analog.
}

