\name{AAMetric.Atchley}
\Rdversion{1.1}
\alias{AAMetric.Atchley}
\docType{data}
\title{
    Amino Acid Metric Solution (Atchley et al 2005)
}
\description{
   Atchley et al 2005 performed factor analysis on a set of Amino Acid Indices (AA54) and inferred
   a 5 factor latent variable structure relating amino acid characteristics using SAS.  Based on the 
   relationship between factors and variable descriptions, the latent variables are defined as 
   Factor1 (PAH): Polarity, Accessibility, Hydrophobicity; Factor2 (PSS): Propensity for Secondary Structure;
   Factor3 (MS) : Molecular Size; Factor4 (CC): Codon Composition; Factor5 (EC): Electrostatic Charge.
   AAMetric.Atchley are scores from the factor analysis which convey the similarities and differences 
   among amino acids (rows) for each latent variable (columns).  
}
\format{
   Rows are alphabetized Amino Acids and the 5 columns are factors where 
   Factor1 (PAH): Polarity, Accessibility, Hydrophobicity; Factor2 (PSS): Propensity for Secondary Structure;
   Factor3 (MS) : Molecular Size; Factor4 (CC): Codon Composition; Factor5 (EC): Electrostatic Charge.
}
\details{
   54 Amino Acid Indices were selected from www.genome.jp/aaindex to quantify physiochemical attributes.
		Using Factor Analysis on 5 factors, interpretable latent variables were determined to quantify
		Amino Acid attributes.  These are the scores from the published factor analysis calculated by SAS.
		The proportion of common variation for each factor are 42.3%, 25.7%, 17.2%, 10.2%, and 4.6% respectively.
}
\source{
   Atchley, W. R., Zhao, J., Fernandes, A. and Drueke, T. 2005. Solving the sequence "metric" problem: Proc. Natl. Acad. Sci. USA 102: 6395-6400. 
}
\references{
   Atchley, W. R . and Fernandes, A. 2005. Sequence signatures and the probabilistic identification of proteins in the Myc-Max-Mad network. Proc. Natl. Acad. Sci. USA 102: 6401-6406. 
}
\seealso{
 \code{\link{AAMetric}}
}

\examples{
data(AAMetric.Atchley)
 plot(AAMetric.Atchley[,1], AAMetric.Atchley[,2], pch = AminoAcids) 

  cor(AAMetric, AAMetric.Atchley)
}
\keyword{datasets}