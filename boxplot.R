
data <- read.table("mydata.csv", header=TRUE, row.names = 1)
library(DESeq2)
mat <- as.matrix(data)
log <- rlog(mat)
boxplot(log)

##########################################################

data("ToothGrowth") 
library(ggplot2)

ggplot(ToothGrowth, aes(x = as.factor(dose), y = len)) + 
   geom_boxplot(aes(fill = supp), position = position_dodge(0.9)) +
   scale_fill_manual(values = c("#09E359", "#E31009")) + 
   theme_bw()
