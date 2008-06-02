\name{mouseTissue}
\docType{data}
\alias{mouseTissue}
\title{LC MS/MS Data from Mouse Model}
\description{An Example data for package \code{SASPECT}}

\usage{data(mouseTissue)}

\details{
This data example is from the mouse study described in Whiteaker et. al. 2007. 
It contains the information of 333 peptides from 20 LC-MS/MS experiments (10 from the normal group and 10 from the control group).}

\value{        
        \code{mouseTissue} is a list of four components: 
\item{peptideData}{a list of two numeric matrices, \code{PeptideCount} and PeptideConfidence. The 
                   columns correspond to 20 LC-MS/MS experiments, and rows correspond to 333 peptides. 
                   \code{PeptideCount} records the total spectral counts of each peptide in each experiment. 
                   \code{PeptideConfidence} tracks the highest PeptideProphet score of each peptide identification in each experiment 
                   in the database search procedure.}
\item{pep.set}{a character vector of length 333, recording the peptide IDs.} 
\item{pep.pro.name}{a character matrix consisting of 15579 rows and 2 columns. The first column is a vector of  
                   mouse protein IDs (IPI numbers), while the second column gives the names of the peptides 
                   matching to the mouse proteins in the first column.}
\item{run.group.info}{a data frame consiting of 2 rows and 2 columns, which indicates 
                      the case status and the sample size of each group.}
}

\references{
Whiteaker, J. R., Zhang, H., Zhao, L., Wang, P., Kelly-Spratt, K. S., 
Ivey, R. G., Piening, B. D., Feng, L., Kasarda, E., Gurley, K. E., 
Eng, J. K., Chodosh, L. A., Kemp, C. J., McIntosh, M. W., Paulovich, A. G (2007)
Integrated Pipeline for Mass Spectrometry-Based Discovery and 
Confirmation of Biomarkers Demonstrated in a Mouse Model of 
Breast Cancer. J. Proteome Res., 6(10); 3962-3975.

Wang, P., Liu, Y., McIntosh, M. W., Paulovich, A. G (2008) Significant analysis for comparative proteomics studies 
using label free LC-MS/MS experiments.
}


\keyword{datasets}

