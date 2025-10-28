#' Split a nucleotide sequence into codons
#'
#' @param sequence A character string representing a nucleotide sequence.
#' @param start An integer indicating the starting position for reading codons.
#'
#' @returns A character vector where each element is a codon (a triplet of nucleotides) extracted from the input sequence.
#' @export
#'
#' @examples
#' # Split a DNA sequence into codons
#' extract_codons("ATGCGATAA")
#'
#' # Start reading from the second position
#' extract_codons("ATGCGATAA", start = 2)
extract_codons <- function(sequence, start = 1){
  seq_len <- nchar(sequence)
  codons <- substring(sequence,
                      first = seq(from = start, to = seq_len - 3 + 1, by = 3),
                      last = seq(from = 3 + start - 1, to = seq_len, by = 3))
  return(codons)
}
