\name{geom_text}
\alias{geom_text}
\alias{GeomText}
\title{geom\_text}
\description{Textual annotations}
\details{
This page describes geom\_text, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom\_text.  Aesthetics are mapped to variables in the data with the aes function: \code{geom\_text(aes(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{label}: text label (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{angle}: angle 
  \item \code{hjust}: horizontal justification, between 0 and 1 
  \item \code{vjust}: vertical justification, between 0 and 1 
  \item \code{alpha}: transparency 
}
}
\usage{geom_text(mapping = NULL, data = NULL, stat = "identity", position = "identity", 
    parse = FALSE, ...)}
\arguments{
 \item{mapping}{mapping between variables and aesthetics generated by aes}
 \item{data}{dataset used in this layer, if not specified uses plot dataset}
 \item{stat}{statistic used by this layer}
 \item{position}{position adjustment used by this layer}
 \item{parse}{If TRUE, the labels will be parsed into expressions and displayed as described in ?plotmath}
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot2/geom_text.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
p <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars)))

p + geom_text()
p <- p + geom_point()

# Set aesthetics to fixed value
p + geom_text()
p + geom_point() + geom_text(hjust=0, vjust=0)
p + geom_point() + geom_text(angle = 45)

# Add aesthetic mappings
p + geom_text(aes(colour=factor(cyl)))
p + geom_text(aes(colour=factor(cyl))) + scale_colour_discrete(l=40)

p + geom_text(aes(size=wt))
p + geom_text(aes(size=wt)) + scale_size(to=c(3,6))

# You can display expressions by setting parse = TRUE.  The 
# details of the display are described in ?plotmath, but note that
# geom_text uses strings, not expressions.
p + geom_text(aes(label = paste(wt, "^(", cyl, ")", sep = "")),
  parse = T)

# Use qplot instead
qplot(wt, mpg, data = mtcars, label = rownames(mtcars),
   geom=c("point", "text"))
qplot(wt, mpg, data = mtcars, label = rownames(mtcars), size = wt) +
  geom_text(colour = "red")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
