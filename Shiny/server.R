

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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    data(Glass)
    
    Glass.reshaped <- reshape2::melt(Glass[,6:10], id.vars="Type")
    
    google <- rownames_to_column(data.frame(getSymbols("GOOG", auto.assign = FALSE)))
    facebook <- rownames_to_column(data.frame(getSymbols("FB", auto.assign = FALSE)))
    twitter <- rownames_to_column(data.frame(getSymbols("TWTR", auto.assign = FALSE)))
    amazon <- rownames_to_column(data.frame(getSymbols("AMZN", auto.assign = FALSE)))
    apple <- rownames_to_column(data.frame(getSymbols("AAPL", auto.assign = FALSE)))
    df_ts <- bind_rows(google, facebook, amazon, apple, twitter)

    df_ts <- df_ts %>% gather(measure, value, -rowname, na.rm=TRUE) %>%
        separate(measure, into=c("symbol", "measure"), sep="\\.") %>%
        spread(measure,value) %>%
        rename(date = rowname) %>%
        mutate(date = ymd(date)) %>%
        filter(date >= "2018-10-09") %>%
        group_by(symbol) %>%
        arrange(date) %>%
        mutate(growth = Adjusted - first(Adjusted), growth_percent = (Adjusted - first(Adjusted))/first(Adjusted)*100) %>%
        mutate(base_price = Adjusted[date == "2018-10-09"], growth_from_base = Adjusted-base_price,growth_percent_from_base=growth_from_base/base_price*100)

    
    
    output$irisPlot <- renderPlot({
        
        if(!is.null(input$species)) {
            
            ggplot(data=subset(iris,Species %in% c(input$species)), aes(Sepal.Length, y=Sepal.Width, color=Species)) +
                geom_point(aes(shape = Species, color = Species), size =3) + stat_smooth(method = input$meth) +facet_grid(~Species,scale='free_y')+ ggtitle("Linear modeling of Sepal.width against Sepal.Length (IRIS) \n By Species")+ xlim(input$x) + ylim(input$y)+theme_bw()
        
        }

    })
    
    output$weightPlot <- renderPlot({

        if(!is.null(input$sexHist)) {

            wei <- filter(weight, sex %in% input$sexHist)
            

            cmean <- wei %>% group_by(sex) %>% summarise(mean = mean(weight))

            weight_plot <- ggplot(data= wei, mapping= aes(x=weight)) +
                ggtitle("Histogram of weight population", "By gender") +
                geom_histogram(mapping= aes(color=sex, fill= sex), alpha=0.2, position="identity", binwidth = 0.1) +
                theme_bw()

            if(input$meanHist) {
                weight_plot + geom_vline(data= cmean, mapping=aes(xintercept = mean, color = sex), linetype= "dashed", size = 1.5)
            }
            else {
                weight_plot
            }

        }

    })

    output$densityPlot <- renderPlot({

        if(!is.null(input$sexDensity)) {

            wei <- filter(weight, sex %in% input$sexDensity)

            cmean <- wei %>% group_by(sex) %>% summarise(mean = mean(weight))

            weight_plot <- ggplot(data= wei, mapping= aes(x=weight)) +
                ggtitle("Density of weight population", "By gender") +
                geom_density(mapping= aes(color=sex, fill= sex), alpha= 0.2) +
                theme_bw()

            if(input$meanDensity) {
                weight_plot + geom_vline(data= cmean, mapping=aes(xintercept = mean, color = sex), linetype= "dashed", size = 1.5)
            }
            else {
                weight_plot
            }

        }

    })

    output$glassPlot <- renderPlot({

        ggplot(data = Glass, aes(Type, Ca, color= Type)) +
            ggtitle("Calcium distribution inside observed glasses", "By type") +
            geom_boxplot() +
            theme_bw() 

    })

    output$glassPlot2 <- renderPlot({

        ggplot(data = Glass.reshaped, aes(Type, value, color= Type)) +
            ggtitle("Boxplots of glasses characteristics regarding their type", "By chimical components") +
            geom_boxplot() +
            facet_wrap(facets= vars(variable), scales= "free_y") +
            theme_bw() 

    })
    
    output$timeSeries <- renderPlot({

        if(!is.null(input$firms1)) {

            ggplot(data = subset(subset(df_ts, symbol %in% input$firms1)), mapping= aes(x= date, y= growth_percent, color = symbol)) +
            ggtitle("Evolution of growth", "By Symbol") +
            xlab("Date") +
            ylab("Growth (in %)") +
            geom_line() +
            theme_linedraw()

        }

    })

    output$adjustedTimeSeries <- renderPlot({

        if(!is.null(input$firms2)) {

            ggplot(data = subset(subset(df_ts, symbol %in% input$firms2), date > "2020-10-09"), mapping= aes(x= date, y= Adjusted, color = symbol)) +
            ggtitle("Evolution of the adjuted value", "By Symbol") +
            xlab("Date") +
            ylab("Growth") +
            geom_line() +
            geom_errorbar(mapping= aes(ymin= Low, ymax= High), width= 0.3) +
            theme_linedraw()

        }

    })
    

})
