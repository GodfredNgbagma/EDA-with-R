#loading necessary packages

library(tidyverse)
library(readr)
library(dplyr)
library(data.table)


# loading data set
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

#Number of male and female by  employment
data_set1 <- fread("defactopopn_10%_20221011d.csv", select = c("p17","a11d"), na.strings = c("","NA"))
data_set1 <- data_set1 %>% 
  rename("Sector of employment" = p17,"Gender" = a11d)
table(data_set1$`Sector of employment`,data_set1$Gender)

