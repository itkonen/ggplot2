GeomErrorbar <- proto(GeomInterval, {
	objname <- "errorbar"
	desc <- "Error bars"
	icon <- function(.) {
		gTree(children=gList(
			segmentsGrob(c(0.3, 0.7), c(0.3, 0.5), c(0.3, 0.7), c(0.7, 0.9)),
			segmentsGrob(c(0.15, 0.55), c(0.3, 0.5), c(0.45, 0.85), c(0.3, 0.5)),
			segmentsGrob(c(0.15, 0.55), c(0.7, 0.9), c(0.45, 0.85), c(0.7, 0.9))
		))
	}
	
	default_stat <- function(.) StatIdentity
	default_aes <- function(.) aes(colour = "black", size=1, linetype=1, width=0.9)

	seealso <- list(
		"geom_pointrange" = "range indicated by straight line, with point in the middle",
		"geom_linerange" = "range indicated by straight line",
		"geom_crossbar" = "hollow bar with middle indicated by horizontal line",
		"stat_summary " = "examples of these guys in use",
		"geom_smooth" = "for continuous analog"
	)

	draw <- function(., data, scales, coordinates, ...) {
		data <- transform(data, 
			l = x - width / 2, r = x + width / 2
		)
		
		with(data, polylineGrob(
			as.vector(rbind(l, r, x, x, r, l)), as.vector(rbind(max, max, max, min, min, min)),
			default.units="native", id.lengths=rep(6, nrow(data)),
			gp=gpar(col=colour, lwd=size, lty=linetype) # , name="interval-error"
		))
	}
	
	examples <- function(.) {
		# Create a simple example dataset
		df <- data.frame(
			trt = factor(c(1, 1, 2, 2)), 
			resp = c(1, 5, 3, 4), 
			group = factor(c(1, 2, 1, 2)), 
			se = c(0.1, 0.3, 0.3, 0.2)
		)
		df2 <- df[c(1,3),]
		
		ggplot(df, aes(max = resp + se, min=resp - se, x=trt, fill=group)) + geom_bar(position="dodge")
		
		# Define the top and bottom of the errorbars
		limits <- aes(max = resp + se, min=resp - se, width=0.9)
		
		p <- ggplot(df, aes(fill=group, y=resp, x=trt))
		p + geom_bar(position="dodge")
		p + geom_bar(position="dodge") + geom_errorbar(limits, position="dodge", width=0.8)
		
		p <- ggplot(df2, aes(fill=group, y=resp, x=trt))
		p + geom_bar(position="dodge")
		p + geom_bar(position="dodge") + geom_errorbar(limits, position="dodge")

		p <- ggplot(df, aes(colour=group, y=resp, x=trt))
		p + geom_point() + geom_errorbar(limits, width=0.2)
		p + geom_pointrange(limits)
		p + geom_crossbar(limits, width=0.2)

		p + geom_line(aes(group=group)) + geom_errorbar(limits, width=0.2)		
	}
})
