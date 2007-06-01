# Quick plot.
# Quick plot is a convenient wrapper function for creating simple ggplot plot objects.
# You can use it like you'd use the \code{\link{plot}} function.
# 
# FIXME: describe how to get more information
# FIXME: add more examples
# 
# \code{qplot} provides a quick way to create simple plots.
# 
# @arguments x values
# @arguments y values
# @arguments data frame to use (optional)
# @arguments facetting formula to use
# @arguments grob type(s) to draw (can be a vector of multiple names)
# @arguments limits for x axis (aesthetics to range of data)
# @arguments limits for y axis (aesthetics to range of data)
# @arguments which variables to log transform ("x", "y", or "xy")
# @arguments character vector or expression for plot title
# @arguments character vector or expression for x axis label
# @arguments character vector or expression for y axis label
# @arguments if specified, build on top of this ggplot, rather than creating a new one
# @arguments other arguments passed on to the geom functions
# @keyword hplot 
#X # Use data from data.frame
#X qplot(mpg, wt, data=mtcars)
#X qplot(mpg, wt, data=mtcars, colour=cyl)
#X qplot(mpg, wt, data=mtcars, size=cyl)
#X qplot(mpg, wt, data=mtcars, facets=vs ~ am)
#X
#X # Use data from workspace environment
#X attach(mtcars)
#X qplot(mpg, wt)
#X qplot(mpg, wt, colour=cyl)
#X qplot(mpg, wt, size=cyl)
#X qplot(mpg, wt, facets=vs ~ am)
#X
#X # Use different geoms
#X qplot(mpg, wt, geom="path")
#X qplot(factor(cyl), wt, geom=c("boxplot", "jitter"))
#X 
#X # Add to an existing plot
#X p <- qplot(mpg, wt, geom="path")
#X qplot(mpg, wt, geom="point", add=p)
qplot <- function(x, y = NULL, z=NULL, ..., data, facets = . ~ ., margins=FALSE, geom = "point", stat=list(NULL), position=list(NULL), xlim = c(NA, NA), ylim = c(NA, NA), log = "", main = NULL, xlab = deparse(substitute(x)), ylab = deparse(substitute(y)), add=NULL) {

	argnames <- names(as.list(match.call(expand.dots=FALSE)[-1]))
	arguments <- as.list(match.call()[-1])
	aesthetics <- compact(arguments[.all_aesthetics])
	
	# Create data if not explicitly specified
	if (missing(data)) {
		if (!is.null(add)) {
			data <- add$data
		} else {
			data <- as.data.frame(tryapply(aesthetics, eval, parent.frame(n=2)))
		}

		facetvars <- all.vars(facets)
		facetvars <- facetvars[facetvars != "."]
		facetsdf <- as.data.frame(sapply(facetvars, get))
		if (nrow(facetsdf)) data <- cbind(data, facetsdf)
	}

	# Create new plot, or add to existing?
	if (is.null(add)) {
		p <- ggplot(data, aesthetics) + facet_grid(facets=deparse(facets), margins=margins)
	} else {
		p <- add
	}
	
	if (!is.null(main)) p$title <- main
	if (!is.null(xlab)) p$xlabel <- xlab
	if (!is.null(ylab)) p$ylabel <- ylab

	# Add geoms/statistics
	mapply(function(g, s, ps) {
		if(is.character(g)) g <- Geom$find(g)
		if(is.character(s)) s <- Stat$find(s)
		if(is.character(p)) ps <- Position$find(ps)

		params <- arguments[setdiff(names(arguments), c(.all_aesthetics, argnames))]
		
		if (is.null(add)) {
			p <<- p + layer(geom=g, stat=s, geom_params=params, stat_params=params, position=ps)
		} else {
			p <<- p + layer(geom=g, stat=s, data=data, aesthetics=aesthetics, geom_params=params, stat_params=params, position=ps)
		}
	}, geom, stat, position)
	
	logv <- function(var) var %in% strsplit(log, "")[[1]]

	if (logv("x")) p <- p + scale_x_log10()
	if (logv("y")) p <- p + scale_y_log10()
	
	if (!missing(xlab)) assign("name", xlab, envir=p$scales$get_scales("x"))
	if (!missing(ylab)) assign("name", ylab, envir=p$scales$get_scales("y"))
	
	if (!missing(xlim)) assign("limits", xlim, envir=p$scales$get_scales("x"))
	if (!missing(ylim)) assign("limits", ylim, envir=p$scales$get_scales("y"))
	
	p
}