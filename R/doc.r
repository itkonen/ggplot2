# Description of aesthetics
.desc_aes <- list(
	"x"= "x position",
	"y"= "y position", 
	"z"= "z position", 
	"group"= "how observations are divided into different groups", 
	"colour"= "border colour", 
	"fill"= "internal colour", 
	"height"= "height of geom", 
	"hjust"= "horizontal justification, between 0 and 1", 
	"intercept"= "x/y intercept", 
	"label"= "text label", 
	"linetype"= "line type", 
	"max"= "maximum of interval", 
	"min"= "minimum of interval", 
	"angle"= "angle", 
	"shape"= "shape of point", 
	"size"= "size", 
	"slope"= "slope of line", 
	"quantile" = "quantile of distribution",
	"vjust"= "vertical justification, between 0 and 1", 
	"weight"= "observation weight used in statistical transformation", 
	"width" = "width of geom"
)

# Generate html for index page for documentation website.
# 
# @keyword internal
html_index <- function() {
	ps(
		TopLevel$html_header("ggplot"),
		html_auto_link(ps(readLines("templates/index.html"), collapse="\n"), skip="ggplot"),
		"<h2>Geoms</h2>\n",
		"<p>Geoms, short for geometric objects, describe the type of plot you will produce.  <a href='geom_.html'>Read more</a></p>\n",
		html_linked_list(Geom$find_all()),
		"<h2>Statistics</h2>\n",
		"<p>It's often useful to transform your data before plotting, and that's what statistical transformations do.  <a href='stat_.html'>Read more</a></p>\n",
		html_linked_list(Stat$find_all()),
		"<h2>Scales</h2>\n",
		"<p>Scales control the mapping between data and aesthetics.  <a href='scale_.html'>Read more</a></p>\n",
		html_linked_list(Scale$find_all()),
		"<h2>Coordinate systems</h2>\n",
		"<p>Coordinate systems adjust the mapping from coordinates to the 2d plane of the computer screen.  <a href='coord_.html'>Read more</a></p>\n",
		html_linked_list(Coord$find_all()),
		"<h2>Facetting</h2>\n",
		"<p>Facets display subsets of the dataset in different panels.  <a href='facet_.html'>Read more</a></p>\n",
		html_linked_list(Facet$find_all()),
		"<h2>Position adjustments</h2>\n",
		"<p>Position adjustments can be used to fine tune positioning of objects to achieve effects like dodging, jittering and stacking.  <a href='position_.html'>Read more</a></p>\n",
		html_linked_list(Position$find_all()),
		TopLevel$html_footer()
	)
}

# Create physical file for html documentation index
# 
# @arguments path to create file in
# @keyword internal
html_index_create <- function(path="web/") {
	target <- ps(path, "index.html")
	
	cat(html_index(), file=target)
}	

# Create all html documentation pages
# 
# @arguments path to create files in
# @keyword internal
all_html_pages_create <- function(path="web/") {
	system("rm web/graphics/*")
	html_index_create(path)
	Geom$all_html_pages_create()
	Stat$all_html_pages_create()
	Scale$all_html_pages_create()
	Coord$all_html_pages_create()
	Position$all_html_pages_create()
	Facet$all_html_pages_create()
	system("pdf2png web/graphics/*.pdf")
  system("rm web/graphics/*.pdf")
	system("optipng web/graphics/*.png  > /dev/null")
}

# Generate html for templated files
#
# @arguments name of template
# @keyword internal
html_template <- function(name) {
	path <- ps("templates/", name, ".html")
	ps(
		TopLevel$html_header(name),
		html_auto_link(ps(readLines(path), collapse="\n"), skip=gsub("_","", name)),
		TopLevel$html_footer()
	)
}

# Create html file for templated files
#
# @arguments name of template
# @arguments path to create file in
# @keyword internal
html_template_create <- function(name, path="web/") {
	cat(html_template(name), file=ps(path, name, ".html"))
}

# Create all templates
#
# @arguments path to create file in
# @keyword internal
html_template_create_all <- function(path="web/") {
	templates <- setdiff(gsub("\\.html", "", dir("templates/")), c("header", "footer"))
	invisible(lapply(templates, html_template_create, path=path))
}

# Convenience function for generating lists of objects with their icons.
#
# @arguments list of objects
# @keyword internal
html_linked_list <- function(objects) {
	objects <- objects[sapply(objects, function(x) get("doc", x))]
	
	links <- sapply(objects, function(x) {
		ps(
			x$html_img_link(align="left"), 
			x$html_link_self(), "<br />\n",
			"<span class='desc'>", get("desc", x), "</span>"
		)
	})
	
	left <- rep(c(TRUE, FALSE), length=length(links))
	
	ps(
		"<ul class='icons left'>\n",
		ps("<li>", links[left] , "</li>\n"),
		"</ul>\n",
		"<ul class='icons right'>\n",
		ps("<li>", links[!left] , "</li>\n"),
		"</ul><br clear='all' />\n"
	)
}

# Create index of objects for automatically linking names in html
# 
# @keyword internal
html_autolink_index <- function() {
	all <- c(Geom$find_all(TRUE), Stat$find_all(TRUE), Coord$find_all(TRUE), Position$find_all(TRUE), Scale$find_all(TRUE), Facet$find_all(TRUE))

	links <- lapply(all, function(.) .$html_link_self())
	names(links) <- lapply(all, function(.) .$my_name())
	links <<- c(links, 
		aes = "<a href='aes.html'>aes</a>", 
		ggplot = "<a href='ggplot.html'>ggplot</a>", 
		layer = "<a href='layer.html'>layer</a>", 
		qplot = "<a href='qplot.html'>qplot</a>"
		# scale = "<a href='scale_.html'>scale</a>",
		# geom = "<a href='geom_.html'>geom</a>",
		# stat = "<a href='stat_.html'>stat</a>",
		# coord = "<a href='coord_.html'>coord</a>",
		# position = "<a href='position_.html'>position</a>",
		# facet = "<a href='facet_.html'>facet</a>"
	)
}

# Add html links to functions
# 
# @keyword internal
html_auto_link <- function(input, skip="") {
	if (!exists("links")) html_autolink_index()
	
	for (n in names(links)[names(links) != skip	]) {
		input <- gsub(ps("\\b", n, "\\b"), links[n], input)
	}
	input
	
}

