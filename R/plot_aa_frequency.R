#' Plot frequency of amino acids
#'
#' @describeIn Creates a bar plot showing the frequency of each amino acid in a protein sequence.
#'
#' @param sequence A string representing an amino acid sequence
#'
#' @returns A plot showing the frequency of each amino acid in the sequence
#'
#' @importFrom ggplot2 ggplot aes geom_col theme_bw theme
#' @importFrom stringr str_split boundary str_count
#'
#' @export
#'
#' @examples
#' # Example 1: Simple peptide sequence
#' plot_aa_frequency("ACDEFGHIKLMNPQRSTVWY")
#'
#' # Example 2: HLA-A*0101 sequence
#' plot_aa_frequency("MAVMAPRTLLLLLSGALALTQTWAGSHSMRYFFTSVSRPGRGEPRFIAVGYVDDTQFVRFDSDAASQRMEPRAPWIEQEGPEYWDQETRNVKAQSQTDRVDLGTLRGYYNQSEAGSHTIQIMYGCDVGSDGRFLRGYRQDAYDGKDYIALNEDLRSWTAADMAAQITKRKWEAAHEAEQLRAYLDGTCVEWLRRYLENGKETLQRTDPPKTHMTHHPISDHEATLRCWALGFYPAEITLTWQRDGEDQTQDTELVETRPAGDGTFQKWAAVVVPSGEEQRYTCHVQHEGLPKPLTLRWELSSQPTIPIVGIIAGLVLLGAVITGAVVAAVMWRRKSSDRKGGSYTQAASSDSAQGSDVSLTACKV")
plot_aa_frequency <- function(sequence){

  # Split sequence into amino acids
  amino_acids <- sequence |>
    stringr::str_split(pattern = stringr::boundary("character"), simplify = TRUE) |>
    as.character() |>
    unique()

  #  Count frequency of each amino acid
  counts <- sapply(amino_acids, function(amino_acid) stringr::str_count(string = sequence, pattern =  amino_acid)) |>
    as.data.frame()

  colnames(counts) <- c("Counts")
  counts[["Sequence"]] <- rownames(counts)

  # Plot amino acid frequencies
  aa_plot <- counts |>
    ggplot2::ggplot(ggplot2::aes(x = Sequence, y = Counts, fill = Sequence)) +
    ggplot2::geom_col() +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.position = "none")

  return(aa_plot)
}
