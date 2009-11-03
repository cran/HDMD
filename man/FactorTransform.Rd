\name{FactorTransform}
\Rdversion{1.1}
\alias{FactorTransform}
\alias{FactorTransform.default}
\alias{FactorTransform.vector}

\title{
  Metric Solution for Amino Acid characters
}
\description{
    Based off the work done by Atchley et al 2005, Amino Acids are transformed into 5 metrics according to factor analysis scores
	representing Factor1 (PAH): Polarity, Accessibility, Hydrophobicity; Factor2 (PSS): Propensity for Secondary Structure;
	Factor3 (MS) : Molecular Size; Factor4 (CC): Codon Composition; Factor5 (EC): Electrostatic Charge.  These numerics 
	provide a biologically meaningful value that establishes a platform capable of handling rigorous statistical techniques 
	such as analysis of variance, regression, discriminant analysis, etc.

}
\usage{
FactorTransform(Source, Search = AminoAcids, Replace = AAMetric.Atchley, Factor = 1, bycol = TRUE, SeqName = NULL,  alignment=FALSE, fillblank=NA)
}
\arguments{
  \item{Source}{
     Vector, Matrix or List of Amino Acid Sequences using the single character abbreviation~
}
  \item{Search}{
    Vector of symbols to search over.  Default is the list of Amino Acids.
}
  \item{Replace}{
     Vector or Matrix of values to replace Search items.  Rows of Replace correspond to elements of Search when byCol = TRUE.
}
  \item{Factor}{
    If Replace is a matrix, Factor designates which vector of Replace is used.
}
  \item{bycol}{
     logical. Designates if Replace is oriented so that columns correspond to replaceable elements
}
  \item{SeqName}{
     Vector of sequence names
}
  \item{alignment}{
  	if FALSE, result is a list.  If TRUE result is a matrix and hanging rows are filled with fillblank
}
  \item{fillblank}{
  	if alignment is TRUE, trailing sites are filled with this value.  Default is NA, but can be numeric.
}
}
\value{
  A list or matrix containing numeric representations of the sequences is returned.  
	If alignment is FALSE, each sequence is a new element in the list containing a vector of values with length corresponding to
	the length of the original sequence.  If alignment is TRUE, a matrix is returned with each row representing a sequence metric.  
	If the sequence lengths were unequal, trailing blanks are specified by the fillblank parameter.

}
\references{
 Atchley, W. R., Zhao, J., Fernandes, A. and Drueke, T. 2005. Solving the sequence "metric" problem: Proc. Natl. Acad. Sci. USA 102: 6395-6400.
}
\author{
  Lisa McFerrin
}

\seealso{
 \code{\link{lapply}}, \code{\link{replace}}
}
\examples{

FactorTransform("HDMD", Replace= AAMetric.Atchley)

data(bHLH288)
bHLH_Seq = as.vector(bHLH288[,2])
bHLH_ccList = FactorTransform(bHLH_Seq, Factor=4)
bHLH_ms     = FactorTransform(bHLH_Seq, Factor=3, alignment=TRUE)

bHLH_ms[c(20:25, 137:147, 190:196, 220:229, 264:273),1:8]
}

