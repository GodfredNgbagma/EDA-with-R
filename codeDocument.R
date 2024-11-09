#loading necessary packages

library(tidyverse)
library(readr)

# absentees data set
absentees <- absentees_10_20221011d
view(absentees) 

#getting count of observations and variables
dim(absentees)

#Identifying all variables with missing data
colSums(is.na(absentees))
colnames(is.na(absentees))

#Computing the type of variables
sapply(absentees, class)

#number of male and female by region 
head(absentees$a12)
select(absentees,region = unique(absentees$region))



