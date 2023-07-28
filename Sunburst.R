# Create dataset

library(tidyverse)

data <- data.frame(
            individual = paste("species", seq(1,40), sep=""),
            group =c(rep("A",10),rep("B",10),rep("C",10),rep("D",10)),
            value = sample( seq(10,100), 40, replace= T)
)


# Arrange in order

data = data %>% arrange(group, value)

# Retrive name and y position of each label

data$id <- seq(1, nrow(data))
sample_number <- nrow(data)
angle <- 90 -360 * (data$id-0.5)/sample_number
data$hjust <- ifelse(angle < -90, angle+180, angle)

# Create the plot

# Set bar colors

group.colours <- c(A="#368F8B", B="#160F29", C="#DDBEA8", D="#FF6666")
group.colours2 <- c(A="#002642", B="#840032", C="#E59500", D="#E5DADA")

plotsun <- ggplot(data, aes(x=as.factor(id), y=value, fill=group)) +
            geom_bar(stat = "identify", alpha=1) +
            scale_fill_manual(value=group.colours2) +
            ylim(-100,145) +
            theme(
              legends.position ="none",
              axis.text = element_blank(),
              axis.title = element_blank(),
              plot.margin = unit(rep(-0.35,10),"cm")
         ) +
         coord_polar() +
         geom_text(data=data, aes(x = id, y=value+10, label=individual,
                                  hjust=hjust), color="black", fontface="bold",
                   alpha= 0.6, size=2.5, angle=data$angle, inherit.aes = FALSE)

plotsun


