\name{MolecularEntropy}
\Rdversion{1.1}
\alias{MolecularEntropy}
\title{
	Molecular Entropy for DNA or Amino Acid Sequences
}
\description{
	Entropy (H) is a measure of uncertainty for a discrete random variable and is analogous to variation
	in continuous data.  Traditionally the logarithm base for entropy is calculated with unit bits (b=2), 
	nats (b=e) or dits (b=10).  Alternatively, entropy estimates can be normalized to a common scale where 0<=H<=1
	by setting b=n, the number of possible states.  For DNA (n=4 nucleotide) or protein (n=20 amino acid) 
	sequences, normalized entropy H=0 indicates an invariable site while H=1 represents a site where 
	all states occur with equal probability.
	
	Atchley et al 1999 categorized amino acids according to physiochemical attributes to form (n=8) 
	functional groups.  In conjunction with the AA entropy, the GroupAA entropy value may provide insight
	to differences in functional and phylogenetic variation.

	AA Groups:
	acidic = DE
	aliphatic = AGILMV
	aminic = NQ
	aromatic = FWY
	basic = HKR
	cysteine = C
	hydroxylated = ST
	proline = P
	
	Gaps are ignored on a site by site basis so the entropy values may have different number of 
	observations among sites.  Sequences must be of the same length.

}
\usage{
MolecularEntropy(x, type)
}
\arguments{
  \item{x}{
	matrix, vector, or list of aligned DNA or Amino Acid sequences.  If matrix, rows must be sequences and columns 
	individual characters of the alignment.  vector and list structures will be coerced into this format.
}
  \item{type}{
	"DNA", "AA", or "GroupAA" method for calculating and normalizing the entropy value for each column (site)
}
}
\value{
\item{counts}{ matrix of integers counting the presence of each character (DNA, AA, or GroupAA) at each site }
\item{freq}{   matrix of character (DNA, AA, or GroupAA) frequencies.  These are simply character counts divided by total number of (non-gap) characters at each site }
\item{H}{	   vector of Entropy values for each site }
}
\references{
Atchley, W.R., Terhalle, W. and Dress, A. (1999) Positional dependence, cliques and predictive motifs
in the bHLH protein domain. J. Mol. Evol. 48, 501-516

Kullback S. (1959) Information theory and statistics. Wiley, New York 
}
\author{
Lisa McFerrin
}
\examples{

data(bHLH288)
bHLH_Seq = bHLH288[,2]
MolecularEntropy(bHLH_Seq, "AA")
MolecularEntropy(bHLH_Seq, "GroupAA")
}