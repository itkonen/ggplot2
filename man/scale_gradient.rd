\name{scale_colour_gradient}
\alias{scale_color_continuous}
\alias{scale_color_gradient}
\alias{scale_colour_continuous}
\alias{scale_colour_gradient}
\alias{scale_fill_continuous}
\alias{scale_fill_gradient}
\title{Smooth gradient between two colours}
\usage{
  scale_colour_gradient(..., low = "#132B43",
    high = "#56B1F7", space = "Lab", na.value = "grey50",
    guide = "colourbar")

  scale_fill_gradient(..., low = "#132B43",
    high = "#56B1F7", space = "Lab", na.value = "grey50",
    guide = "colourbar")

  scale_colour_continuous(..., low = "#132B43",
    high = "#56B1F7", space = "Lab", na.value = "grey50",
    guide = "colourbar")

  scale_fill_continuous(..., low = "#132B43",
    high = "#56B1F7", space = "Lab", na.value = "grey50",
    guide = "colourbar")

  scale_color_continuous(..., low = "#132B43",
    high = "#56B1F7", space = "Lab", na.value = "grey50",
    guide = "colourbar")

  scale_color_gradient(..., low = "#132B43",
    high = "#56B1F7", space = "Lab", na.value = "grey50",
    guide = "colourbar")
}
\arguments{
  \item{guide}{Type of legend. Use \code{"colourbar"} for
  continuous colour bar, or \code{"legend"} for discrete
  colour legend.}

  \item{...}{Other arguments passed on to
  \code{\link{discrete_scale}} to control name, limits,
  breaks, labels and so forth.}

  \item{na.value}{Colour to use for missing values}

  \item{low}{colour for low end of gradient.}

  \item{high}{colour for high end of gradient.}

  \item{space}{colour space in which to calculate gradient.
  "Lab" usually best unless gradient goes through white.}
}
\description{
  Default colours are generated with \pkg{munsell} and
  \code{mnsl(c("2.5PB 2/4", "2.5PB 7/10")}. Generally, for
  continuous colour scales you want to keep hue constant,
  but vary chroma and luminance. The \pkg{munsell} package
  makes this easy to do using the Munsell colour system.
}
\examples{
\donttest{
# It's hard to see, but look for the bright yellow dot
# in the bottom right hand corner
dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
(d <- qplot(x, y, data=dsub, colour=z))
# That one point throws our entire scale off.  We could
# remove it, or manually tweak the limits of the scale

# Tweak scale limits.  Any points outside these limits will not be
# plotted, and will not affect the calculation of statistics, etc
d + scale_colour_gradient(limits=c(3, 10))
d + scale_colour_gradient(limits=c(3, 4))
# Setting the limits manually is also useful when producing
# multiple plots that need to be comparable

# Alternatively we could try transforming the scale:
d + scale_colour_gradient(trans = "log")
d + scale_colour_gradient(trans = "sqrt")

# Other more trivial manipulations, including changing the name
# of the scale and the colours.

d + scale_colour_gradient("Depth")
d + scale_colour_gradient(expression(Depth[mm]))

d + scale_colour_gradient(limits=c(3, 4), low="red")
d + scale_colour_gradient(limits=c(3, 4), low="red", high="white")
# Much slower
d + scale_colour_gradient(limits=c(3, 4), low="red", high="white", space="Lab")
d + scale_colour_gradient(limits=c(3, 4), space="Lab")

# scale_fill_continuous works similarly, but for fill colours
(h <- qplot(x - y, data=dsub, geom="histogram", binwidth=0.01, fill=..count..))
h + scale_fill_continuous(low="black", high="pink", limits=c(0,3100))

# Colour of missing values is controlled with na.value:
miss <- sample(c(NA, 1:5), nrow(mtcars), rep = TRUE)
qplot(mpg, wt, data = mtcars, colour = miss)
qplot(mpg, wt, data = mtcars, colour = miss) +
  scale_colour_gradient(na.value = "black")
}
}
\seealso{
  \code{\link[scales]{seq_gradient_pal}} for details on
  underlying palette

  Other colour scales: \code{\link{scale_color_brewer}},
  \code{\link{scale_color_discrete}},
  \code{\link{scale_color_gradient2}},
  \code{\link{scale_color_gradientn}},
  \code{\link{scale_color_grey}},
  \code{\link{scale_color_hue}},
  \code{\link{scale_colour_brewer}},
  \code{\link{scale_colour_discrete}},
  \code{\link{scale_colour_gradient2}},
  \code{\link{scale_colour_gradientn}},
  \code{\link{scale_colour_grey}},
  \code{\link{scale_colour_hue}},
  \code{\link{scale_fill_brewer}},
  \code{\link{scale_fill_discrete}},
  \code{\link{scale_fill_gradient2}},
  \code{\link{scale_fill_gradientn}},
  \code{\link{scale_fill_grey}},
  \code{\link{scale_fill_hue}}
}

