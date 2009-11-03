\name{AA54}
\Rdversion{1.1}
\alias{AA54}
\docType{data}
\title{
    Normalized Amino Acid Indices quantifying 54 various attributes
}
\description{
    From approximately 500 indices listed in www.genome.jp/aaindex as of 2005, a sample of 54 
    Amino Acid Indices were selected to represent the range of structural and functional attributes.  Each
    index was normalized to have mean 0 and variation 1.
}
\format{
AA54 is a matrix of 54 indices (columns) quantifying attributes for the 20 amino acids (rows).  Amino acids
are represented by their single character abbreviation and sorted alphabetically.  Indices are normalized
to have mean = 0 and variation = 1.

}
\source{
   www.genome.jp/aaindex
}
\examples{
data(AA54)
AA54
}
\keyword{datasets}
