# Nearby (nGene)
get_nGene <- function(reported.snp.VEP, VEP.rename, VEP.order) {
    # print(load("get_nGene.testing.Rdata"))
    # reported.snp.VEP2 <- get_nGene(reported.snp.VEP, VEP.rename, VEP.order)
    #
    # result from the VEP website
    # reported.snp.VEP <- read.table("all.reported.snp.LD.merged_VEP.txt", header = F)

    # V1 = SNP name
    # V4 = raw type
    # V6 = gene
    # V10 = biotype

    # simplify columns
    reported.snp.VEP <- reported.snp.VEP[,c("V1","V4","V6","V10")]

    # 第一列：计算时的优先级；第二列：legend的顺序
    # print(load("VEP.rename.order.index.Rdata"))

    # rename
    reported.snp.VEP$rename <- plyr::mapvalues(reported.snp.VEP$V4, from = rownames(VEP.rename), to = VEP.rename$Rename)

    # 每个VEP的结果里只留下优先级最高的那一个【第一次去冗余】
    # sort and remove duplicate
    reported.snp.VEP$rename <- factor(reported.snp.VEP$rename, levels = VEP.order$V2)
    reported.snp.VEP <- reported.snp.VEP[order(reported.snp.VEP$rename, decreasing = F),]
    reported.snp.VEP <- reported.snp.VEP[!duplicated(reported.snp.VEP$V1),]

    # set rowname
    rownames(reported.snp.VEP) <- reported.snp.VEP$V1

    # sort(table(reported.snp.VEP$rename), decreasing = T)
    # Intronic            Others Regulatory Region               UTR 
    #            112167             81591             17770              5172 
    #     Nonsynonymous        Synonymous          Splicing        Frameshift 
    #              1386              1021               354                11 
    #     Nonframeshift 
    #                 9 
    reported.snp.VEP
}

# eQTL (eGene)
get_eGene <- function(input.df) {
    # prepare SNP to gene df
    # eqtl.df <- read.table("/Users/zxli/Dropbox/Projects/CPloci/eQTL/2019-12-11-cis-eQTLsFDR0.05-ProbeLevel-CohortInfoRemoved-BonferroniAdded.txt", header = T, stringsAsFactors = F)

    # # head(eqtl.df[,c("SNP","GeneSymbol")])

    # snp.gene.eQTLGen <- eqtl.df[,c("SNP","GeneSymbol")]
    # dim(snp.gene.eQTLGen)

    # snp.gene.eQTLGen <- snp.gene.eQTLGen[grep("^rs", snp.gene.eQTLGen$SNP),]
    # dim(snp.gene.eQTLGen)

    # # print(load("snp.gene.eQTLGen.Rdata"))

    # length(unique(snp.gene.eQTLGen$SNP))

    # # too slow
    # # snp.gene.eQTLGen.merged <- data.frame()
    # # for (i in unique(snp.gene.eQTLGen$SNP)) {
    # #     tmp <- subset(snp.gene.eQTLGen, SNP==i)
    # #     tmp.genes <- paste(tmp$GeneSymbol, collapse = ",")
    # #     tmp.df <- data.frame(rsid=i, gene=tmp.genes)
    # #     snp.gene.eQTLGen.merged <- rbind(snp.gene.eQTLGen.merged, tmp.df)
    # # }

    # dim(snp.gene.eQTLGen)
    # snp.gene.eQTLGen <- snp.gene.eQTLGen[!duplicated(snp.gene.eQTLGen),]
    # dim(snp.gene.eQTLGen)

    # # head(snp.gene.eQTLGen)

    # library(dplyr)

    # snp.gene.eQTLGen.merged <- snp.gene.eQTLGen %>% group_by(SNP) %>%
    #     summarize(genes = paste(GeneSymbol, collapse = ','))

    # rownames(snp.gene.eQTLGen.merged) <- snp.gene.eQTLGen.merged$SNP

    # snp.gene.eQTLGen.merged <- as.data.frame(snp.gene.eQTLGen.merged)

    # save(snp.gene.eQTLGen, snp.gene.eQTLGen.merged, file = "snp.gene.eQTLGen.Rdata")
    
    print(load("snp.gene.eQTLGen.Rdata"))
    input.df$eGene <- snp.gene.eQTLGen.merged[input.df$rsid,]
    # replace NA
    input.df[is.na(input.df$eGene),]$eGene <- "-"
    input.df
}

# Conformation (cGene)
get_cGene() <- function() {
  # do something
} 

# Function (fGene)
get_fGene() <- function() {
  # do something
}

# Phenotype (pGene)
get_pGene() <- function() {
  # do something
}

# Disease (dGene)
get_dGene() <- function() {
  # do something
}
