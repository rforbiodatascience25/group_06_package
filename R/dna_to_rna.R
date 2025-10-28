#' Convert DNA sequence to RNA sequence
#'
#' This function replaces all occurrences of thymine ("T") with uracil ("U"),
#' converting a DNA sequence into its corresponding RNA sequence.
#'
#' @param dna_seq A character string representing a DNA sequence.
#'
#' @returns A character string containing the corresponding RNA sequence.
#' @export
#'
#' @examples
#' dna_to_rna("ATGCTTACG")
#' dna_to_rna("TTTAAA")
dna_to_rna <- function(dna_seq) {
  rna_seq <- gsub("T", "U", dna_seq)
  return(rna_seq)
}
