# calculate genotype probabilities
library(qtl2)
library(qtl2fst)
do <- readRDS("Data/attieDO_v1.rds")
gmap <- readRDS("Data/attieDO_gmap.rds")
pr <- calc_genoprob(do, gmap, 0.002, "c-f", cores=0)
pr_fst <- fst_genoprob(pr, "attieDO_v1_pr_fst", "Data/GenoprobsFST", overwrite=TRUE)
file.rename("Data/GenoprobsFST/attieDO_v1_pr_fst_fstindex.rds",
            "Data/GenoprobsFST/attieDO_v1_pr_fst.rds")
