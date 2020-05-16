library("recommenderlab")
library(caTools)

book_rt <- read.csv(file.choose())
book_rt<-book_rt[,2:4]

str(book_rt)

hist(book_rt$Book.Rating)

rt_matrix = as(book_rt, 'realRatingMatrix')

recomodel1 <- Recommender(rt_matrix, method = "popular")
recom_items <- predict(recomodel1,rt_matrix[1],n=5)
as(recom_items,"list")

recomedl2 <- Recommender(rt_matrix, method = "UBCF")
recom_items2 <-predict(recomedl2,rt_matrix[1],n=5)
as(recom_items2,"list")
