% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{parse_10x_sam}
\alias{parse_10x_sam}
\title{Parse 10X bam file}
\usage{
parse_10x_sam(in_file_path, regex_str, cell_barcode_tag = "CR", umi_tag = "UR")
}
\arguments{
\item{in_file_path}{A string, define the un-mapped sequences}

\item{regex_str}{A string, define the regular expression to match the barcode
sequence. The barcode sequence should be in the first catch. Please see the
\code{\link[CellBarcode]{bc_extract}} for detail.}

\item{cell_barcode_tag}{A string, define the tag of 10X cell barcode field in sam
file. The default is "CR".}

\item{umi_tag}{A string, define the tag of UMI field in the sam file.}
}
\value{
A data.frame with 4 columns:
\enumerate{
  \item \code{cell_barcode}: 10X cellular barcode.
  \item \code{umi}: UMI sequence.
  \item \code{barcode_seq}: lineage barcode.
  \item \code{count}: reads count.
}
}
\description{
Parse 10X bam file
}
