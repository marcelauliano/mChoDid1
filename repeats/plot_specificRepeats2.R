gff.file <-("/Users/mu2/sloth/1processed_chromos-all_repeats.gff")
header.lines <- readLines(gff.file, n = 35)
ll <- header.lines[grepl(header.lines, pattern = "##sequence-region")]
gg <- data.frame(do.call(rbind, strsplit(ll, split = " ")))
gg[,3] <- as.numeric(as.character(gg[,3]))
gg[,4] <- as.numeric(as.character(gg[,4]))
PvP01.genome <- toGRanges(gg[,c(2,3,4)])
kp <- plotKaryotype(genome=PvP01.genome, main="Satellites", chromosomes=c("NC_051307.1","NC_051308.1","NC_051309.1","NC_051310.1","NC_051311.1","NC_051312.1","NC_051313.1","NC_051314.1","NC_051315.1","NC_051316.1","NC_051319.1","NC_051317.1","NC_051318.1","NC_051320.1","NC_051321.1","NC_051322.1","NC_051323.1","NC_051324.1","NC_051325.1","NC_051326.1","NC_051327.1","NC_051328.1","NC_051329.1","NC_051330.1","NC_051331.1","NC_051332.1","NC_051333.1","NC_051334.1","NC_051335.1"))

 
library(rtracklayer)
features <- import(gff.file)
allreps <- features[features$type=="LINE/L1"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col="11")
