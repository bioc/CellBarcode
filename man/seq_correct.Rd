% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{seq_correct}
\alias{seq_correct}
\title{Sequence clustering}
\usage{
seq_correct(
  seq,
  count,
  count_threshold,
  dist_threshold,
  depth_fold_threshold = 1,
  dist_method = 1L,
  insert_cost = 1L,
  delete_cost = 1L,
  replace_cost = 1L
)
}
\arguments{
\item{seq}{A string vector.}

\item{count}{An integer vector with the same order and length of UMI}

\item{count_threshold}{An integer, barcode count threshold to consider a
barcode as a true barcode, when when a barcode with count higher than this
threshold it will not be removed.}

\item{dist_threshold}{A integer, distance threshold to consider two barcodes
are related.}

\item{depth_fold_threshold}{An numeric, control the fold cange threshold
between the ' major barcodes and the potential contamination that need to be
removed.}

\item{dist_method}{A integer, if 2 the levenshtein distance will be used,
otherwise the hamming distance will be applied.}

\item{insert_cost}{A integer, the insert cost when levenshtein distance is applied.}

\item{delete_cost}{A integer, the delete cost when levenshtein distance is applied.}

\item{replace_cost}{A integer, the replace cost when levenshtein distance is
applied.}
}
\value{
a list with two data.frame. seq_freq_tab: table with barcode and
corrected ' sequence reads; link_tab: data table record for the clustering
process with ' first column of barcode be removed and second column of the majority 
barcode barcode.
}
\description{
This function will merge the UMIs by using the 
hamming distance. If two UMIs have hamming distance
no more than 1, only the UMI with more reads
will be kept.
}
\details{
This function will return the corrected UMI list.
}
