# Treemap

library(treemap)

# Create data

group <- c("group-1","group-2","group-3")
value <- c(13,5,22)

data <- data.frame(group,value)

# treemap

treemap(data,
        index = c("group","subgroup"),
        vSize = "value",
        type = "index",
        fontsize.labels = c(15,12),
        fontcolor.labels = c("white","orange"),
        fontface.labels = c(2,1),
        bg.labels = c("transparent"),
        align.labels = list(
              c("center","center"),
              c("right","bottom")
        ),
        inflate.labels = F,
        border.col = c("black","white"),
        border.lwds = c(7,2),
        title = "My TreeMap",
        fontsize.title = 18,
        palette = "Set1"
)

        
