

library(shiny)
library(ggplot2)
library(dplyr)
library(MASS)
library(easyGgplot2)
library(mlbench)
library(quantmod)
library(tibble)
library(lubridate)
library(tidyr)
library(ggthemes)
library(ggmap)
library(maptools)
library(broom)
library(rgdal)
library(RColorBrewer)
library(shinyWidgets)
library(questionr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    df <- read.csv2("df_Colonnes_Impactantes2.csv", header = TRUE, encoding = 'UTF-8')
    
    
    output$irisPlot <- renderPlot({
        
        
        if(!is.null(input$changementCsp)) {
            
            cspDf <- filter(df, df$CSP.du.membre %in% c(input$changementCsp))
            
            tab <- table(cspDf$change2rm, cspDf$CSP.du.membre)
            cprop(tab)
            barplot(cprop(tab, total = FALSE, ),main = "Changement de 2rm en fonction de la CSP du membre", col = c("lightblue", "mistyrose"), legend = c('oui', 'non'), args.legend = list(x = "topright"))
            
            #ggplot(data = cspDf) + geom_bar(aes(x=CSP.du.membre, y=change2rm, fill=change2rm),position="stack", stat='identity') 
        }

    })
    
    output$familyPlot <- renderPlot({
        
        
        if(!is.null(input$changementFamily)) {
            
            familyDf <- filter(df, df$Situation.familiale %in% c(input$changementFamily), Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.. %in% c(input$changement2rm))
            
            tab <- table(familyDf$Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.., familyDf$Situation.familiale)
            cprop(tab)
            barplot(cprop(tab, total = FALSE, ),main = "Changement de 2rm en fonction de la situation familiale", col = c("lightblue", "mistyrose", "lightcyan",
                                                                                                                          "lavender", "cornsilk"), legend = c(input$changement2rm), args.legend = list(x = "topright"))
            
           #ggplot(data = newDf) + geom_bar(aes(x=X.U.FEFF.Situation.familiale, y=Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.., fill=Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020..),position="stack", stat='identity') 
        }
        
    })
    
    output$weightPlot <- renderPlot({

        if(!is.null(input$changementAge)) {
            
            
            ageDf <- filter(df, df$Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.. %in% c(input$changementAge))
            
            age_plot <- ggplot(data=ageDf, mapping= aes(x=Age.du.membre)) +
                ggtitle("Histograme de l age des membres", "Par reponses a la question : Aviez vous l intention de changer de 2rm en 2020") +
                geom_histogram(mapping= aes(colour=Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.., fill=Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020..), alpha=0.6) +
                theme_bw()
            
            
            age_plot  
            

        }

    })

    output$densityPlot <- renderPlot({
        if(!is.null(input$changementAgeDensity)) {
            
            
            ageDf <- filter(df, df$Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.. %in% c(input$changementAgeDensity))
            
            age_plot <- ggplot(data=ageDf, mapping= aes(x=Age.du.membre)) +
                ggtitle("Densite de l age des membres", "Par reponses a la question : Aviez vous l intention de changer de 2rm en 2020") +
                geom_density(mapping= aes(colour=Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020.., fill=Aviez.vous.l.intention.de.changer.de.2.roues.motorise.en.2020..), alpha=0.6) +
                theme_bw()
            
            
            age_plot  
            
            
        }

    })
    
    output$densityPlot2 <- renderPlot({
        if(!is.null(input$changementAgeDensity2)) {
            
            
            ageDf <- filter(df, df$change2rm %in% c(input$changementAgeDensity2))
            
            age_plot <- ggplot(data=ageDf, mapping= aes(x=Age.du.membre)) +
                ggtitle("Densite de l age des membres", "Par reponses simplifiee a la question : Aviez vous l intention de changer de 2rm en 2020") +
                geom_density(mapping= aes(colour=change2rm, fill=change2rm), alpha=0.6) +
                theme_bw()
            
            
            age_plot  
            
            
        }
        
    })

    

})
