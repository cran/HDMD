\name{NMI}
\Rdversion{1.1}
\alias{NMI}
\title{
	Normalized Mutual Information
}
\description{
	Mutual information (MI) represents the interdependence of two discrete random variables and is analogous
	to covariation in continuous data.	The intersection of entropy space of two random variables bound MI
	and quantifies the reduction in uncertainty of one variable given the knowledge of a second variable.
	However, MI must be normalized by a leveling ratio to account for the background distribution arising 
	from the stochastic pairing of independent, random sites.  Martin et al. (2005) found that the 
	background MI, particularly from phylogenetic covariation, has a contributable effect for multiple
	sequence alignments (MSAs) with less than 125 to 150 sequences. 
	
	NMI provides several methods for normalizing mutual information given the individual and joint entropies.

}
\usage{
NMI(Hx, Hy, Hxy, type = c("NULL", "marginal", "joint", "min.marginal", "max.marginal", "min.conditional", "max.conditional"))
}
\arguments{
  \item{Hx}{
	Marginal entropy for a discrete random variable (x)
}
  \item{Hy}{
	Marginal entropy for a discrete random variable (y)
}
  \item{Hxy}{
	Joint entropy for a discrete random variables (x and y)
}
  \item{type}{
	method of normalization.  Default is "NULL" and the Mutual Information is calculated as MI = Hx+Hy-Hxy.
	Other methods include "marginal", "joint", "min.marginal", "max.marginal", "min.conditional", "max.conditional".  
	See details below.
}
}
\details{

If any denominator is zero, MI=0.  Otherwise

Methods of Normalization:

		marginal     	MI =  2*( Hx + Hy - Hxy ) / ( Hx + Hy )   
		joint	     	MI =  2*( Hx + Hy - Hxy ) / ( Hxy )       
		min.marginal	MI =    ( Hx + Hy - Hxy ) / min(Hx,Hy)    
		max.marginal 	MI =    ( Hx + Hy - Hxy ) / max(Hx,Hy)    
		min.conditional MI =    ( Hx + Hy - Hxy ) / min(Hx.y,Hy.x)
		max.conditional MI =    ( Hx + Hy - Hxy ) / max(Hx.y,Hy.x)

}
\value{
	normalized mutual information value 
}
\references{
Martin, L.C., G. B. Gloor, et al. (2005). Using information theory to search for co-evolving 
residues in proteins. Bioinformatics. 21, 4116-24. 

}
\author{
Lisa McFerrin
}

\seealso{
\code{\link{MolecularEntropy}}, \code{\link{MolecularMI}}, 
}
