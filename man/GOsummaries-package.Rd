\docType{package}
\name{GOsummaries-package}
\alias{GOsummaries}
\alias{GOsummaries-package}
\title{Word cloud summaries of GO enrichment analysis}
\description{
A package to visualize Gene Ontology (GO) enrichment
analysis results on gene lists arising from different
analyses such clustering or PCA. The significant GO
categories are visualised as word clouds that can be
combined with different plots summarizing the underlying
data.
}
\details{
The goal of GOsummaries package is to draw figures that can
be used in presentations and articles. To draw them, the
user should first construct a \code{\link{gosummaries}}
object and then use its plot function on it. One can start
constructing the \code{\link{gosummaries}} object from gene
lists, with filling in all the necessary information step
by step. However, there are some convenience functions for
different classes of common analysis results. See
\code{\link{gosummaries.kmeans}},
\code{\link{gosummaries.MArrayLM}} and
\code{\link{gosummaries.prcomp}} corresponding to k-means,
limma and PCA results.

The \code{\link{plot.gosummaries}} describes how to
customize the plots.

The word cloud drawing function \code{\link{plotWordcloud}}
in this package is implemented largely based on the code
from package \code{wordcloud}, but with slight tweaks: it
uses \code{grid} graphics, has some additional layout
options, has more intelligent options to scale the text
sizes to fit the picture and, finally, should be a bit
faster since larger part of the algorithm was implemeted in
C++.
}

