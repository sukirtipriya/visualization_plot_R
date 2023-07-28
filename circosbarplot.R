
library(ggplot2)

# create data 

name = letters[1:26]
score = sample(10:100,26)
df=data.frame(name,score)
df

ggplot(df, aes(x=reorder(name,score), y=score, fill=name))+
    geom_bar(stat ="identity")+
    theme(legend.position ="none")+
    ylim(-50,100)+
    coord_polar(start=0)
