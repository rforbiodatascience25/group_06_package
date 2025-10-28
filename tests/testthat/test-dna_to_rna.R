
test_that("dna_to_rna converts T to U for simple inputs", {
  expect_equal(dna_to_rna("ATGCTTACG"), "AUGCUUACG")
  expect_equal(dna_to_rna("TTTTAAAGG"), "UUUUAAAGG")
})

test_that("dna_to_rna is idempotent for RNA inputs (no extra changes)", {
  expect_equal(dna_to_rna("AUGCUUACG"), "AUGCUUACG")
})

test_that("dna_to_rna handles vector inputs", {
  input <- c("ATG", "TTT", "GCA")
  expect_equal(dna_to_rna(input), c("AUG", "UUU", "GCA"))
})

test_that("dna_to_rna only replaces uppercase T", {
  # current implementation only replaces uppercase 'T'
  expect_equal(dna_to_rna("atgc"), "atgc")
  expect_equal(dna_to_rna("AtGcT"), "AuGcU")
})

test_that("dna_to_rna handles edge cases", {
  expect_equal(dna_to_rna(""), "")
  # Non-ATGC characters are passed through unchanged
  expect_equal(dna_to_rna("NNTTNN"), "NNUUNN")
})
