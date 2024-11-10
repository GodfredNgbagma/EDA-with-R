#loading necessary packages

library(tidyverse)
library(readr)
library(dplyr)

# absentees data set
data_set <- X10_2021PHC_CSV
view(data_set) 

#getting count of observations and variables
dim(data_set)

#Identifying all variables with missing data
colSums(is.na(data_set))
colnames(is.na(data_set))

#Computing the type of variables
sapply(data_set, class)

#number of male and female by region 
sub_set <- data_set %>%
  group_by(region, a12d) %>%
  summarise(number = n(), .groups = 'drop') %>% 
  pivot_wider(names_from = a12d, values_from = number, values_fill = 0) 
view(sub_set)

#number of male and female by sector of employment

num_byEmployment <- absentees %>%
  group_by(region, a12d) %>%
  summarise(number = n(), .groups = 'drop') %>% 
  pivot_wider(names_from = a12d, values_from = number, values_fill = 0)