if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("densvis")

library("densvis")


#GSE152075

gse_075 <- read.csv('GSE152075_raw_counts_GEO.csv')
rownames(gse_075) <- gse_075$X


densne_075 <- densne(gse_075[,-1],perplexity = 25)
debsmap_075 <- densmap(gse_075[,-1], n_neighbors = 30)

# GSE163151
gse_151 <- read.csv('GSE163151_coivd_control.csv')
rownames(gse_151) <- gse_151$X

densne_151 <- densne(gse_151[,-1],perplexity = 25)
debsmap_151 <- densmap(gse_151[,-1], n_neighbors = 15)



# GSE157103
gse_103 <- read.csv('GSE157103_gene_expression_tpm.csv')
rownames(gse_103) <- gse_103$X

densne_103 <- densne(gse_103[,-1],perplexity = 25)
debsmap_103 <- densmap(gse_103[,-1], n_neighbors = 15)


#E-MTAB-9221
emtab <- read.csv('E-MTAB-9221.aggregated_filtered_normalised_counts.csv')
rownamse(emtab) <- emtab$X


densne_emtab <- densne(emtab[,-1],perplexity = 25)
densmap_emtab <- densmap(emtab[,-1], n_neighbors = 15)



