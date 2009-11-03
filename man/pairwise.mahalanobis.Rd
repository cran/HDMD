\name{pairwise.mahalanobis}
\Rdversion{1.1}
\alias{pairwise.mahalanobis}
\title{
   Mahalanobis distances for grouped data 
}
\description{
   Returns a square matrix of Mahalanobis distances by doing a pairwise comparison of group means
		using the correlation between variables. 
}
\usage{
pairwise.mahalanobis(x, grouping = NULL, cov = NULL, inverted = FALSE, digits = 5, ...)
}
\arguments{
  \item{x}{
     vector or matrix of data with N observations and D variables.  If grouping is not specified, the first column is used for grouping observations.
}
  \item{grouping}{
     vector of characters or values designating group classification for observations.
}
  \item{cov}{
     Covariance matrix (DxD) of the distribution
}
  \item{inverted}{
     logical. If TRUE, cov is the inverse of the covariance matrix.
}
  \item{digits}{
	 number of decimals to keep for the means, cov and distance values  
}
  \item{\dots}{
     passed to mahalanobis for computing the inverse of the covariance matrix (if inverted is false).
}
}
\details{
  To determine the distance between group i and group j, the difference of group means for each variable are compared.
	For a (NxD) data matrix with m groups, a matrix of mxD means and a correlation matrix of DxD values are calculated.
	pairwise.mahalanobis calculates the mahalanobis distance for all possible group combinations and results in a mxm square
	distance matrix with m choose 2 distinct pairwise measures.
}
\value{
  \item{means }{(mxD) matrix of group means for each variable}
  \item{cov }{(DxD) covariance matrix of centered and scaled data, so it's actually the correlation matrix}
  \item{distance }{(mxm) matrix of squared mahalanobis distances}
}
\author{
  Lisa McFerrin
}
\seealso{
  \code{\link{mahalanobis}}
}
\examples{

data(bHLH288)
grouping = t(bHLH288[,1])
bHLH_Seq = as.vector(bHLH288[,2])
bHLH_pah = FactorTransform(bHLH_Seq, alignment=TRUE)

Mahala1 = pairwise.mahalanobis(bHLH_pah, grouping, digits = 3)
D = sqrt(Mahala1$distance)
D

}
