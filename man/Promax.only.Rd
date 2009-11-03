\name{Promax.only}
\Rdversion{1.1}
\alias{Promax.only}
\title{
  Promax rotation (without prior Varimax rotation)
}
\description{
   Promax.only is an oblique rotation of factor loadings.  This function is directly derived from the 
   Promax function in the psych package, but only performs the promax rotation without first specifying 
   a varimax orthogonal rotation.	Further specifying the power of the fitting function allows for 
   greater versatility. 
}
\usage{
Promax.only(x, m = 4, rotate.structure=NULL)
}
\arguments{
  \item{x}{
      matrix of factor loadings 
}
  \item{m}{
      power of fitting function
}
  \item{rotate.structure}{
      rotation matrix if loadings have been prerotated.  Default is the identity matrix. 
}
}
\details{
   An oblique factor rotation will rescale the loadings with factors having correlated structure Phi 
}
\value{
  \item{loadings }{Oblique factor loadings}
  \item{rotmat}{Rotation matrix structure. If rotated.structure supplied, it will be factored into rotmat. }
  \item{Phi}{Correlation matrix structure of Factors}

}
\references{
 Hendrickson, A. E. and White, P. O, 1964, British Journal of Statistical Psychology, 17, 65-70.
}
\author{
  Lisa McFerrin
}
\note{
  Adapted directly from Promax of the psych package
}

\seealso{
 \code{\link{promax}},  \code{\link{factor.pa.ginv}}
}
\examples{
##compare to promax and Promax solutions
fa <- factanal( ~., 2, data = swiss)
Promax(loadings(fa))
Promax.only(loadings(fa))

}