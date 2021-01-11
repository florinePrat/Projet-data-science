# Title     : Projet data science
# Objective : TODO
# Created by: Florine | Timi | Axel
# Created on: 23/11/2020


##### test with CSV

dfGlobal <- read.csv2("C:/Users/Axel/Desktop/projetDS/Projet-data-science-main/BddBruteConfinement.csv", header = TRUE, encoding = 'UTF-8')

## Get the stucture of dataframe
str(df)
## Get the summary of dataframe
summary(df)
### head 
head(df)


## Question à enlever : 1/2/3/(4)/5/6/(7)/8/9/(11)/12//21/(22)/[23-27]/[28-32]/[43-47]/[54-58]/[59-63]/([64-68])/74/86/88/(123)/(124)/136/137/138

library(FactoMineR)
library(missMDA)
dfColImpact<-read.csv2("C:/Users/Axel/Desktop/projetDS/df_Colonnes_Impactantes.csv", header = TRUE, encoding = 'UTF-8')
dfComplet <- imputeFAMD(dfColImpact,ncp=2)
res <- FAMD(dfColImpact,tab.disj=dfComplet$tab.disj)


#AFC pour savoir quelles sont les colonnes qui impactent le plus la 
#tableauKhiTotal[i] contient le retour du test du khi 2 entre la classe et la colonne i
dfQuali<-read.csv2("C:/Users/Axel/Desktop/projetDS/df_Qualitatives.csv", header = TRUE, encoding = 'UTF-8', check.names = FALSE)

classe<-dfQuali[,1]
tableauKhiTotal <- c()
tableauContingence <- c()
for (i in 2:ncol(dfQuali)) {
  tableauContingence[[i-1]]<-table(classe,dfQuali[,i])
  tableauKhiTotal[[i-1]]<-chisq.test(tableauContingence[[i-1]])
}

#On affiche le numéro et le nom des colonnes dont le test du chi 2 renvoie une p value < 5%
for(i in 1:70){
  if(tableauKhiTotal[[i]][["p.value"]]<0.05){
   print(paste(i,paste(colnames(dfQuali[i+1]),tableauKhiTotal[[i]][["p.value"]],sep=" ; p-value : " ),sep=". "))
  }
}


res<-CA(tableauContingence[[32]])
plot(res)

