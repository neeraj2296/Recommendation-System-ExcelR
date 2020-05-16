#Including the necassary libraries
library("recommenderlab")
library(caTools)

#Loading the dataset
book_rt <- read.csv(file.choose())
book_rt<-book_rt[,2:4]
str(book_rt)

#Visualising the data set
hist(book_rt$Book.Rating)

#Converting the data into a matrix
rt_matrix = as(book_rt, 'realRatingMatrix')

#Applying the recommender function to find out which are the popular ones
recomodel1 <- Recommender(rt_matrix, method = "popular")
recom_items <- predict(recomodel1,rt_matrix[1],n=5)
as(recom_items,"list")

#Applying the recommender function to find out which are the ones preferred by the user.
recomedl2 <- Recommender(rt_matrix, method = "UBCF")
recom_items2 <-predict(recomedl2,rt_matrix[1],n=5)
as(recom_items2,"list")
