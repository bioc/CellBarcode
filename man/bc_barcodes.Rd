% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/method-BarcodeObj.R
\name{bc_barcodes}
\alias{bc_barcodes}
\alias{bc_barcodes,BarcodeObj-method}
\title{Gets barcode sequences}
\usage{
bc_barcodes(barcodeObj, unlist = TRUE)

\S4method{bc_barcodes}{BarcodeObj}(barcodeObj, unlist = TRUE)
}
\arguments{
\item{barcodeObj}{A \code{BarcodeObj} object.}

\item{unlist}{A logical value. If TRUE, the function returns a vector of
unique barcode list from all samples; otherwise a list will be returned. In
the latter case, each element of the list contains the barcodes of a sample.}
}
\value{
A character vector or a list.
}
\description{
\code{bc_barcodes} used to get the barcode sequences in \code{BarcodeObj}
object. The input 
\code{BarcodesObj} object should be pre-processed by \code{bc_cure_*}
functions, such as \code{bc_cure_depth}, \code{bc_cure_umi}.
}
\examples{
data(bc_obj)

# Get unique barcodes vector of all samples
bc_barcodes(bc_obj)

# Get a list with each element containing barcodes from one sample
bc_barcodes(bc_obj, unlist = FALSE)

###
}
