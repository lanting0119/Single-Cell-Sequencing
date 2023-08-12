library(Seurat)

NML_I = Read10X(data.dir = '/Users/lanting/programms/Single Cell Sequencing/data/GSE132771_RAW/NML1')
NML_II = Read10X(data.dir = '/Users/lanting/programms/Single Cell Sequencing/data/GSE132771_RAW/NML2')
NML_III = Read10X(data.dir = '/Users/lanting/programms/Single Cell Sequencing/data/GSE132771_RAW/NML3')

library(tidyverse)

NML_I = CreateSeuratObject(counts = NML_I, project = 'NML_I', min.cells = 3, min.features = 200)
class(NML_I) 

NML_II = CreateSeuratObject(counts = NML_II, project = 'NML_II', min.cells = 3, min.features = 200)
NML_III = CreateSeuratObject(counts = NML_III, project = 'NML_III', min.cells = 3, min.features = 200)

NML_I
colnames(NML_I[])
rownames(NML_I)
View(NML_I)
View(NML_I@meta.data)

saveRDS(NML_I,file='NML_I.RDS')
saveRDS(NML_II,file='NML_II.RDS')
saveRDS(NML_III,file='NML_III.RDS')


NML_I = readRDS('NML_I.RDS')
NML_II = readRDS('NML_II.RDS')
NML_III = readRDS('NML_III.RDS') 

View(NML_I@meta.data)
ls()[1:3]

# 单纯将3组数据合并一起，先合并再在细胞barcode前添加组名
MergedNML = merge(NML_I, y = c(NML_II,NML_III),add.cell.ids = ls()[1:3],project = 'MergedNML')

View((MergedNML@meta.data)) 
NML_I
NML_II
NML_III

saveRDS(MergedNML,file = 'MergedNML.RDS')
