# Title     : Projet data science
# Objective : TODO
# Created by: Florine | Timi | Axel
# Created on: 23/11/2020


##### test with CSV

dfCsv <- read.csv2("BddBruteConfinement.csv", header = TRUE)
## Get the stucture of dataframe
str(dfCsv)
## Get the summary of dataframe
summary(dfCsv)