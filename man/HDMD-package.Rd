\name{HDMD-package}
\Rdversion{1.1}
\alias{HDMD-package}
\alias{HDMD}
\docType{package}
\title{
Structural Analysis Tools for High Dimensional Molecular Data 
}
\description{
High Dimensional Molecular Data (HDMD) typically have many more variables or dimensions than observations or replicates (D>>N).  
This can cause many statistical procedures to fail, become intractable, or produce misleading results.  
This package provides several tools covering Factor Analysis (FA), Principal Components Analysis (PCA) and Discriminant Analysis (DA)
to reduce dimensionality and analyze biological data for meaningful interpretation of results.
Since genetic (DNA or Amino Acid) sequences are composed of discrete alphabetic characters, entropy and mutual information are often used to estimate variability and covariability, respectively.
Alternatively, discrete alphabetic sequences can be transformed into biologically informative metrics to be used in various multivariate procedures.  
This package provide moleculr entropy and mutual information estimates as well as a metric transformation to convert amino acid letters into indices determined by Atchley et al 2005.
}
\details{
\tabular{ll}{
Package: \tab HDMD\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2012-9-19\cr
License: \tab GPL (>=2)\cr
LazyLoad: \tab yes\cr
}
}
\author{
Lisa McFerrin
Maintainer: Lisa McFerrin <lgmcferr@ncsu.edu>
}
\references{
 Atchley, W.R., Zhao, J., Fernandes, A. and Drueke, T. (2005) Solving the sequence "metric" problem: 
 Proc. Natl. Acad. Sci. USA 102: 6395-6400
 
 Atchley, W.R. and Fernandes, A. (2005) Sequence signatures an the probabilisitic identification of 
 proteins in the Myc-Max-Mad network. Proc. Natl. Acad. Sci. USa 102: 6401-6406
 
 Revelle, W. (in preparation) An Introduction to Psychometric Theory with applications in R. Springer
 at http://personality-project.org/r/book
}
\keyword{ package }
\seealso{
\code{\link[psych:psych-package]{psych}} ~~
}
\examples{
data(AA54)
#perform Factor Analysis on HDMD where D>>N
Factor54 = factor.pa.ginv(AA54, nfactors = 5, m=3, prerotate=TRUE, rotate="Promax", scores="regression")
Factor54

data(bHLH288)
bHLH_Seq = as.vector(bHLH288[,2])
grouping = t(bHLH288[,1])

#Transform Amino Acid Data into a biologically meaninful metric
AA54_MetricFactor1 = FactorTransform(bHLH_Seq, Replace=AAMetric, Factor=1, alignment=TRUE)

#Calculate the pairwise mahalanobis distances among groups given a discriminant function 
AA54_lda_Metric1 = lda(AA54_MetricFactor1, grouping)
AA54_lda_RawMetric1 = as.matrix(AA54_MetricFactor1) %*% AA54_lda_Metric1$scaling
AA54_lda_RawMetric1Centered = scale(AA54_lda_RawMetric1, center = TRUE, scale = FALSE)
AA54_lda_RawMetric1Centered[c(20:25, 137:147, 190:196, 220:229, 264:273),1:8]
plot(-1*AA54_lda_RawMetric1Centered[,1], -1*AA54_lda_RawMetric1Centered[,2], pch = grouping, xlab="Canonical Variate 1", ylab="Canonical Variate 2", main="DA Scores (Centered Raw Coefficients)\nusing Factor1 (pah) from R transformation")
lines(c(0,0), c(-15,15), lty="dashed")
lines(c(-35,25), c(0,0), lty="dashed")

Mahala_1 = pairwise.mahalanobis(AA54_lda_RawMetric1Centered, grouping)
D = sqrt(Mahala_1$distance)
D
}
