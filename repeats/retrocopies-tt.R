# Load required libraries
library(karyoploteR)
library(GenomicRanges)

# 1. Load genome file (handles space- or tab-separated)
genome_df <- read.table("/Users/mu2/sloth/plot-tests/mTamTet1_chr.txt",
                        header = TRUE, stringsAsFactors = FALSE, sep = "")

# 2. Convert to GRanges (default order: chr 1 on top)
custom.genome <- makeGRangesFromDataFrame(genome_df,
                                          seqnames.field = "chr",
                                          start.field = "start",
                                          end.field = "end")
# (no sorting — keep chr 1 at top)

# 3. Load retrocopy coordinates
retrocopies_df <- read.table("/Users/mu2/sloth/plot-tests/TT-retros.txt", 
                             sep = "\t", header = TRUE, stringsAsFactors = FALSE)

retrocopies <- makeGRangesFromDataFrame(retrocopies_df,
                                        keep.extra.columns = TRUE,
                                        seqnames.field = "chr",
                                        start.field = "start",
                                        end.field = "end")

# 4. Define chromosome label mapping (CM043327.1 to CM043354.1 → chr 1–26, X, Y)
chr_map <- setNames(paste0("chr ", c(1:26, "X", "Y")),
                    c(paste0("CM0433", 27:52, ".1"), "CM043353.1", "CM043354.1"))

# 5. Adjust plot margins to prevent label clipping
pp <- getDefaultPlotParams(plot.type = 1)
pp$leftmargin <- 0.15

# 6. Plot on screen in RStudio
kp <- plotKaryotype(genome = custom.genome,
                    cytobands = NULL,
                    chromosomes = "all",
                    plot.type = 1,
                    labels.plotter = NULL,
                    plot.params = pp)

# 7. Plot retrocopy density (blue)
kpPlotDensity(kp,
              data = retrocopies,
              data.panel = 1,
              col = "#0077CC",  # blue
              window.size = 1000000,
              border = NA)

# 8. Add clean chromosome labels
kpAddChromosomeNames(kp,
                     chr.names = chr_map[as.character(kp$chromosomes)],
                     cex = 0.7)
