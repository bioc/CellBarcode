## set up a dummy data set
d1 <- data.frame(
  seq = c(
    "ACTTCGATCGATCGAAAAGATCGATCGATC",
    "AATTCGATCGATCGAAGAGATCGATCGATC",
    "CCTTCGATCGATCGAAGAAGATCGATCGATC",
    "TTTTCGATCGATCGAAAAGATCGATCGATC",
    "AAATCGATCGATCGAAGAGATCGATCGATC",
    "CCCTCGATCGATCGAAGAAGATCGATCGATC",
    "GGGTCGATCGATCGAAAAGATCGATCGATC",
    "GGATCGATCGATCGAAGAGATCGATCGATC",
    "ACTTCGATCGATCGAACAAGATCGATCGATC",
    "GGTTCGATCGATCGACGAGATCGATCGATC",
    "GCGTCCATCGATCGAAGAAGATCGATCGATC"
    ),
  freq = c(
    30, 60, 9, 10, 14, 5, 10, 30, 6, 4 , 6
    )
  )


test_that("Senerio1: Backbone no error, Depth cutoff >= 6", {
  pattern <- "TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern, sample_name=c("test"))
  bc_obj <- bc_cure_depth(bc_obj, depth=6)
  expect_equal(bc_2df(bc_obj), data.frame(sample_name = "test", barcode_seq = c("AGAG", "AAAG", "AGAAG", "ACAAG"), count = c(104, 50, 14, 6), stringsAsFactors=FALSE))
})


test_that("Senerio1.1: Backbone no error, Depth cutoff >= 6, hamming dist 1", {
  pattern <- "TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern, sample_name=c("test"))
  bc_obj <- bc_cure_cluster(bc_cure_depth(bc_obj, depth=6), dist_threshold = 1)
  ## Merge the minority reads
  # expect_equal(bc_2df(bc_obj), data.frame(sample_name = "test", barcode_seq = c("AGAG", "AGAAG"), count = c(104 + 50, 14 + 6), stringsAsFactors=FALSE))
  ## Do not merge the monority reads
  expect_equal(bc_2df(bc_obj), data.frame(sample_name = "test", barcode_seq = c("AGAG", "AGAAG"), count = c(104, 14), stringsAsFactors=FALSE))
})

test_that("Senerio1.2: Backbone no error, Depth cutoff >= 6, levenshtein dist 1", {
  pattern <- "TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern, sample_name=c("test"))
  bc_obj <- bc_cure_cluster(bc_cure_depth(bc_obj, depth=6), dist_threshold = 1, dist_method = "leven")
  ## Merge the minority reads
  # expect_equal(bc_2df(bc_obj), data.frame(sample_name = "test", barcode_seq = c("AGAG"), count = c(104 + 50 + 14 + 6), stringsAsFactors=FALSE))
  ## Do not merge the monority reads
  expect_equal(bc_2df(bc_obj), data.frame(sample_name = "test", barcode_seq = c("AGAG"), count = c(104), stringsAsFactors=FALSE))
})


test_that("Senerio2: Backbone 1 error, Depth cutoff >= 6", {
  pattern <- "TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern,  maxLDist=1)
  bc_obj <- bc_cure_depth(bc_obj, depth=6)
  expect_equal(bc_2df(bc_obj), data.frame(sample_name="test", barcode_seq = c("AGAG", "AAAG", "AGAAG", "ACAAG"), count=c(104, 50, 20, 6), stringsAsFactors=FALSE))
})

test_that("Senerio3: Backbone no error, Depth cutoff >= 6, No fishing, UMI is unique", {
  pattern <- "([ACTG]{3})TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern, sample_name=c("test"), pattern_type=c(UMI=1, barcode=2))
  bc_obj <- bc_cure_depth(bc_cure_umi(bc_obj, depth=6, doFish=FALSE, isUniqueUMI=TRUE), depth=0)
  expect_equal(bc_2df(bc_obj), data.frame(sample_name="test", barcode_seq = c("AGAG", "AAAG", "AGAAG"), count=c(3, 3, 1), stringsAsFactors=FALSE))
})


test_that("Senerio4: Backbone 1 error, Depth cutoff >= 6, Fishing, UMI is not unique", {
  pattern <- "([ACTG]{3})TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern, sample_name=c("test"), pattern_type=c(UMI=1, barcode=2), maxLDist=1)
  bc_obj <- bc_cure_depth(bc_cure_umi(bc_obj, depth=6, doFish=TRUE, isUniqueUMI=FALSE), depth=0)
  expect_equal(bc_2df(bc_obj), data.frame(sample_name="test", barcode_seq = c("AGAG", "AAAG", "AGAAG", "ACAAG"), count=c(3, 3, 3, 1), stringsAsFactors=FALSE))
})

test_that("Senerio5: Backbone 1 error, Depth cutoff >= 6, Fishing, UMI is is unique", {
  pattern <- "([ACTG]{3})TCGATCGATCGA([ACTG]+)ATCGATCGATC"
  bc_obj <- bc_extract(list(test = d1), pattern, sample_name=c("test"), pattern_type=c(UMI=1, barcode=2), maxLDist=1)
  bc_obj <- bc_cure_depth(bc_cure_umi(bc_obj, depth=6, doFish=TRUE, isUniqueUMI=TRUE), depth=0)
  expect_equal(bc_2df(bc_obj), data.frame(sample_name="test", barcode_seq = c("AGAG", "AAAG", "AGAAG"), count=c(3, 3, 3), stringsAsFactors=FALSE))
})


