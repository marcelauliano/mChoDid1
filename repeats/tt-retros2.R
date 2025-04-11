# Load libraries
library(karyoploteR)
library(GenomicRanges)

# Load Tamandua genome
genome_tam_df <- read.table("/Users/mu2/sloth/plot-tests/mTamTet1_chr.txt",
                             header = TRUE, sep = "", stringsAsFactors = FALSE)

custom.genome.tam <- makeGRangesFromDataFrame(genome_tam_df,
                                              seqnames.field = "chr",
                                              start.field = "start",
                                              end.field = "end")

# Load Tamandua retrocopies
retrocopies_tam_df <- read.table("/Users/mu2/sloth/plot-tests/TT-retros.txt",
                                 sep = "\t", header = TRUE, stringsAsFactors = FALSE)

retrocopies.tam <- makeGRangesFromDataFrame(retrocopies_tam_df,
                                            keep.extra.columns = TRUE,
                                            seqnames.field = "chr",
                                            start.field = "start",
                                            end.field = "end")

# Chromosome labels
chr_map_tam <- c(
  "CM043327.1" = "chr 1",  "CM043328.1" = "chr 2",  "CM043329.1" = "chr 3",
  "CM043330.1" = "chr 4",  "CM043331.1" = "chr 5",  "CM043332.1" = "chr 6",
  "CM043333.1" = "chr 7",  "CM043334.1" = "chr 8",  "CM043335.1" = "chr 9",
  "CM043336.1" = "chr 10", "CM043337.1" = "chr 11", "CM043338.1" = "chr 12",
  "CM043339.1" = "chr 13", "CM043340.1" = "chr 14", "CM043341.1" = "chr 15",
  "CM043342.1" = "chr 16", "CM043343.1" = "chr 17", "CM043344.1" = "chr 18",
  "CM043345.1" = "chr 19", "CM043346.1" = "chr 20", "CM043347.1" = "chr 21",
  "CM043348.1" = "chr 22", "CM043349.1" = "chr 23", "CM043350.1" = "chr 24",
  "CM043351.1" = "chr 25", "CM043352.1" = "chr 26",
  "CM043353.1" = "chr X",  "CM043354.1" = "chr Y"
)

# Plot parameters (same as Sloth)
pp <- getDefaultPlotParams(plot.type = 1)
pp$leftmargin <- 0.15

# Export to PDF (slightly shorter than Sloth)
pdf("/Users/mu2/sloth/plot-tests/tamandua_retrocopies_export.pdf", width = 7, height = 9)

# Plot
kp2 <- plotKaryotype(genome = custom.genome.tam,
                     cytobands = NULL,
                     chromosomes = "all",
                     plot.type = 1,
                     labels.plotter = NULL,
                     plot.params = pp)

kpPlotDensity(kp2,
              data = retrocopies.tam,
              data.panel = 1,
              col = "#0077CC",  # blue
              window.size = 500000,
              border = NA)

kpAddChromosomeNames(kp2,
                     chr.names = chr_map_tam[as.character(kp2$chromosomes)],
                     cex = 0.7)

# Close PDF
dev.off()
