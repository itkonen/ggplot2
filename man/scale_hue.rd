\name{scale_colour_hue}
\alias{scale_color_discrete}
\alias{scale_color_hue}
\alias{scale_colour_discrete}
\alias{scale_colour_hue}
\alias{scale_fill_discrete}
\alias{scale_fill_hue}
\title{Qualitative colour scale with evenly spaced hues.}
\usage{
  scale_colour_hue(..., h = c(0, 360) + 15, c = 100,
    l = 65, h.start = 0, direction = 1,
    na.value = "grey50")

  scale_fill_hue(..., h = c(0, 360) + 15, c = 100, l = 65,
    h.start = 0, direction = 1, na.value = "grey50")

  scale_colour_discrete(..., h = c(0, 360) + 15, c = 100,
    l = 65, h.start = 0, direction = 1,
    na.value = "grey50")

  scale_fill_discrete(..., h = c(0, 360) + 15, c = 100,
    l = 65, h.start = 0, direction = 1,
    na.value = "grey50")

  scale_color_discrete(..., h = c(0, 360) + 15, c = 100,
    l = 65, h.start = 0, direction = 1,
    na.value = "grey50")

  scale_color_hue(..., h = c(0, 360) + 15, c = 100, l = 65,
    h.start = 0, direction = 1, na.value = "grey50")
}
\arguments{
  \item{na.value}{Colour to use for missing values}

  \item{...}{Other arguments passed on to
  \code{\link{continuous_scale}} to control name, limits,
  breaks, labels and so forth.}

  \item{h}{range of hues to use, in [0, 360]}

  \item{c}{chroma (intensity of colour), maximum value
  varies depending on}

  \item{l}{luminance (lightness), in [0, 100]}

  \item{h.start}{hue to start at}

  \item{direction}{direction to travel around the colour
  wheel, 1 = clockwise, -1 = counter-clockwise}
}
\description{
  Qualitative colour scale with evenly spaced hues.
}
\examples{
\donttest{
dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
(d <- qplot(carat, price, data=dsamp, colour=clarity))

# Change scale label
d + scale_colour_hue()
d + scale_colour_hue("clarity")
d + scale_colour_hue(expression(clarity[beta]))

# Adjust luminosity and chroma
d + scale_colour_hue(l=40, c=30)
d + scale_colour_hue(l=70, c=30)
d + scale_colour_hue(l=70, c=150)
d + scale_colour_hue(l=80, c=150)

# Change range of hues used
d + scale_colour_hue(h=c(0, 90))
d + scale_colour_hue(h=c(90, 180))
d + scale_colour_hue(h=c(180, 270))
d + scale_colour_hue(h=c(270, 360))

# Vary opacity
# (only works with pdf, quartz and cairo devices)
d <- ggplot(dsamp, aes(carat, price, colour = clarity))
d + geom_point(alpha = 0.9)
d + geom_point(alpha = 0.5)
d + geom_point(alpha = 0.2)

# Colour of missing values is controlled with na.value:
miss <- factor(sample(c(NA, 1:5), nrow(mtcars), rep = TRUE))
qplot(mpg, wt, data = mtcars, colour = miss)
qplot(mpg, wt, data = mtcars, colour = miss) +
  scale_colour_hue(na.value = "black")
}
}
\seealso{
  Other colour scales: \code{\link{scale_color_brewer}},
  \code{\link{scale_color_continuous}},
  \code{\link{scale_color_gradient}},
  \code{\link{scale_color_gradient2}},
  \code{\link{scale_color_gradientn}},
  \code{\link{scale_color_grey}},
  \code{\link{scale_colour_brewer}},
  \code{\link{scale_colour_continuous}},
  \code{\link{scale_colour_gradient}},
  \code{\link{scale_colour_gradient2}},
  \code{\link{scale_colour_gradientn}},
  \code{\link{scale_colour_grey}},
  \code{\link{scale_fill_brewer}},
  \code{\link{scale_fill_continuous}},
  \code{\link{scale_fill_gradient}},
  \code{\link{scale_fill_gradient2}},
  \code{\link{scale_fill_gradientn}},
  \code{\link{scale_fill_grey}}
}

