# import package
library("ggplot2")

# create fake data
set.seed(1024) # keep reproducibility
go <- paste0("GO", sample(1000:2000, 5))
data <- data.frame("GOs" = rep(go, 2), 
                   "Condition" = rep(c("A", "B"), each = 5),
                   "GeneRatio" = 1 / sample(10, 10), 
                   "p.adjust" = 0.05 / sample(10, 10))

# plot: dot plot
ggplot(data = data, aes(x = Condition, y = GOs, 
                        color = `p.adjust`, size = GeneRatio)) + 
  geom_point() +
  scale_color_gradient(low = "red", high = "blue") +
  theme_bw() + 
  ylab("") + 
  xlab("") + 
  ggtitle("GO enrichment analysis")

