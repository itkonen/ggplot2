\name{scale_x_date}
\alias{scale_x_date}
\alias{scale_y_date}
\title{Position scale, date}
\usage{
  scale_x_date(..., expand = waiver(),
    breaks = pretty_breaks(), minor_breaks = waiver())

  scale_y_date(..., expand = waiver(),
    breaks = pretty_breaks(), minor_breaks = waiver())
}
\arguments{
  \item{breaks}{A vector of breaks, a function that given
  the scale limits returns a vector of breaks, or a
  character vector, specifying the width between breaks.
  For more information about the first two, see
  \code{\link{continuous_scale}}, for more information
  about the last, see \code{\link[scales]{date_breaks}}`.}

  \item{minor_breaks}{Either \code{NULL} for no minor
  breaks, \code{waiver()} for the default breaks (one minor
  break between each major break), a numeric vector of
  positions, or a function that given the limits returns a
  vector of minor breaks.}

  \item{...}{common continuous scale parameters:
  \code{name}, \code{breaks}, \code{labels},
  \code{na.value}, \code{limits} and \code{trans}.  See
  \code{\link{continuous_scale}} for more details}

  \item{expand}{a numeric vector of length two giving
  multiplicative and additive expansion constants. These
  constants ensure that the data is placed some distance
  away from the axes.}
}
\description{
  Position scale, date
}
\examples{
# We'll start by creating some nonsense data with dates
df <- data.frame(
  date = seq(Sys.Date(), len=100, by="1 day")[sample(100, 50)],
  price = runif(50)
)
df <- df[order(df$date), ]
dt <- qplot(date, price, data=df, geom="line") + theme(aspect.ratio = 1/4)

# We can control the format of the labels, and the frequency of
# the major and minor tickmarks.  See ?format.Date and ?seq.Date
# for more details.
library(scales) # to access breaks/formatting functions
dt + scale_x_date()
dt + scale_x_date(labels = date_format("\%m/\%d"))
dt + scale_x_date(labels = date_format("\%W"))
dt + scale_x_date(labels = date_format("\%W"), breaks = date_breaks("week"))

dt + scale_x_date(breaks = date_breaks("months"),
  labels = date_format("\%b"))
dt + scale_x_date(breaks = date_breaks("4 weeks"),
  labels = date_format("\%d-\%b"))

# We can use character string for breaks.
# See \\code{\\link{by}} argument in \\code{\\link{seq.Date}}.
dt + scale_x_date(breaks = "2 weeks")
dt + scale_x_date(breaks = "1 month", minor_breaks = "1 week")

# The date scale will attempt to pick sensible defaults for
# major and minor tick marks
qplot(date, price, data=df[1:10,], geom="line")
qplot(date, price, data=df[1:4,], geom="line")

df <- data.frame(
  date = seq(Sys.Date(), len=1000, by="1 day"),
  price = runif(500)
)
qplot(date, price, data=df, geom="line")

# A real example using economic time series data
qplot(date, psavert, data=economics)
qplot(date, psavert, data=economics, geom="path")

end <- max(economics$date)
last_plot() + scale_x_date(limits = c(as.Date("2000-1-1"), end))
last_plot() + scale_x_date(limits = c(as.Date("2005-1-1"), end))
last_plot() + scale_x_date(limits = c(as.Date("2006-1-1"), end))

# If we want to display multiple series, one for each variable
# it's easiest to first change the data from a "wide" to a "long"
# format:
library(reshape2) # for melt
em <- melt(economics, id = "date")

# Then we can group and facet by the new "variable" variable
qplot(date, value, data = em, geom = "line", group = variable)
qplot(date, value, data = em, geom = "line", group = variable) +
  facet_grid(variable ~ ., scale = "free_y")
}
\seealso{
  Other position scales: \code{\link{scale_x_continuous}},
  \code{\link{scale_x_datetime}},
  \code{\link{scale_x_discrete}},
  \code{\link{scale_x_log10}},
  \code{\link{scale_x_reverse}},
  \code{\link{scale_x_sqrt}},
  \code{\link{scale_y_continuous}},
  \code{\link{scale_y_datetime}},
  \code{\link{scale_y_discrete}},
  \code{\link{scale_y_log10}},
  \code{\link{scale_y_reverse}}, \code{\link{scale_y_sqrt}}
}

