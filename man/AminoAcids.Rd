\name{AminoAcids}
\Rdversion{1.1}
\alias{AminoAcids}
\alias{AAbyGroup}
\alias{AAGroups}
\alias{small}
\alias{polar}
\alias{hydrophobic}
\title{
	Amino Acid Properties
}
\description{
	Amino Acids have several distinct and overlapping physiochemical characteristics.  The single letter
	abbreviation for each amino acid is sorted alphabetically in the character vector AminoAcids.  
	AAbyGroup, small, polar, and hydrophobic correspond to this order and describe various amino acid attributes.
	
	Atchley et al 1999 categorized the 20 amino acids according to physiochemical attributes to form 8 
	functional groups.  The group names are alphabetized in AAGroups, while AAbyGroup orders these names
	to pair with AminoAcids.  small, polar, and hydrophobic contain the vector position of amino acids 
	that characterize that attribute.

	AA Groups:
	acidic = DE
	aliphatic = AGILMV
	aminic = NQ
	aromatic = FWY
	basic = HKR
	cysteine = C
	hydroxylated = ST
	proline = P

AminoAcids = c("A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y")
AAbyGroup = c("aliphatic", "cysteine", "acidic", "acidic", "aromatic", "aliphatic", "basic", "aliphatic", "basic", "aliphatic", "aliphatic", "aminic", "proline", "aminic", "basic", "hydroxylated", "hydroxylated", "aliphatic", "aromatic", "aromatic")
AAGroups = c("acidic","aliphatic", "aminic",  "aromatic", "basic","cysteine","hydroxylated", "proline")
small = c(1,2,3,6,12,13,16,17,18)
polar = c(2,3,4,7,9,12,14,15,16,17,19,20)
hydrophobic = c(1, 2,5,6,7,8,9,10,11,17,18,19,20)

}
\references{
Atchley, W.R., Terhalle, W. and Dress, A. (1999) Positional dependence, cliques and predictive motifs
in the bHLH protein domain. J. Mol. Evol. 48, 501-516
}
\author{
Lisa McFerrin
}
\examples{
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


}