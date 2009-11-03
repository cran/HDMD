\name{bHLH288}
\Rdversion{1.1}
\alias{bHLH288}
\docType{data}
\title{
    Alignment of basic Helix Loop Helix (bHLH) domain data
}
\description{
   The bHLH domain has been categorized into 5 major classes (Atchley and Fitch 1997).
   The bHLH288 dataset contains 288 amino acid sequences with samples from each class.  While the 
   basic and helix regions have well defined structures consisting of 13 and 15 amino acids respectively,
   the loop region has variable length.  To prevent gaps, the loop was truncated in some proteins so only 51 
   sites are retained and partitioned into basic (1-13), helix(14-28), loop (29-36), and helix(37-51) regions.
}
\details{
  The bHLH domain is present throughout Eukaryotes and acts as a transcriptional regulator.
  This alignment consists of 51 sites  where the first 13 constitute the basic region responsible 
  for DNA binding.  Each of the 2 helices are 15 amino acids in length, while the loop is variable.
  Groups are specified by several factors, including the E-box binding specification and inclusion
  or lack of other domains.  The 5 groups are designated by their E-box specificity and presence of
  additional domains where Group A binds to CAGCTG E-box motif, Group B binds to CACGTG E-box motif
  and is most prevalent, Group C has an additional PAS domain, Group D lacks a basic region, and
  Group E binds to CACG[C/A]G N-box motif.
}
\source{
Atchley, W.R. and Fitch, W. (1997) A natural classification of the basic helix-loop-helix class of
transcription factors. Proc. Natl. Acad. Sci. USA 94: 5172-5176.

Atchley, W.R. and Fernandes, A. (2005) Sequence signatures and the probabilistic identification of 
proteins in the Myc-Max-Mad network. Proc. Natl. Acad. Sci. USE 102: 6401-6406
}
\examples{
data(bHLH288)

 #Separate grouping and sequences 
 grouping = t(bHLH288[,1])
 bHLH_Seq = as.vector(bHLH288[,2])
}
\keyword{datasets}