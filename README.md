group_06_package
================







``` r
library(group6.Rpackage)
```

# Lab 08 Assignment: Group 06

## **Info**

**Group number:** 06

**Group members:**

Alberte Englund, s215067

Mathilde Due, s215063

Line Winther Gormsen, s215111

Sigrid Frandsen, s205875

Kristine Johansen, s215098

**Link to GitHub:**
<https://github.com/rforbiodatascience25/group_06_package>

## Description of package

This package includes functions for the central dogma including
constructing a random DNA sequence, transcribing it into RNA, extracting
codons, translating the codons into amino acids and finally plotting the
amino acid composition.

## Function 1

### `generate_dna_sequence()`

The `generate_dna_sequence()` function generates a random DNA sequence
composed of the nucleotides: adenine (A), thymine (T), cytosine (C), and
guanine (G). The user specifies the sequence length, and then the
function randomly selects the nucelotide bases.

The generated sequence can subsequently be transcribed into its
corresponding RNA sequence.

#### Usage

``` r
generate_dna_sequence(length)
```

#### Arguments

- length: An integer specifying the total number of nucleotides to
  include in the generated DNA sequence.

#### Value

The function returns a single character string representing a random DNA
sequence composed of the letters A, T, G, and C.

#### Details

The function uses `sample()` to randomly choose nucleotide bases (A, T,
G, and C). These bases are then joined together into one string using
`paste0()`. Each run creates a new random sequence.

#### Examples

``` r
# Example 1: Generate a short DNA sequence of length 10
generate_dna_sequence(10)
# Output: "ATGCTTACGA"

# Example 2: Generate a longer sequence of length 50
generate_dna_sequence(50)
# Output: "TTGCAAGTTAGCGCTAGTACGTTAGCTAGGCTTACGATGCGTACGGTAG"
```

## Function 2

### `dna_to_rna()`

The `dna_to_rna()` function converts a DNA sequence into its
corresponding RNA sequence. This is done by replacing every thymine
(“T”) nucleotide with a uracil (“U”) nucleotide.

This step represents transcription, producing a nucleotide sequence of
RNA. This RNA sequence can then be split into codons translated to amino
acids.

#### Usage

``` r
dna_to_rna(dna_seq)
```

#### Arguments

- dna_seq: A character string or vector representing one or more DNA
  sequences composed of the nucelotides A, T, C, and G.

#### Value

The function returns a character string (or vector) where all `"T"`
nucleotides are replaced by `"U"` nucleotides, yielding the
corresponding RNA sequence.

#### Details

The function uses the base R function `gsub()` to replace all
occurrences of uppercase `"T"` with `"U"`.  
Lowercase letters remain unchanged. If lowercase sequences should also
be converted, they need to be transformed to uppercase letters before
transcription. This function is used as a transcription step before
splitting the sequence into codons and translating the RNA sequence into
amino acids.

#### Examples

``` r
# Example 1: Convert a simple DNA sequence to RNA
dna_to_rna("ATGCTTACG")
# Output: "AUGCUUACG"

# Example 2: Convert multiple sequences at once
dna_to_rna(c("TTTAAA", "GCTTGA", "ATG"))
# Output: "UUUAAA" "GCUUGA" "AUG"
```

## Function 3

### `extract_codons()`

The `extract_codons()` function splits a nucleotide sequence, which can
be either DNA or RNA, into codons starting from a specified position.
This is a key part of the translational process as these codons can then
be translated into amino acids during the proteins synthesis.

#### **Usage**

``` r
extract_codons(sequence, start = 1)
```

#### Arguments

- sequence: A character string representing a nucleotide sequence
  composed of the letters A, T (or U), C, and G.

- start: An integer specifying the position to begin reading codons. The
  default is 1 and if changed it will represent a different reading
  frame.

#### Value

Returns a character vector where each element corresponds to one codon
(a triplet of nucleotides) extracted from the input sequence.

#### Details

The function calculates the total sequence length. It then uses
substrig() to extract triplets of the seqeunce starting from the
specified position. Only actual triplets will be returned and the
remaining nucleotides at the end of the sequence will be ignored.

#### Examples

``` r
# Example 1: Split a simple DNA sequence into codons
extract_codons("ATGCGATAA")
# Output: "ATG" "CGA" "TAA"

# Example 2: Start reading from the second position (frame shift)
extract_codons("ATGCGATAA", start = 2)
# Output: "TGC" "GAT"

# Example 3: RNA sequence example
extract_codons("AUGCGAUAA")
# Output: "AUG" "CGA" "UAA"
```

## Function 4

### `codons_to_aas()`

The `codons_to_aas() function` converts the codons provided from the
`extract_codons()` into a sequence of the corresponding amino acids. In
that way, this function handles the “translation” part of the central
dogma, converting the RNA into proteins.

#### **Usage**

``` r
codons_to_aas(c("AUG", "CGA", "UAA"))
```

#### Arguments

A single codon as a string or a list of codons as strings. The codons
consist of three of the bases A, U, C, and G.

#### Value

Returns a string of amino acids (peptide / protein sequence)
corresponding to the provided codons.

#### Details

The function takes each codon and “translate” it using the named vector
“codon_table” located in the data directory. Each amino acid is
extracted by subsetting the codon_table using the codons. After this,
the resulting character vector is converted into a single string using
`paste0`

#### Examples

``` r
# Example 1: Converting a single codon into the corresponding amino acid
codons_to_aas("AUG")
# returns "M"

#Example 2: Converting a list of codons into an amino acid sequence
codons_to_aas(c("AUG", "UUU", "CGA"))
# returns "MFR"
```

## 

## Function 5

### `plot_aa_frequency()`

The `plot_aa_frequency()` function visualizes the composition of a
protein or peptide sequence by plotting the frequency of each amino acid
as a bar chart. This provides a quick overview of amino acid
distribution, which can be useful for identifying compositional biases,
comparing protein sequences, or validating sequence processing steps.

#### Usage

``` r
plot_aa_frequency("sequence")
```

#### **Arguments**

- sequence: A character string representing an amino acid sequence
  composed of single-letter amino acid codes (e.g.,
  `"ACDEFGHIKLMNPQRSTVWY"`).

#### **Value**

A `ggplot2` bar plot showing the count of each amino acid in the
provided sequence. Each bar corresponds to a unique amino acid, with
height proportional to its frequency in the sequence.

#### **Details**

Internally, the function splits the input sequence into individual amino
acids, counts their occurrences using `stringr::str_count()`, and
constructs a frequency table. The result is rendered as a bar plot using
`ggplot2` with a `theme_bw()` style. Amino acids are colored distinctly,
but the legend is suppressed for visual clarity.

#### **Examples**

``` r
# Example 1: Standard short amino acid sequence
plot_aa_frequency("ACDEFGHIKLMNPQRSTVWY")

# Example 2: Longer protein sequence (HLA-A*0101)
plot_aa_frequency("MAVMAPRTLLLLLSGALALTQTWAGSHSMRYFFTSVSRPGRGEPRFIAVGYVDDTQFVRFDSDAASQRMEPRAPWIEQEGPEYWDQETRNVKAQSQTDRVDLGTLRGYYNQSEAGSHTIQIMYGCDVGSDGRFLRGYRQDAYDGKDYIALNEDLRSWTAADMAAQITKRKWEAAHEAEQLRAYLDGTCVEWLRRYLENGKETLQRTDPPKTHMTHHPISDHEATLRCWALGFYPAEITLTWQRDGEDQTQDTELVETRPAGDGTFQKWAAVVVPSGEEQRYTCHVQHEGLPKPLTLRWELSSQPTIPIVGIIAGLVLLGAVITGAVVAAVMWRRKSSDRKGGSYTQAASSDSAQGSDVSLTACKV")
```

# Use cases and functions to include

The use of all functions provides a complete workflow following the
central dogma of molecular biology.

It allows users to generate random DNA sequences, transcribe them into
RNA, extract codons, translate the codons into amino acids, and
visualize the resulting amino acid composition. Together, these steps
illustrate the key processes of gene expression.

### Use cases

- Quick demonstrations: Users can quickly generate sequences and
  visualize amino acid frequencies without needing large external
  datasets or complex bioinformatics tools.

- Pipeline integration: The functions can be chained together to form a
  full transcription–translation pipeline. An examples of this can be
  seen underneath.

  ``` r
  dna    <- generate_dna_sequence(30)
  rna    <- dna_to_rna(dna)
  codons <- extract_codons(rna)
  aas    <- codons_to_aas(codons)
  plot_aa_frequency(paste(aas, collapse = ""))
  ```

- Education: The functions would work well as an educational tool for
  students new in the biology world as it clearly visualizes each
  important step of the central dogma with room for full immersion.

- Testing and prototyping: the functions could also serve as a simple
  tool to test new packages in the same field as the functions are
  clearly split into the individual steps and therefore easy to use and
  test the output of different steps.

### Functions to include in the future

To make the package more comprehensive, the following additions could be
useful:

- A function checking that a sequence contains only valid nucleotide
  letters.

- A function that return the reverse complement of a DNA strand.

### Main points from Task 3 discussion

#### Function overview

Each group member implemented one biological step: Generating DNA
(`generate_dna_sequence`), transcribing it (`dna_to_rna`), extracting
codons (`extract_codons`), translating codons(`codons_to_aas`), and
visualizing results (`plot_aa_frequency`).

#### Dependencies:

`ggplot2` and `stringr` were added as dependencies for plotting and
string handling. These were listed under “Imports” in the `DESCRIPTION`
file. Minimizing dependencies reduces installation time and possible
conflicts. However, it is sometimes unavoidable for visualization or
specialized functions.

#### **Namespace and imports:**

Using `pkg::function()` keeps the code explicit and avoids namespace
clutter.

#### Testing:

Each function has its own unit tests using `testthat` to ensure that
future edits do not break existing functionality. This makes the package
more stable and reproducible.

#### Collaboration workflow:

All group members worked on separate Git branches, where merging into
the main branch was done after testing. This kept development organized
and avoided version conflicts.
