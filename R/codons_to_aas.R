#' Codons to amino acid sequence
#'
#' @param codons list/vector of codons (as strings)
#'
#' @returns an amino acid sequence resulting from the provided codons.
#' @export
#'
#' @examples codons_to_aas(c("UUU", "UCU"))
#'
codons_to_aas <- function(codons){
  aa_seq <- paste0(codon_table[codons], collapse = "")
  return(aa_seq)
}
