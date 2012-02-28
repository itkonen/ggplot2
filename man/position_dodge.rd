\name{position_dodge}
\alias{position_dodge}
\title{Adjust position by dodging overlaps to the side.}
\usage{
  position_dodge(width = NULL, height = NULL)
}
\arguments{
  \item{width}{Manually specify width (does not affect all
  position adjustments)}

  \item{height}{Manually specify height (does not affect
  all position adjustments)}
}
\description{
  Adjust position by dodging overlaps to the side.
}
\examples{
\donttest{
ggplot(mtcars, aes(x=factor(cyl), fill=factor(vs))) +
  geom_bar(position="dodge")
ggplot(diamonds, aes(x=price, fill=cut)) + geom_bar(position="dodge")
# see ?geom_boxplot and ?geom_bar for more examples

# Dodging things with different widths is tricky
df <- data.frame(x=c("a","a","b","b"), y=1:4)
(p <- qplot(x, y, data=df, position="dodge", geom="bar", stat="identity"))

p + geom_linerange(aes(ymin = y-1, ymax = y+1), position="dodge")
# You need to explicitly specify the width for dodging
p + geom_linerange(aes(ymin = y-1, ymax = y+1),
  position = position_dodge(width = 0.9))

# Similarly with error bars:
p + geom_errorbar(aes(ymin = y-1, ymax = y+1), width = 0.2,
  position="dodge")
p + geom_errorbar(aes(ymin = y-1, ymax = y+1, width = 0.2),
  position = position_dodge(width = 0.90))
}
}
\seealso{
  Other position adjustments: \code{\link{position_fill}},
  \code{\link{position_identity}},
  \code{\link{position_jitter}},
  \code{\link{position_stack}}
}

