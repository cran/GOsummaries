\name{plot.gosummaries}
\alias{plot.gosummaries}
\title{Plot the GOsummaries figure}
\usage{
\method{plot}{gosummaries}(x, components = 1:min(10, length(x)),
  classes = NA, panel_plot = NULL, panel_customize = NULL,
  panel_par = list(), panel_height = 5, panel_width = 30, fontsize = 10,
  term_length = 35, wordcloud_colors = c("grey70", "grey10"),
  wordcloud_legend_title = NULL, filename = NA, ...)
}
\arguments{
  \item{x}{a gosummaries object}

  \item{components}{index for the components to draw.}

  \item{classes}{name of the variable from annotation
  data.frame that defines the colors in the plot}

  \item{panel_plot}{plotting function for panel}

  \item{panel_customize}{customization function for the
  panel plot, menat for making small changes like changing
  colour scheme}

  \item{panel_par}{list of arguments passed on to
  \code{panel_plot} function}

  \item{panel_height}{panel height as number of lines, with
  given \code{fontsize}. If set to 0 no panel is drawn.}

  \item{panel_width}{panel width in lines of text}

  \item{fontsize}{font size used throughout the figure in
  points}

  \item{term_length}{maximum length of the dispalyed GO
  categories in characters, longer names are cropped to
  this size}

  \item{wordcloud_colors}{two element vector of colors to
  define color scheme for displaying the enrichment
  p-values across the wordclouds. First element defines the
  color for category with worst p-value and the second for
  the word with the best. Set the same value for both if
  you want to remove the color scale and the legend.}

  \item{wordcloud_legend_title}{title of wordcloud legend}

  \item{filename}{file path where to save the picture.
  Filetype is decided by the extension in the path.
  Currently following formats are supported: png, pdf,
  tiff, bmp, jpeg. Even if the plot does not fit into the
  plotting window, the file size is calculated so that the
  plot would fit there.}

  \item{\dots}{not used}
}
\value{
The \code{\link{gtable}} object containing the figure
}
\description{
The function to draw a GOsummaries figure based on a
\code{gosummaries} object.  The GOsummaries figure consists
of several components each defined by a gene list ora a
pair of them. The GO annotations of them are shown as
wordclouds. Optionally one can draw related (expression)
data on panels atop of the wordclouds.
}
\details{
In most cases the function can decide which type of plot to
draw into the panel part. If there is no data explicitly
put into the Data slots of the gosummaries object, it just
draws a horizontal barplot with the numbers of genes. On
visualizing the PCA data it draws histogram of the samples
on the principal axes. For clustering and differential
expression it draws the boxplot of expression values.
}
\examples{
\dontrun{
data(gs_limma)

# Default plot
plot(gs_limma, fontsize = 8)

# Omitting the panel area
plot(gs_limma, panel_height = 0, fontsize = 8)

# Selecting only certain components
plot(gs_limma, components = c(1, 3), fontsize = 8)

# Cutting the longer terms shorter (see the effect on the right wordcloud on first component)
plot(gs_limma, term_length = 20, fontsize = 8)

# Change wordcloud colors
plot(gs_limma, term_length = 20, wordcloud_colors = c("#C6DBEF", "#08306B"), fontsize = 8)

# Adjust panel plot type (see panel_boxplot help for options)
data(gs_kmeans)

plot(gs_kmeans, panel_plot = panel_violin, classes = "Tissue", components = 1:2,
 fontsize = 8)
plot(gs_kmeans, panel_plot = panel_violin_box, classes = "Tissue", components = 1:2,
 fontsize = 8)

# Adjust colorscheme for plot (see customize help for more information)
cust = function(p, par){
	p = p + scale_fill_brewer(par$classes, type = "qual", palette = 2)
	return(p)
}
plot(gs_kmeans, panel_plot = panel_violin, panel_customize = cust, classes = "Tissue",
 components = 1:2, fontsize = 8)

}
}
\author{
Raivo Kolde <rkolde@gmail.com>
}

