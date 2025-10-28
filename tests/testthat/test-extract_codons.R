test_that("basic splitting into codons works", {
  expect_equal(extract_codons("ATGCGATAA"), c("ATG", "CGA", "TAA"))
})

test_that("start offset changes reading frame", {
  # Frame 1 (default)
  expect_equal(extract_codons("ATGCGATAA", start = 1), c("ATG", "CGA", "TAA"))
  # Frame 2
  expect_equal(extract_codons("ATGCGATAA", start = 2), c("TGC", "GAT"))
  # Frame 3
  expect_equal(extract_codons("ATGCGATAA", start = 3), c("GCG", "ATA"))
})

test_that("trailing bases not forming a full codon are dropped", {
  # 7 bases -> only first two codons returned, last base dropped
  expect_equal(extract_codons("ATGCGAT"), c("ATG", "CGA"))
})

test_that("handles RNA sequences as well", {
  expect_equal(extract_codons("AUGCGAUAA"), c("AUG", "CGA", "UAA"))
})

test_that("works with lowercase input", {
  expect_equal(extract_codons("atgcgataa"), c("atg", "cga", "taa"))
})

# Reflect current function behavior (errors for insufficient length / bad range)
test_that("empty input errors (seq wrong-sign by)", {
  expect_error(extract_codons(""), regexp = "wrong sign|by")
})

test_that("start beyond sequence length errors (seq wrong-sign by)", {
  expect_error(extract_codons("ATG", start = 5), regexp = "wrong sign|by")
})

test_that("length of output matches floor of readable triplets", {
  seq <- "ATGCGATAAC"  # 10 bases
  # From frame 1: positions 1-3, 4-6, 7-9 -> 3 codons, final 'C' dropped
  out <- extract_codons(seq, start = 1)
  expect_length(out, 3)
  expect_equal(out, c("ATG", "CGA", "TAA"))
})
