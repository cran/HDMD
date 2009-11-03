\name{factor.pa.ginv}
\Rdversion{1.1}
\alias{factor.pa.ginv}
\title{
  Principal Axis Factor Analysis when D>>N
}
\description{
  For data with more variables than observations (D>>N), the covariance matrix is singular
   and a general inverse is used to determine the inverse correlation matrix and estimate scores.  
   Using the principal axes method of Factor Analysis, communalities are estimated by iteratively updating the diagonal of the correlation matrix 
   and solving the eigenvector decomposition. Communalities for each variable are estimated according to the number of factors and convergence is defined
   by the stabalization of total communalities between iterations.
}
\usage{
factor.pa.ginv(r, nfactors = 1, residuals = FALSE, prerotate = FALSE, rotate = "varimax", m = 4, n.obs = NA, scores = c("none", "regression", "Bartlett"), force = FALSE, SMC = TRUE, missing = FALSE, impute = "median", min.err = 0.001, digits = 2, max.iter = 50, symmetric = TRUE, warnings = TRUE)
}
\arguments{
  \item{r}{
     Covariance matrix or raw data matrix. A correlation matrix is computed using pairwise deletion.
}
  \item{nfactors}{
     Number of factors to extract.  Default is 1.
}
  \item{residuals}{
     logical.  If residual matrix is included in result
}
  \item{prerotate}{
     logical.  Rotate the loadings using a varimax orthogonal rotation before applying a different rotation.
}
  \item{rotate}{
     "none", "varimax", "promax" rotation applied to the loadings
}
  \item{m}{
     integer.  power of the fitting function in a promax rotation.  Default is 4.
}
  \item{n.obs}{
     Number of observations used to find the correlation matrix if using a correlation matrix. 
		Used for finding the goodness of fit statistics.
}
  \item{scores}{
    If TRUE, estimate factor scores.  If D>>N, ginv(r) is used during the calculation.
}
  \item{force}{
	if TRUE, a square matrix r will be interpreted as a data matrix.  The default is FALSE, and square matrices are assumed to represent covariance
}
  \item{SMC}{
     Use squared multiple correlations (SMC=TRUE) or use 1 as initial communality estimate. Try using 1 if imaginary eigen values are reported.
}
  \item{missing}{
     If scores are TRUE, and missing=TRUE, then impute missing values using either the median or the mean
}
  \item{impute}{
     "median" or "mean" values are used to replace missing values
}
  \item{min.err}{
    Iterate until the change in communalities is less than min.err.  Default is 0.001
}
  \item{digits}{
    Number of digits to display in output
}
  \item{max.iter}{
     Maximum number of iterations for convergence
}
  \item{symmetric}{
     symmetric=TRUE forces symmetry by just looking at the lower off diagonal values
}
  \item{warnings}{
     warnings=TRUE displays warning messages encountered during estimation
}  
}
\value{
 \item{values }{Eigen values of the final solution}
 \item{communality}{Communality estimates for each item. These are merely the sum of squared factor loadings for that item.}
 \item{rotation}{which rotation was requested?}
 \item{n.obs}{number of observations specified or found}
 \item{loadings}{An item by factor loading matrix of class ``loadings" Suitable for use in other programs (e.g., GPA rotation or factor2cluster.}
 \item{fit}{How well does the factor model reproduce the correlation matrix. (See VSS, ICLUST, and principal for this fit statistic.}
 \item{fit.off}{how well are the off diagonal elements reproduced?}
 \item{dof}{Degrees of Freedom for this model. This is the number of observed correlations minus the number of independent parameters. Let n=Number of items, nf = number of factors then 
 dof = n * (n-1)/2 - n * nf + nf*(nf-1)/2}
 \item{objective}{value of the function that is minimized by maximum likelihood procedures. This is reported for comparison purposes and as a way to estimate chi square goodness of fit. The objective function is 
 log(trace ((FF'+U2)^(-1) R) - log(|(FF'+U2)^-1 R|) - n.items.}
 \item{STATISTIC}{If the number of observations is specified or found, this is a chi square based upon the objective function, f. Using the formula from factanal(which seems to be Bartlett's test) : 
 chi^2 = (n.obs - 1 - (2 * p + 5)/6 - (2 * factors)/3)) * f}
 \item{PVAL}{If n.obs > 0, then what is the probability of observing a chisquare this large or larger?}
 \item{Phi}{If oblique rotations (using oblimin from the GPArotation package or promax) are requested, what is the interfactor correlation.}
 \item{communality.iterations}{The history of the communality estimates. Probably only useful for teaching what happens in the process of iterative fitting.}
 \item{residual}{If residuals are requested, this is the matrix of residual correlations after the factor model is applied.}

}
\references{
 Gorsuch, Richard, (1983) Factor Analysis. Lawrence Erlebaum Associates.
 Revelle, William. (in prep) An introduction to psychometric theory with applications in R. Springer. Working draft available at http://personality-project.org/r/book.html
}
\author{
  Lisa McFerrin
}
\note{
 This is a direct adaptation from the factor.pa function implemented in the psych package.
}

\seealso{
\code{\link{Promax.only}}
}
\examples{
#compare Principal Components and Factor Analysis methods on Amino Acid data with D>>N

data(AA54)
AA54_PCA = princomp(AA54, covmat = cov.wt(AA54))

Factor54 = factor.pa.ginv(AA54, nfactors = 5, m=3, prerotate=TRUE, rotate="Promax", scores="regression")
Factor54$loadings[order(Factor54$loadings[,1]),]  

require(scatterplot3d)
  Factor3d =scatterplot3d(Factor54$scores[,1:3], pch = AminoAcids, main="Factor Scores", box = FALSE, grid=FALSE, xlab="pah", ylab="pss", zlab="ms")
  Factor3d$plane3d(c(0,0,0), col="grey")
  Factor3d$points3d(c(0,0), c(0,0), c(-3,2), lty="solid", type="l" )
  Factor3d$points3d(c(0,0), c(-1.5,2), c(0,0), lty="solid", type="l" )
  Factor3d$points3d(c(-1.5,2), c(0,0), c(0,0), lty="solid", type="l" )
  Factor3d$points3d(Factor54$scores[hydrophobic,1:3], col="blue", cex = 2.7, lwd=1.5)
  Factor3d$points3d(Factor54$scores[polar,1:3], col="green", cex = 3.3, lwd=1.5)
  Factor3d$points3d(Factor54$scores[small,1:3], col="orange", cex = 3.9, lwd=1.5)
  legend(x=5, y=4.5, legend=c("hydrophobic", "polar", "small"), col=c("blue", "green", "orange"), pch=21, box.lty =0)

cor(AA54_PCA$scores, Factor54$scores)
}