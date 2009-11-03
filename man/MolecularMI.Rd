\name{MolecularMI}
\Rdversion{1.1}
\alias{MolecularMI}
\title{
	Molecular Mutual Information
}
\description{
	Mutual information (MI) represents the interdependence of two discrete random variables.  Thus MI
	quantifies the reduction in uncertainty of one variable given the knowledge of a second variable.
	Placing entropy values on the diagonal of a MI matrix forms a structure comparable to a covariance
	matrix appropriate for variability decomposition.   MI identifies pairs of statistically dependent
	or coupled sites where MI=1 indicates complete coupling. 


}
\usage{
MolecularMI(x, type, normalized)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
	matrix, vector, or list of aligned DNA or Amino Acid sequences.  If matrix, rows must be sequences and columns 
	individual characters of the alignment.  vector and list structures will be coerced into this format.
}
  \item{type}{
	"DNA", "AA", or "GroupAA" method for calculating and normalizing the entropy value for each column (site)
}
  \item{normalized}{
	method of normalization.  If "NULL" or not provided, MI[i,j] = H(x[i])+H(x[j])-H(x[i],x[j]) for i,j=1..n 
	where n is the number of sites.  Otherwise, MI is normalized by some leveling constant.  see \code{\link{NMI}}
}
}

\value{
	nxn matrix of mutual information values (DNA, AA, GroupAA), where n is the number of sites in the alignment.  The diagonal contains 
	the entropy values for that site.
}
\author{
Lisa McFerrin
}

\seealso{
\code{\link{MolecularEntropy}}, \code{\link{NMI}}
}
\examples{

data(bHLH288)
bHLH_Seq = bHLH288[,2]
bHLH.MIAA = MolecularMI(bHLH_Seq, "AA")
bHLH.MIFG = MolecularMI(bHLH_Seq, "GroupAA")

##Compare Entropy values
MolecularEntropy(bHLH_Seq, "AA")$H
diag(bHLH.MIAA)
diag(bHLH.MIFG)

plot(diag(bHLH.MIFG), type = "h", ylab="Functional Entropy", xlab="site")
}