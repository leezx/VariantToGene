# VariantToGene
Genomic predictors and Annotation predictors

[Genomic predictors | variant to gene | 变异的基因注释](https://www.cnblogs.com/leezx/p/14464087.html)

本仓库为以上教程的代码实现

![](https://img2020.cnblogs.com/blog/785692/202103/785692-20210301154201773-667409110.png)

# Genomic predictors
- get_nGene(), Nearby (nGene)
- get_eGene(), eQTL (eGene)
- get_cGene(), Conformation (cGene)

# Annotation predictors
- get_fGene(), Function (fGene)
- get_pGene(), Phenotype (pGene)
- get_dGene(), Disease (dGene)

# other functions
- extend_LD(), get all high LD (R2>0.8) SNPs

# get_nGene
input:
- rsid, example: all.reported.snp.LD.merged.txt

data preparation:
- go to VEP website: https://asia.ensembl.org/Tools/VEP
- get the VEP annotation result, example: VEP/all.reported.snp.LD.merged_VEP.txt

function pipeline
- simplify columns
- rename categories from VEP
- remove duplicate according to priority

