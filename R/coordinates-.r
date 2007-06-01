# Coordinate system looks at scales and creates transformation
# Applies transformation after munching transform (if necessary)
# Draws axes
# Also takes care of facetting?
# 
# x or y
# continuous or categorical
# ideally should bind a few together (and will eventually become coordinate systems)


Coord <- proto(TopLevel, expr={
	class <- function(.) "coord"
	train <- function(., scales) .$.scales <- scales
	
	muncher <- function(.) FALSE
	munch <- function(., data, npieces=50) {
		n <- nrow(data)

		x <- approx(data$x, n = npieces * (n - 1) + 1)$y
		y <- approx(data$y, n = npieces * (n - 1) + 1)$y
		
		cbind(
			.$transform(data.frame(x=x, y=y)),
			data[c(rep(1:(n-1), each=npieces), n), setdiff(names(data), c("x", "y"))]
		)
	}

	pprint <- function(., newline=TRUE) {
		args <- formals(get("new", .))
		args <- args[!names(args) %in% c(".", "...")]
	
		cat("coord_", .$objname, ": ", clist(args), sep="")
		
		if (newline) cat("\n") 
	}
})