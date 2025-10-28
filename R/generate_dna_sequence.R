
#' Generate a random DNA sequence
#'
#' This function generates a random DNA sequence composed of the nucleotides
#' adenine (A), thymine (T), guanine (G), and cytosine (C). The user specifies
#' the desired sequence length.
#'
#' @param length Integer. The number of nucleotide bases in the generated DNA sequence.
#'
#' @return A character string representing the random DNA sequence of the specified length.
#'
#' @export
#'
#' @examples
#' # Generate a random DNA sequence of length 10
#' generate_dna_sequence(10)
#'
#' # Generate a longer sequence of length 100
#' generate_dna_sequence(100)
generate_dna_sequence <- function(length) {
  bases <- sample(c("A", "T", "G", "C"), size = length, replace = TRUE)
  sequence <- paste0(bases, collapse = "")
  return(sequence)
}






