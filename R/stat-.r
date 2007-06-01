# Statistics must be location scale
Stat <- proto(TopLevel, expr={
	objname <- "" 
	desc <- ""
	
	default_geom <- function(.) Geom
	default_aes <- function(.) aes()
	
	aesthetics <- list()
	calculate <- function(., data, scales, ...) {}

	calculate_groups <- function(., data, scales, ...) {
		if (nrow(data) == 0) return(NULL)
		
		force(data)
		force(scales)
		
		groups <- split(data, factor(data$group))
		stats <- lapply(groups, function(group) .$calculate(group, scales, ...))
		
		stats <- mapply(function(new, old) {
			unique <- uniquecols(old)
			missing <- !(names(unique) %in% names(new))
			cbind(
				new, 
				unique[rep(1, nrow(new)), missing,drop=FALSE]
			)
		}, stats, groups, SIMPLIFY=FALSE)

		do.call("rbind.fill", stats)
	}


	pprint <- function(., newline=TRUE) {
		cat("stat_", .$objname ,": ", clist(.$parameters()), sep="")
		if (newline) cat("\n")
	}
	
	parameters <- function(.) {
		params <- formals(get("calculate", .))
		params[setdiff(names(params), c(".","data","scales", "..."))]
	}
	
	class <- function(.) "stat"
	
	new <- function(., aesthetics=aes(), data=NULL, geom=NULL, position=NULL, ...){
		es <- structure(as.list(match.call()[-1]), class="uneval")
		layer(aesthetics=aesthetics, data=data, geom=geom, stat=., position=position, params=list(...))
	}

})