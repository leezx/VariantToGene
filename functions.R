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
get_eGene() <- function() {
  # do something
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
