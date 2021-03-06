\name{gosummaries.matrix}
\alias{gosummaries.matrix}
\title{Prepare gosummaries object based on Multi Dimensional Scaling (MDS) results}
\usage{
\method{gosummaries}{matrix}(x, exp = NULL, annotation = NULL,
  components = 1:min(ncol(x), 10), show_genes = FALSE,
  gconvert_target = "NAME", n_genes = ifelse(show_genes, 30, 500),
  organism = "hsapiens", ...)
}
\arguments{
  \item{x}{a matrix representation of multi dimensional
  scaling result, rows correspond to samples}

  \item{exp}{an expression matrix, with columns
  corresponding to samples (these have to be in the same
  order as in \code{x})}

  \item{annotation}{a \code{data.frame} describing the
  samples, its row names should match with column names of
  \code{exp} (Optional)}

  \item{components}{numeric vector of comparisons to
  annotate}

  \item{show_genes}{logical showing if GO categories or
  actual genes are shown in word clouds}

  \item{gconvert_target}{specifies gene ID format for genes
  showed in word cloud. The name of the format is passed to
  \code{\link{gconvert}}, if NULL original IDs are shown.}

  \item{n_genes}{maximum number of genes shown in a word
  cloud}

  \item{organism}{the organism that the gene lists
  correspond to. The format should be as follows:
  "hsapiens", "mmusculus", "scerevisiae", etc.}

  \item{\dots}{GO annotation filtering parameters as
  defined in \code{\link{gosummaries.default}}}
}
\value{
A gosummaries object.
}
\description{
The Multi Dimensional Scaling (MDS) results are converted
into a gosummaries object, by finding genes that have most
significant Spearman correlations with each component.
}
\details{
This visualisation of MDS results is very similar to the
one performed by \code{\link{gosummaries.prcomp}}.
Difference from PCA is that, in general, we do not have the
loadings for individual genes that could be used to
associate genes with components. However, it is possible to
find genes that are most correlated with each component.
This function uses Spearman correlation coefficient to find
most correlated features. The significance of the
correlation values is decided using he approximation with
t-distribution.

The function can also display genes instead of their GO
annotations, while the sizes of the gene names correspond
to the Spearman correlation p-values. The corresponding
parameters are described in more detail in
\code{\link{gosummaries.MArrayLM}}. This feature is
important in applications, like metabolomics and
metagenomics, where the features are not genes and it is
not possible to run GO enrichment analysis.
}
\examples{
\dontrun{
library(vegan)

data("metagenomic_example")

# Run Principal Coordinate Analysis on Bray-Curtis dissimilarity matrix
pcoa = cmdscale(vegdist(t(metagenomic_example$otu), "bray"), k = 3)

# By turning off the GO analysis we can show the names of taxa
gs = gosummaries(pcoa, metagenomic_example$otu, metagenomic_example$annot,
 show_genes = TRUE, gconvert_target = NULL, n_genes = 30)

plot(gs, class = "BodySite", fontsize = 8)
}
}
\author{
Raivo Kolde <rkolde@gmail.com>
}

