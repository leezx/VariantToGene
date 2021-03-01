# VariantToGene
Genomic predictors and Annotation predictors

[Genomic predictors | variant to gene | 变异的基因注释](https://www.cnblogs.com/leezx/p/14464087.html)

本仓库为以上教程的代码实现

![](https://img2020.cnblogs.com/blog/785692/202103/785692-20210301154201773-667409110.png)

general input: a dataframe, rowname is SNP rsid, rsid column is rsid

general output: add annotation to the columns one by one, like nGene, eGene and cGene

# Genomic predictors
- get_nGene(), Nearby (nGene)
- get_eGene(), eQTL (eGene)
- get_cGene(), Conformation (cGene)

# Annotation predictors
- get_fGene(), Function (fGene)
- get_pGene(), Phenotype (pGene)
- get_dGene(), Disease (dGene)

# Other functions
- extend_LD(), get all high LD (R2>0.8) SNPs

# get_nGene
input:
- rsid df, a dataframe, rowname is SNP rsid, rsid column is rsid

data preparation:
- go to VEP website: https://asia.ensembl.org/Tools/VEP
- get the VEP annotation result, example: VEP/all.reported.snp.LD.merged_VEP.txt

function pipeline:
- simplify columns
- rename categories from VEP
- remove duplicate according to priority

output:
- unique function annotation of each SNP - a dataframe
- nGene_type: Splicing
- nGene: MYSM1
- nGene_biotype: protein_coding

# get_eGene
input:
- rsid df, a dataframe, rowname is SNP rsid, rsid column is rsid

data preparation:
- go to eQTLGen download eQTL data: https://www.eqtlgen.org/cis-eqtls.html

function pipeline:
- simply match rsid to multiple genes

output:
- eGene: geneA,geneB

# get_cGene
input:
- rsid df, a dataframe, rowname is SNP rsid, rsid column is rsid

# extend_LD
input:
- rsid, example: unique(asso.df$SNPS)

function pipeline:
- library("LDlinkR")
- LDproxy()

output:
- all high LD SNPs - a dataframe

