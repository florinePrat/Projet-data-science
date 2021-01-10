# Title     : Projet data science
# Objective : TODO
# Created by: Florine | Timi | Axel
# Created on: 23/11/2020


##### test with CSV

df <- read.csv2("df_Colonnes_Impactantes2.csv", header = TRUE, encoding = 'UTF-8')
## Get the stucture of dataframe
df$change2rm <- as.logical(df$change2rm)
str(df)
## Get the summary of dataframe
summary(df)
### head 
head(df)
attach(df)

plot(df$Tranche_âge)


tab <- table(df$Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.., df$X.U.FEFF.Situation.familiale)
cprop(tab)

tab2 <- table(df$change2rm, df$CSP.du.membre)
tab2
cprop(tab2)
barplot(cprop(tab, total = FALSE),main = "Changement de 2rm en fonction de la CSP")





ggplot(data = df) + geom_bar(aes(x=CSP.du.membre, y=change2rm, fill=change),position="fill", stat='identity') +theme_bw()



weight_plot <- ggplot(data=df, mapping= aes(x=Age.du.membre)) +
  ggtitle("Histogram of weight population", "By gender") +
  geom_histogram(mapping= aes(color=Aviez.vous.l.intention.de.changer.de.2.roues.motorisé.en.2020.., fill= Aviez.vous.l.intention.de.changer.de.2.roues.motorisé.en.2020..), alpha=0.6) +
  theme_bw()
    
    
weight_plot    
