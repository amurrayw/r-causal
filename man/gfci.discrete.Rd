\name{gfci.discrete}
\alias{gfci.discrete}
\title{Greedy Causal Inference Algorithm on Discrete Data}
\description{
 \code{gfci.discrete} is the revised Greedy Equivalence Search (GES) algorithm developed 
 by Joseph D. Ramsey, Director of Research Computing, Department of Philosophy,
 Carnegie Mellon University, Pittsburgh, PA.
}
\usage{gfci.discrete(df, structurePrior = 1.0, samplePrior = 1.0, 
    maxDegree = 3, maxPathLength = -1, significance = 0.05, completeRuleSetUsed = FALSE, 
    faithfulnessAssumed = TRUE, verbose = FALSE, java.parameters = NULL, 
    priorKnowledge = NULL)
}
\arguments{
  \item{df}{ Data Frame of the dataset. }
  \item{structurePrior}{ Structure Prior.  By default, 
  \code{structurePrior}=1.0. }
  \item{samplePrior}{ Sample Prior.  By default, 
  \code{samplePrior}=1.0. }
  \item{maxDegree}{ integer indicating a number of degree of any node for the forward 
  reevaluation step. It ranges from -1 for unlimited degree, otherwise a number 
  >= 0. In the forward reevaluation step, subsets of neighbors up to degree 
  in size are considered. Limiting degree can speed up the algorithm. 
  By default, \code{maxDegree}=3. }
  \item{maxPathLength}{ integer indicating a maximum length for any discriminating path. 
  It ranges from -1 for unlimited degree, otherwise a number 
  >= 0. By default, \code{maxPathLength}=-1. }
  \item{significance}{ floating point indicating the statistical value (between zero and one) for the conditional independence test.  By default, 
  \code{significance}=0.05. }  
  \item{completeRuleSetUsed}{ boolean indicating whether or not the search applies 
  the complete rule set.  \code{completeRuleSetUsed} is 
  \code{FALSE} by default. }
  \item{faithfulnessAssumed}{ boolean indicating whether or not the search uses 
  that zero effect adjacencies are not in the graph.  \code{faithfulnessAssumed} is 
  \code{TRUE} by default. }
  \item{verbose}{ boolean indicating whether or not if verbose output should 
  be printed.  \code{verbose} is \code{FALSE} by default. }
  \item{java.parameters}{ string indicating an optional parameters for JVM. 
  For example, java.parameters = "-Xmx1024M". By default, 
  \code{java.parameters}=\code{NULL}. }
  \item{priorKnowledge}{ object indicating a prior knowledge of the graph. By default, 
  \code{priorKnowledge}=\code{NULL}. }
}
\details{
Greedy Fast Causal Inference Search (GFCI) is an implementation of the revised FCI algorithm, as 
published in Ogarrio et al. (2016) \dQuote{A Hybrid Causal Search Algorithm for Latent Variable Models} 
\href{http://www.jmlr.org/proceedings/papers/v52/ogarrio16.pdf}{pdf}. It uses FGES followed by PC adjacency 
removals. Uses conservative collider orientation. Gets sepsets for X---Y from among adjacents of X or of Y.

Following an idea of Spirtes, now it uses more of the information in FGES, to calculating 
possible d-separation paths and to utilize unshielded colliders found by FGES.

More detail about GFci implementation, please visit \href{http://cmu-phil.github.io/tetrad/tetrad-lib-apidocs/edu/cmu/tetrad/search/GFci.html}{the java documentation}.
}
\examples{
data("audiology")    #Load the audiology dataset
#Compute gfci search
gfci.discrete <- gfci.discrete(df=audiology, structurePrior=1.0, samplePrior=1.0, 
maxDegree = -1, faithfulnessAssumed = TRUE, verbose = TRUE)
gfci.discrete$parameters #Show the gfci's parameters
gfci.discrete$datasets #Show the dataset
gfci.discrete$nodes #Show the result's nodes
gfci.discrete$edges #Show the result's edges
}
\keyword{gfci}
\keyword{fci}
\keyword{causal graphs}
\keyword{discrete data}