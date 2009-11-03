\name{AAMetric}
\Rdversion{1.1}
\alias{AAMetric}
\docType{data}
\title{
   Amino Acid Metric Solution using R (Atchley et al 2005)
}
\description{
   Atchley et al 2005 performed factor analysis on a set of Amino Acid Indices (AA54) and inferred
   a 5 factor latent variable structure relating amino acid characteristics using SAS.  An equivalent analysis
   was performed using factor.pa.ginv from the HDMD package in R.  Based on the 
   relationship between factors and variable descriptions, the latent 
   variables are defined as 
   Factor1 (PAH): Polarity, Accessibility, Hydrophobicity; Factor2 (PSS): Propensity for Secondary Structure;
   Factor3 (MS) : Molecular Size; Factor4 (CC): Codon Composition; Factor5 (EC): Electrostatic Charge.
   While the Factor Analysis loadings were the same, R and SAS calculated scores slightly differently.  
   AAMetric are scores from the R factor analysis which convey the similarities and differences 
   among amino acids (rows) for each latent variable (columns).
}
\format{
   Rows are alphabetized Amino Acids and the 5 columns are factors where 
   Factor1 (PAH): Polarity, Accessibility, Hydrophobicity; Factor2 (PSS): Propensity for Secondary Structure;
   Factor3 (MS) : Molecular Size; Factor4 (CC): Codon Composition; Factor5 (EC): Electrostatic Charge.
}
\details{
   54 Amino Acid Indices were selected from www.genome.jp/aaindex to quantify Amino Acid Similarities.
		Using Factor Analysis on 5 factors, interpretable latent variables were determined to quantify
		Amino Acid attributes.  These are the scores from factor analysis calculated by factor.pa.ginv in R.
}
\source{
   Method similar to Atchley, W. R., Zhao, J., Fernandes, A. and Drueke, T. 2005. Solving the sequence "metric" problem: Proc. Natl. Acad. Sci. USA 102: 6395-6400. 
}
\seealso{
 \code{\link{AAMetric.Atchley}}, \code{\link{factor.pa.ginv}}
}

\examples{
data(AAMetric)
 plot(AAMetric[,1], AAMetric[,2], pch = AminoAcids) 
 
 cor(AAMetric, AAMetric.Atchley)
}
\keyword{datasets}