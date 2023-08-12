MergedNML = readRDS('MergedNML.RDS')

View(MergedNML)
View(MergedNML@meta.data)

range(MergedNML$nFeature_RNA)
range(MergedNML$nCount_RNA)

MergedNML = PercentageFeatureSet(MergedNML,pattern= '^MT-',col.name = 'percent.mt')
view(MergedNML) # view(MergedNML@meta.data)效果相同
range(MergedNML$percent.mt)


VlnPlot(MergedNML,features = c('nFeature_RNA','nCount_RNA','percent.mt'),ncol = 3)
MergedNML = subset(MergedNML,subset = nFeature_RNA>500 & nFeature_RNA<4000 & nCount_RNA<20000 & percent.mt<10)
View(MergedNML@meta.data)
range(MergedNML$percent.mt)
VlnPlot(MergedNML,features = c('nFeature_RNA','nCount_RNA','percent.mt'),ncol = 3)

saveRDS(MergedNML,file = 'MergedNML_QC')
