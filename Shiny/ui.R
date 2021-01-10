library(shiny)
library(shinythemes)
library(shinydashboard)

dashboardPage(skin = "green",
    dashboardHeader(title = "Visualisation"),
    dashboardSidebar(sidebarMenu(
        menuItem("Iris", tabName = "iris", icon = icon("spa")),
        menuItem(
            "Weight",
            tabName = "weight",
            icon = icon("weight"),
            menuSubItem(
                "Histograme",
                tabName = "weightH",
                icon = icon("chart-bar")
            ),
            menuSubItem("Density", tabName = "weightD", icon = icon("chart-area"))
        ),
        menuItem("Glass", tabName = "glass", icon = icon("glasses")),
        menuItem("Time series", tabName = "series", icon = icon("coins"))
    )),
    dashboardBody(tabItems(
        # First tab content
        tabItem(
            tabName = "iris",
            h2("Iris dataset with species controls"),
            fluidRow(
                box(
                    title = "Linear modeling..",
                    background = "green",
                    solidHeader = TRUE,
                    plotOutput("irisPlot", height = 500)
                )
            ),
            box(
                title = "Species inputs",
                width = 5,
                status = "success",
                solidHeader = TRUE,
                checkboxGroupInput(
                    "species",
                    "Species to show:",
                    c(
                        "Setosa" = "setosa",
                        "Versicolor" = "versicolor",
                        "Virginica" = "virginica"
                    ),
                    selected = c("setosa", "versicolor", "virginica")
                )
            ),
            box(
                title = "Methods inputs",
                solidHeader = TRUE,
                width = 5,
                status = "success",
                radioButtons("meth", "Smoothing method",
                             c("lm", "glm", "gam", "loess", "rlm"))
            ),
            
            box(
                title = "Sepal length inputs",
                width = 5,
                status = "success",
                solidHeader = TRUE,
                sliderInput(
                    "x",
                    "Sepal length range:",
                    min = 4,
                    max = 8,
                    value = c(4, 8)
                )
            ),
            box(
                title = "Sepal widht inputs",
                width = 5,
                status = "success",
                solidHeader = TRUE,
                sliderInput(
                    "y",
                    "Sepal width range:",
                    min = 2,
                    max = 4.5,
                    value = c(2, 4.5)
                )
            )
            
            
        ),
        
        # Second tab content
        tabItem(
            tabName = "weightH",
            h2("Weight dataset with sex controls"),
            fluidRow(
                box(
                    title = "Weight inputs",
                    width = 5,
                    status = "success",
                    background = "black",
                    checkboxGroupInput(
                        "sexHist",
                        "Genders to show :",
                        c("Male" = "Male",
                          "Female" = "Female"),
                        selected = c("Male", "Female")
                    ),
                    checkboxInput("meanHist",
                                  "Show mean",
                                  value = TRUE)
                    
                ),
                box(
                    title = "Histogram..",
                    background = "maroon",
                    solidHeader = TRUE,
                    plotOutput("weightPlot", height = "500px")
                )
            )
        ),
        # Theird tab content
        tabItem(
            tabName = "weightD",
            h2("Weight dataset with sex controls"),
            fluidRow(
                box(
                    title = "Weight inputs",
                    width = 5,
                    status = "success",
                    background = "black",
                    checkboxGroupInput(
                        "sexDensity",
                        "Genders to show :",
                        c("Male" = "Male",
                          "Female" = "Female"),
                        selected = c("Male", "Female")
                    ),
                    checkboxInput("meanDensity",
                                  "Show mean",
                                  value = TRUE)
                    
                ),
                box(
                    title = "Density..",
                    background = "maroon",
                    solidHeader = TRUE,
                    plotOutput("densityPlot", height = "500px")
                )
            )
        ),
        # Fourth tab content
        tabItem(tabName = "glass",
                h2("Glass dataset"),
                fluidRow(
                    tabBox(
                        # Title can include an icon
                        title = tagList(icon("glasses"), "Glass boxplots"),
                        side = "right",
                        tabPanel("CA", plotOutput("glassPlot", height = "500px")),
                        tabPanel(
                            "More chimical components",
                            plotOutput("glassPlot2", height = "500px")
                        )
                    )
                )),
        # fiveth tab content
        tabItem(
            tabName = "series",
            h2("Base dataset"),
            fluidRow(
                box(
                    title = "Normal series",
                    width = 5,
                    status = "success",
                    sidebarLayout(
                         sidebarPanel(
                             checkboxGroupInput("firms1",
                                                "Firms to show :",
                                                c("Google" = "GOOG",
                                                  "Facebook" = "FB",
                                                  "Twitter" = "TWTR",
                                                  "Amazon" = "AMZN",
                                                  "Apple" = "AAPL"),
                                                selected = c("GOOG", "FB", "TWTR", "AMZN", "AAPL")
                             )
                         ),
                         mainPanel(
                             plotOutput("timeSeries", height = "500px")
                         )
                     )
                    
                ),
                box(
                    title = "Adjusted series",
                    solidHeader = TRUE,
                    status = "success",
                    sidebarLayout(
                         sidebarPanel(
                             checkboxGroupInput("firms2",
                                                "Firms to show :",
                                                c("Google" = "GOOG",
                                                  "Facebook" = "FB",
                                                  "Twitter" = "TWTR",
                                                  "Amazon" = "AMZN",
                                                  "Apple" = "AAPL"),
                                                selected = c("GOOG", "AMZN")
                             )
                         ),
                         mainPanel(
                             plotOutput("adjustedTimeSeries", height = "500px")
                         )
                     )
                )
            )
        )
    ))
)


