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
### head 
head(df)
# graphique - croisement 2à2
pairs(df[,c(1,2,5)])

dft <- df[,-c(1:9,11,12,21:32,43:47,54:68,74,86,88,123,124,136:138)]

## try to get only numeric df

nums <- unlist(lapply(dft, is.numeric))  
dfNum <- dft[,nums]
dfNum.cr <- scale(dfNum, center = T, scale = T)
d.dfNum <- dist(dfNum.cr)
cah.ward <- hclust(d.dfNum, method = "ward.D2")
plot(cah.ward)

#dendrogramme avec matérialisation des groupes
rect.hclust(cah.ward,k=4)
#découpage en 4 groupes
groupes.cah <- cutree(cah.ward,k=4)
#liste des groupes
print(sort(groupes.cah))


### Il faut faire du supevisé lol
#k-means

gk-means <- kmeans(dfNum.cr, centers=4, nstart = 5)

""
## Question à enlever : 1/2/3/(4)/5/6/(7)/8/9/(11)/12//21/(22)/[23-27]/[28-32]/[43-47]/[54-58]/[59-63]/([64-68])/74/86/88/(123)/(124)/136/137/138


