library(ggplot2)
library(dplyr)
library(magrittr)
library(tidyr)
library(ggplot2) #for plotting
library(forcats) #for plotting

#Toy data.frame
mydat <- structure(list(GO_term = structure(c(2L, 4L, 3L, 1L, 4L), 
                                            .Label = c("Kinase", "Metabolism", "Nucleus", "Photosynthesis"), 
                                            class = "factor"), 
                        Number = c(5, 10, 15, 16, 20), 
                        Class = structure(c(3L, 2L, 1L, 1L, 2L),
                                          .Label = c("hs", "hzs", "start_duf"), class = "factor"), 
                        Type = structure(c(1L, 1L, 2L, 3L, 1L), 
                                         .Label = c("BP", "CC", "MF"), 
                                         class = "factor")), 
                   class = "data.frame", row.names = c(NA, 5L))




#First we group by Type and GO_term, and assign a "yes" to the first row
#and "no" to every other row of the grouping
mydat %<>% 
  group_by(Type, GO_term) %>%
  mutate(typefill = if_else(row_number() == 1, "yes", "no")) %>%
  ungroup()
#Then in the whole data.frame, typefill = "yes" will be replaced by the Type value
#from that row, and typefill = "no" will be replaced with NA
mydat %<>% mutate(typefill = ifelse(typefill == "yes", as.character(Type), NA))


#Plotting, now pass typefill to geom_tile's fill parameter instead of Type
ggplot(mydat, aes(y = reorder(GO_term, as.numeric(Type)), x = Number, size = Number)) + geom_point(aes(color = Class), alpha = 1.0) + 
  geom_tile(aes(width = Inf, fill = typefill), alpha = 0.4) + 
  scale_fill_manual(values = c("green", "red", "blue"))
  
