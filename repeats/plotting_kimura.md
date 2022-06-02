## 1. Run repeatmasker.

```
RepeatMasker -a -xsmall -gccalc -lib both.fa assembly.fa -dir output
```

## 2. Run calcDivergenceFromAlign.pl

```
perl calcDivergenceFromAlign.pl -s sumary assembly.align
```

## 3. Get last 72 lines of the sumary file

tail -n 72 sumary > plot.txt

### 4. Plot with R code from Kristina Gagalova(https://github.com/KristinaGagalova) 


```
#############################
###Plot Kimura distance######
#############################

library(reshape)
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(tidyverse)
library(gridExtra)

sessionInfo()
#R version 3.6.1 (2019-07-05)
#Platform: x86_64-conda_cos6-linux-gnu (64-bit)
#Running under: Ubuntu 20.04.1 LTS

#attached base packages:
#  [1] stats     graphics  grDevices utils     datasets  methods   base     
#other attached packages:
#  [1] gridExtra_2.3     forcats_0.5.0     stringr_1.4.0     dplyr_0.8.5       purrr_0.3.4      
#  [6] readr_1.3.1       tidyr_1.1.0       tibble_3.0.1      tidyverse_1.3.0   hrbrthemes_0.8.0 
#  [11] viridis_0.5.1     viridisLite_0.3.0 ggplot2_3.3.0     reshape_0.8.8    

KimuraDistance <- read.csv("/path/to/the/tbl/file",sep=" ")

#add here the genome size in bp
genomes_size=230000000

kd_melt = melt(KimuraDistance,id="Div")
kd_melt$norm = kd_melt$value/genomes_size * 100

ggplot(kd_melt, aes(fill=variable, y=norm, x=Div)) + 
  geom_bar(position="stack", stat="identity",color="black") +
  scale_fill_viridis(discrete = T) +
  theme_classic() +
  xlab("Kimura substitution level") +
  ylab("Percent of the genome") + 
  labs(fill = "") +
  coord_cartesian(xlim = c(0, 55)) +
  theme(axis.text=element_text(size=11),axis.title =element_text(size=12))
  ```

