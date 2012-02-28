\name{position_fill}
\alias{position_fill}
\title{Stack overlapping objects on top of one another, and standardise to have
equal height.}
\usage{
  position_fill(width = NULL, height = NULL)
}
\arguments{
  \item{width}{Manually specify width (does not affect all
  position adjustments)}

  \item{height}{Manually specify height (does not affect
  all position adjustments)}
}
\description{
  Stack overlapping objects on top of one another, and
  standardise to have equal height.
}
\examples{
\donttest{
# See ?geom_bar and ?geom_area for more examples
ggplot(mtcars, aes(x=factor(cyl), fill=factor(vs))) +
  geom_bar(position="fill")

cde <- geom_histogram(position="fill", binwidth = 500)

ggplot(diamonds, aes(x=price)) + cde
ggplot(diamonds, aes(x=price, fill=cut)) + cde
ggplot(diamonds, aes(x=price, fill=clarity)) + cde
ggplot(diamonds, aes(x=price, fill=color)) + cde
}
}
\seealso{
  Other position adjustments: \code{\link{position_dodge}},
  \code{\link{position_identity}},
  \code{\link{position_jitter}},
  \code{\link{position_stack}}
}

