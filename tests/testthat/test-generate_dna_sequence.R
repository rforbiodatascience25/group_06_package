test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("generate_dna_sequence works correctly", {
  # Test that the function returns a character string
  seq <- generate_dna_sequence(10)
  expect_type(seq, "character")

  # Test that the sequence has the correct length
  expect_equal(nchar(seq), 10)

  # Test that only valid DNA bases are used
  valid_bases <- c("A", "T", "G", "C")
  expect_true(all(strsplit(seq, "")[[1]] %in% valid_bases))

  # Test reproducibility with a seed
  set.seed(42)
  seq1 <- generate_dna_sequence(5)
  set.seed(42)
  seq2 <- generate_dna_sequence(5)
  expect_equal(seq1, seq2)
})

