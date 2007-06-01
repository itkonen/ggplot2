GeomLinerange <- proto(GeomInterval, {
	objname <- "linerange"
	desc <- "An interval represented by a vertical line"

	seealso <- list(
		"geom_errorbar" = "error bars",
		"geom_pointrange" = "range indicated by straight line, with point in the middle",
		"geom_crossbar" = "hollow bar with middle indicated by horizontal line",
		"stat_summary " = "examples of these guys in use",
		"geom_smooth" = "for continuous analog"
	)
	
	default_stat <- function(.) StatIdentity
	default_aes <- function(.) aes(colour = "black", size=1, linetype=1)

	draw <- function(., data, scales, coordinates, ...) {
		GeomSegment$draw(transform(data, xend=x, y=min, yend=max), scales, coordinates, ...)
	}

	icon <- function(.) segmentsGrob(c(0.3, 0.7), c(0.1, 0.2), c(0.3, 0.7), c(0.7, 0.95))
	
	examples <- function(.) {
		# Generate data: means and standard errors of means for prices
		# for each type of cut
		dmod <- lm(price ~ cut, data=diamonds)
		cuts <- data.frame(cut=unique(diamonds$cut), predict(dmod, data.frame(cut = unique(diamonds$cut)), se=T)[c("fit","se.fit")])
		
		qplot(cut, fit, data=cuts)
		# With a bar chart, we are comparing lengths, so the y-axis is 
		# automatically extended to include 0
		qplot(cut, fit, data=cuts, geom="bar")
		
		# Display estimates and standard errors in various ways
		qplot(cut, min=fit - se.fit, max=fit + se.fit, y=fit, data=cuts, geom="linerange")
		qplot(cut, min=fit - se.fit, max=fit + se.fit, y=fit, data=cuts, geom="pointrange")
		qplot(cut, min=fit - se.fit, max=fit + se.fit, y=fit, data=cuts, geom="errorbar", width=0.5)
		qplot(cut, min=fit - se.fit, max=fit + se.fit, y=fit, data=cuts, geom="crossbar", width=0.5)

	}	
})