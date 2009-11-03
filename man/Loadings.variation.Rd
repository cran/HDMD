\name{Loadings.variation}
\Rdversion{1.1}
\alias{Loadings.variation}
\title{
	Proportional and Cumulative Variation of Loading Components
}
\description{
	Principal Component Analysis (PCA) methods \code{\link{prcomp}} and
 \code{\link{princomp}} do not accurately reflect the proportion of total variation of each principal component.
 Instead \code{\link{princomp}} calculates these values on the eigenvalue adjusted data, which 
 misleadingly indicates that each component contributes equally to the variability in the loadings output.
 \code{\link{prcomp}} does not report the proportion of variablity.  To rectify this, 
 \code{\link{Loadings.variation}} displays the relative and cumulative contribution of variation for 
 each component by accounting for all variability in data.  Component variation is reported by the lambda value 
 (which corresponds to the eigenvalue in \code{\link{princomp}}), while the proportion and cumulative variation
 relate these values to the total variability in data.
}
\usage{
Loadings.variation(sdev, digits = 5)
}
\arguments{
  \item{sdev}{
	vector of standard deviations for each component
}
  \item{digits}{
	number of decimal places to retain.  Default is 5.
}
}
\details{

	For each component:

	Lambda = sdev^2					Component Variance
	PTV = Lambda / sum(Lambda)		Proportion of Total Variation
	CTV = cumsum(PTV)				Cumulative Total Variation
	
	All variability is accounted for in Principal Components, where each component is orthogonal and 
	in decreasing order of variation explained.  This allows PTV to be calculated as a proportion of 
	the sum of individual variances and CTV=1 when accounting for all components.
}
\value{
	labeled matrix of variation for loading components.  Lambda represents the variation for each component, 
	PTV is the Proportion of Total Variation and CTV is the Cumulative Proportion of Total Variation.  
	Values are rounded according to the number of digits specified.
}

\author{
Lisa McFerrin
}

\seealso{
\code{\link{prcomp}}, \code{\link{princomp}}
}
\examples{

PCA_SVD = prcomp(USArrests, scale = TRUE)
PCA_SVD$rotation
Loadings.variation(PCA_SVD$sdev)

PCA_EIG = princomp(USArrests, cor = TRUE)
PCA_EIG$loadings
Loadings.variation(PCA_EIG$sdev)

}