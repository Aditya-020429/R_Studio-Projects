dataset = read.csv("movies.csv")
movie<-read.csv("movies.csv")
View(movie)
library(ggplot2)

ggplot(movie,aes(x=name,y=rating))+
  geom_point()

ggplot(movie,aes(x=name,y=rating,))+
  geom_line()

ggplot(movie,aes(x=name,y=rating))+
  geom_boxplot()