# Title     : Projet data science
# Objective : TODO
# Created by: Florine | Timi | Axel
# Created on: 23/11/2020


##### test with CSV

df <- read.csv2("BddBruteConfinement.csv", header = TRUE, encoding = 'UTF-8')
## Get the stucture of dataframe
str(df)
## Get the summary of dataframe
summary(df)
