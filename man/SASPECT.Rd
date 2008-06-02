\name{SASPECT}
\alias{SASPECT}
\title{Significant AnalysiS of PEptide CounTs}
\description{A function for identifying differentially expressed proteins 
             between two sample groups using spectral counts from LC-MS/MS Experiments}    
\usage{
SASPECT(peptideData, pep.set, pep.pro.name, run.group.info, 
        permu.iter=50, filter.run=2, filter.score=0.95)
}

\arguments{
    \item{peptideData}{a list of two components: \code{PeptideCount} and 
                       \code{PeptideConfidence}. Both are numeric matrices with \code{p} rows each representing one peptide and 
                       \code{n1+n2} columns each representing one sample (\code{n1}=sample size of the first group, and 
                       \code{n2}=sample size of the second group). \code{PeptideCount} 
                       records the peptide spectral counts of all \code{p} peptides 
                       in all \code{n1+n2} samples. \code{PeptideConfidence} tracks 
                       the confidence score of each peptide identification in the database 
                       search procedure (e.g. the PeptideProphet score). Both 
                       matrics need to be arranged in the way that the first n1 columns represents samples
                       from the first group and the rest columns are for the second group.} 
    \item{pep.set}{a character vector of length p. The ith element is the peptide ID corresponding to the ith row 
                       of \code{peptideData$PeptideCount} and \code{peptideData$PeptideConfidence}.}  
    \item{pep.pro.name}{a character matrix with 2 columns. The first column gives the 
                        protein IDs, and the second column gives the names of the peptides 
                        matching to the proteins in the first column.}
    \item{run.group.info}{a data frame with two columns. The first column (\code{run.group.info$label})
                       is a character vector of length 2, giving the group names of the two groups.
                       The second column (\code{run.group.info$count}) is a numeric vector of 
                       length 2, giving the number of samples in the first group (\code{n1}) and 
                       the second group (\code{n2}).}
    \item{permu.iter}{an integer. It is the number of permutation iterations for estimating FDR. The default value is 50.}
    \item{filter.run}{an integer. It is the filter criteria for removing peptides observed in too few samples. The default value is 2.}
    \item{filter.score}{a scale. PeptideConfidence scores above this value are counted in the filtering process. The default value is 0.95}
}
        

\value{
    SASPECT generates a data frame with 7 columns:
    \item{Protein}{Protein groups' ID.}
    \item{ProteinsInGroup}{Names of proteins in each protein group (separated by \code{.}).}
    \item{Score1}{test score based on Appear-Absent (AA) measurements. A positive value suggests the abundence level in the second group is higher than the first group. A negative value suggests the opposite.}
    \item{Score2}{test score based on non zero total Spectral count (SpecC) measurements. A positive value suggests the abundence level in the second group is higher than the first group. A negative value suggests the opposite.}
    \item{Score}{final SASPECT score (sum square of Score1 and Score2).}
    \item{Qvalue}{FDR resulted from permutation test based on \code{Score}.}
    \item{PeptideNumber}{number of peptides observed for each protein(protein group).}
}

\details{
     This function implements the SASPECT-hybrid method (Wang et. al. 2008, in preparation), which is a modified version 
     of the original SASPECT mothod proposed in Whiteaker et. al. 2007. The \code{Score1} column in the returned matrix gives
     test statistics using the original SASPECT method.   
}

\references{
Whiteaker, J. R., Zhang, H., Zhao, L., Wang, P., Kelly-Spratt, K. S., Ivey, R. G., Piening, B. D., Feng, L., Kasarda, E.,
Gurley, K. E., Eng, J. K., Chodosh, L. A., Kemp, C. J., McIntosh, M. W., Paulovich, A. G (2007)
Integrated Pipeline for Mass Spectrometry-Based Discovery and Confirmation of Biomarkers Demonstrated in a Mouse Model of 
Breast Cancer. J. Proteome Res., 6(10); 3962-3975.

Wang, P., Liu, Y., McIntosh, M. W., Paulovich, A. G (2008) Significant analysis for comparative proteomics studies 
using label free LC-MS/MS experiments (in preparation).
}

\author{Wang, P. and Liu, Y. }

\keyword{methods}

\examples{

library(SASPECT)
data(mouseTissue)

SASPECT.result<-SASPECT(peptideData=mouseTissue$peptideData, 
        pep.set=mouseTissue$pep.set, 
        pep.pro.name=mouseTissue$pep.pro.name, 
        run.group.info=mouseTissue$run.group.info,
        permu.iter=50,
        filter.run=2,
        filter.score=0.95)
### it takes about 1 minute to run this example. 

### check the qvalue distribution
qvalue=as.numeric(SASPECT.result[,"Qvalue"])
plot(sort(qvalue))
     
### output the result into a table file
write.table(SASPECT.result, file="SASPECT.result.txt", row.names=FALSE, sep="\t")
     
}        

