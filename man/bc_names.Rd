% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/method-BarcodeObj.R,
%   R/method-seqQc.R
\name{bc_names}
\alias{bc_names}
\alias{bc_names<-}
\alias{bc_names,BarcodeObj-method}
\alias{bc_names<-,BarcodeObj,character-method}
\alias{bc_names,BarcodeQcSet-method}
\alias{bc_names<-,BarcodeQcSet,ANY-method}
\title{Access & update sample names in BarcodeObj & and BarcodeQcSet}
\usage{
bc_names(x)

bc_names(x) <- value

\S4method{bc_names}{BarcodeObj}(x)

\S4method{bc_names}{BarcodeObj,character}(x) <- value

\S4method{bc_names}{BarcodeQcSet}(x)

\S4method{bc_names}{BarcodeQcSet,ANY}(x) <- value
}
\arguments{
\item{x}{A \code{BarcodeObj} object or a \code{BarcodeQcSet} object.}

\item{value}{A character vector setting the new sample names, with the length
of the samples number in \code{BarcodeObj} or \code{BarcodeQcSet} object.}
}
\value{
A character vector
}
\description{
Get or update sample names in BarcodeObj object and BarcodeQcSet.
}
\examples{
data(bc_obj)

bc_names(bc_obj)
bc_names(bc_obj) <- c("new1", "new2")
}
