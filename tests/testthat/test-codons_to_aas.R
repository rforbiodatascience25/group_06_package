test_that("translation works", {
  expect_equal(codons_to_aas(c("UUU", "UCU")), "FS")
})
