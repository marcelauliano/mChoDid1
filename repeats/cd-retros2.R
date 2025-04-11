# Load libraries
library(karyoploteR)
library(GenomicRanges)

# Load genome
genome_sloth_df <- read.table("/Users/mu2/sloth/plot-tests/cd-chr.txt",
                               header = TRUE, sep = "", stringsAsFactors = FALSE)

custom.genome.sloth <- makeGRangesFromDataFrame(genome_sloth_df,
                                                seqnames.field = "chr",
                                                start.field = "start",
                                                end.field = "end")

# Load retrocopies
retrocopies_sloth_df <- read.table("/Users/mu2/sloth/plot-tests/cd_retros_only.txt",
                                   sep = "\t", header = TRUE, stringsAsFactors = FALSE)

retrocopies.sloth <- makeGRangesFromDataFrame(retrocopies_sloth_df,
                                              keep.extra.columns = TRUE,
                                              seqnames.field = "chr",
                                              start.field = "start",
                                              end.field = "end")

# Chromosome labels
chr_map_sloth <- c(
  "NC_051307.1" = "chr 1",  "NC_051308.1" = "chr 2",  "NC_051309.1" = "chr 3",
  "NC_051310.1" = "chr 4",  "NC_051311.1" = "chr 5",  "NC_051312.1" = "chr 6",
  "NC_051313.1" = "chr 7",  "NC_051314.1" = "chr 8",  "NC_051315.1" = "chr 9",
  "NC_051316.1" = "chr 10", "NC_051317.1" = "chr 11", "NC_051318.1" = "chr 12",
  "NC_051319.1" = "chr 13", "NC_051320.1" = "chr 14", "NC_051321.1" = "chr 15",
  "NC_051322.1" = "chr 16", "NC_051323.1" = "chr 17", "NC_051324.1" = "chr 18",
  "NC_051325.1" = "chr 19", "NC_051326.1" = "chr 20", "NC_051327.1" = "chr 21",
  "NC_051328.1" = "chr 22", "NC_051329.1" = "chr 23", "NC_051330.1" = "chr 24",
  "NC_051331.1" = "chr 25", "NC_051332.1" = "chr 26", "NC_051333.1" = "chr 27",
  "NC_051334.1" = "chr X",  "NC_051335.1" = "chr Y"
)

# Set plot parameters
pp <- getDefaultPlotParams(plot.type = 1)
pp$leftmargin <- 0.15

# Start PDF
pdf("/Users/mu2/sloth/plot-tests/sloth_retrocopies_export.pdf", width = 7, height = 10)

# Plot
kp1 <- plotKaryotype(genome = custom.genome.sloth,
                     cytobands = NULL,
                     chromosomes = "all",
                     plot.type = 1,
                     labels.plotter = NULL,
                     plot.params = pp)

kpPlotDensity(kp1,
              data = retrocopies.sloth,
              data.panel = 1,
              col = "#FF6666",  # light red
              window.size = 500000,
              border = NA)

kpAddChromosomeNames(kp1,
                     chr.names = chr_map_sloth[as.character(kp1$chromosomes)],
                     cex = 0.7)

title(main = "Sloth Retrocopy Density")

# Close PDF
dev.off()
