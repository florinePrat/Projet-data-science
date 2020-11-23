# Title     : Projet data science
# Objective : TODO
# Created by: Florine | Timi | Axel
# Created on: 23/11/2020

## Add librairy to read dataframe
library("readxl")
## Reading dataframe
df <- read_excel("BDD brute Confinement.xlsx", col_names = TRUE)
## Delete the first unused column
df = df[, -1]
## Get the stucture of dataframe
str(dataframe2roueBrute)
## Get the summary of dataframe
summary(dataframe2roueBrute)