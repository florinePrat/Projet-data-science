library(shiny)
library(shinythemes)
library(shinydashboard)
library(shinyWidgets)

dashboardPage(skin = "green",
    dashboardHeader(title = "Les profils types"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Accueil", tabName = "home", icon = icon("home")),
            menuItem("Map", tabName = "map", icon = icon("map")),
            menuItem(
                "Age",
                tabName = "age",
                icon = icon("pagelines"),
                menuSubItem(
                    "Histograme",
                    tabName = "ageH",
                    icon = icon("chart-bar")
                ),
                menuSubItem("Density", tabName = "ageD", icon = icon("chart-area"))
            ),
            menuItem("CSP", tabName = "glass", icon = icon("briefcase")),
            menuItem("S. Familliale", tabName = "familliale", icon = icon("users"))
            
        )
    ),
    dashboardBody(tabItems(
        # First tab content
        tabItem(
            tabName = "home",
            h2("Projet data science"),
            h3("Sujet : Determiner les profils type des conducteurs de 2rm qui vont changer de 2rm en 2020."),
            h4("Notre problematique a partir de ce sujet : Comment aider les concessionnaires ou revendeurs de motos a mieux cibler leur carnet de clients pour realiser des ventes ?"),
            h5("Vous pourrez vous balader dans les differents menus de ce site afin d y retrouver des elements qui nous permettent de tirer des conclusions sur notre problematique. Certains de ces elements sont interactifs."),
            h5("N hesitez pas a jouer avec."),
            h5("Bonne lecture,"),
            h6("Axel Canton, Timi Duban, Florine Pratlong")
        ),
        tabItem(
            tabName = "map",
            h2("Profils types des conducteurs de 2rm"),
            h3("Carte de france representant la localisation des conducteurs qui vont ou ont changer de 2rm en 2020"),
            img(src='comparatifMap.png', align = 'center', height="70%", width="70%"),
            h4("Ici on peut voir que la carte a dominante bleu represente le pourcentage des conducteurs qui vont ou ont changer de 2rm en 2020 mais elle est a mettre en parrallele de la carte rouge car celle ci represente les effectifs de l etude en fonction des departements donc pour y voir ici une conclusion significative il faut un departement avec un nombre assez eleve de participant qui a un bon pourcentage de motards qui vont changer de 2rm."),
            h4(" Les departement qui sortent du lot sont : Meurthe et moselle, Var, Loire atlantique, Pyrenees oriantales.."),
            h4("- Meurthe et moselle : 30.8% pour 13 repondants"),
            h4("- Var : 21.1% pour 19 repondants"),
            h4("- Loire atlantique : 20.8% pour 24 repondants"),
            h4("- Pyrenees oriantales : 33.3% pour 9 repondants")
        ),
        
        
        # Second tab content
        tabItem(
            tabName = "ageH",
            h3("Repartition de l age en fonction du changement ou non du 2rm en 2020"),
            fluidRow(
                title = "Histogram..",
                background = "maroon",
                solidHeader = TRUE,
                plotOutput("weightPlot", height = "500px", width = "100%"),
                box(
                    width = 5,
                    status = "success",
                    background = "black",
                    checkboxGroupInput(
                        "changementAge",
                        "Aviez vous l intention de changer de 2 roues motorise en 2020 :",
                        c("Non" = "Non", 
                          "Non vous n aviez pas l intention d en changer mais vous avez change d avis" = "Non vous n aviez pas l intention d en changer mais vous avez change d avis",
                          "Oui vous allez changer de 2 roues d ici la fin de l annee" = "Oui vous allez changer de 2 roues d ici la fin de l annee",
                          "Oui vous avez deja change de 2 roues cette annee" = "Oui vous avez deja change de 2 roues cette annee",
                          "Oui vous aviez l intention mais vous avez change d avis" = "Oui vous aviez l intention mais vous avez change d avis"),
                        selected = c("Non" = "Non","Non vous n aviez pas l intention d en changer mais vous avez change d avis", 
                                     "Oui vous allez changer de 2 roues d ici la fin de l annee", 
                                     "Oui vous avez deja change de 2 roues cette annee","Oui vous aviez l intention mais vous avez change d avis")
                    )
                    
                )
                
            )
        ),
        # Theird tab content
        tabItem(
            tabName = "ageD",
            h3("Repartition de la densite l age en fonction du changement ou non du 2rm en 2020"),
            h5("Les filtres se trouvent en bas de page."),
            fluidRow(
                plotOutput("densityPlot"),
                h4("Pour ce premier graphique, on ne peux pas vraiement faire d analyse. Nous avons simplement la repartition des ages en fonction de leur reponse"),
                plotOutput("densityPlot2"),
                h4("Ce graphique est interessant car il nous montre bien que l age est totalment independant du fait de changer de 2rm en 2020 ou non."),
                box(
                    width = 5,
                    status = "success",
                    background = "black",
                    checkboxGroupInput(
                        "changementAgeDensity",
                        "Aviez vous l intention de changer de 2 roues motorise en 2020 :",
                        c("Non" = "Non", 
                          "Non vous n aviez pas l intention d en changer mais vous avez change d avis" = "Non vous n aviez pas l intention d en changer mais vous avez change d avis",
                          "Oui vous allez changer de 2 roues d ici la fin de l annee" = "Oui vous allez changer de 2 roues d ici la fin de l annee",
                          "Oui vous avez deja change de 2 roues cette annee" = "Oui vous avez deja change de 2 roues cette annee",
                          "Oui vous aviez l intention mais vous avez change d avis" = "Oui vous aviez l intention mais vous avez change d avis"),
                        selected = c("Non" = "Non","Non vous n aviez pas l intention d en changer mais vous avez change d avis", 
                                     "Oui vous allez changer de 2 roues d ici la fin de l annee", 
                                     "Oui vous avez deja change de 2 roues cette annee","Oui vous aviez l intention mais vous avez change d avis")
                    )
                    
                ),
                box(
                    width = 5,
                    status = "success",
                    background = "black",
                    checkboxGroupInput(
                        "changementAgeDensity2",
                        "Aviez vous l intention de changer de 2 roues motorise en 2020 :",
                        c("Oui" = "True", 
                          "Non" = "False"),
                        selected = c("Oui" = "True", 
                                     "Non" = "False")
                    )
                    
                )
            )
        ),
        # Fourth tab content
        tabItem(tabName = "glass",
                h3("Repartition de la CSP en fonction du changement ou non du 2rm en 2020"),
                fluidRow(
                    box(
                        width = 5,
                        status = "success",
                        dropdownButton(
                            inputId = "mydropdown",
                            label = "Choix de la CSP",
                            icon = icon("briefcase"),
                            status = "default",
                            circle = FALSE,
                            checkboxGroupInput(
                                "changementCsp",
                                "Selecteur de reponses :",
                                choiceNames = list(
                                    tags$span("Cadre", style = "color: black;"),
                                    tags$span("Agriculteur exploitant", style = "color: black;"),
                                    tags$span("Artisan  commercant assimile", style = "color: black;"),
                                    tags$span("Autre sans activite professionnelle (personne au foyer...)", style = "color: black;"),
                                    tags$span("Chef d entreprise de 10 salaries ou plus", style = "color: black;"),
                                    tags$span("Employe", style = "color: black;"),
                                    tags$span("En recherche d emploi", style = "color: black;"),
                                    tags$span("Etudiant", style = "color: black;"),
                                    tags$span("Ouvrier", style = "color: black;"),
                                    tags$span("Profession intermediaire", style = "color: black;"),
                                    tags$span("Profession liberale et artistique", style = "color: black;"),
                                    tags$span("Retraite", style = "color: black;")
                                    
                                ),
                                choiceValues = c("Cadre", "Agriculteur exploitant","Artisan  commercant assimile","Autre sans activite professionnelle (personne au foyer...)", "Chef d entreprise de 10 salaries ou plus","Employe", "En recherche d emploi", "Etudiant", "Ouvrier", "Profession intermediaire","Profession liberale et artistique","Retraite"),
                                selected = c("Artisan  commercant assimile","Autre sans activite professionnelle (personne au foyer...)", "Profession intermediaire", "Agriculteur exploitant")
                            )
                        ),
                        h4("Ici True (partie bleu) signifit : a ou va changer de 2rm en 2020 "),
                        h4("et false : ne vas pas changer de 2rm en 2020 "),
                        h4("On constate que les proportions les plus importantes de repondant qui vont changer de 2rm en 2020 sont : "),
                        h4("- Professions liberales et artistiques : 25%"),
                        h4("- Agriculteur exploitant : 25%"),
                        h4("- Artisans, commercants assimiles : 23.3%"),
                        h4("- Professions intermediaires : 18.5%"),
                        h4("On peut voir que 100% des etudiants et chercheur d emploi ne vont pas changer de 2rm. ")
                        
                    ),
                    title = "Barplot",
                    background = "maroon",
                    solidHeader = TRUE,
                    plotOutput("irisPlot", height = "500px")
                    
                )
            ),
        
        
        tabItem(tabName = "familliale",
                h3("Repartition de la situation familiale en fonction du changement ou non du 2rm en 2020"),
                fluidRow(
                    
                    
                    box(
                        width = 5,
                        status = "success",
                        dropdownButton(
                            inputId = "mydropdown",
                            label = "Choix de la situation familliale",
                            icon = icon("users"),
                            status = "default",
                            circle = FALSE,
                            checkboxGroupInput(
                                "changementFamily",
                                "Selecteur de reponses :",
                                choiceNames = list(
                                    tags$span("Autre", style = "color: black;"),
                                    tags$span("En couple avec enfant(s)", style = "color: black;"),
                                    tags$span("En couple sans enfant", style = "color: black;"),
                                    tags$span("Seul(e) avec enfants", style = "color: black;"),
                                    tags$span("Seul(e) sans enfant", style = "color: black;")
                                    
                                ),
                                choiceValues = c("Autre","En couple avec enfant(s)","En couple sans enfant","Seul(e) avec enfants","Seul(e) sans enfant"),
                                selected = c("En couple avec enfant(s)","En couple sans enfant","Seul(e) avec enfants","Seul(e) sans enfant")
                            )
                        ),
                        checkboxGroupInput(
                            "changement2rm",
                            "Aviez vous l intention de changer de 2 roues motorise en 2020 :",
                            choiceNames = list(
                                tags$span("Non", style = "color: black;"),
                                tags$span("Non vous n aviez pas l intention d en changer mais vous avez change d avis", style = "color: black;"),
                                tags$span("Oui vous allez changer de 2 roues d ici la fin de l annee", style = "color: black;"),
                                tags$span("Oui vous avez deja change de 2 roues cette annee", style = "color: black;"),
                                tags$span("Oui vous aviez l intention mais vous avez change d avis", style = "color: black;")
                                
                            ),
                            choiceValues = c("Non","Non vous n aviez pas l intention d en changer mais vous avez change d avis","Oui vous allez changer de 2 roues d ici la fin de l annee","Oui vous avez deja change de 2 roues cette annee","Oui vous aviez l intention mais vous avez change d avis"),
                            selected = c("Non vous n aviez pas l intention d en changer mais vous avez change d avis","Oui vous allez changer de 2 roues d ici la fin de l annee","Oui vous avez deja change de 2 roues cette annee","Oui vous aviez l intention mais vous avez change d avis")
                        )
                    ),
                    
                    
                    
                    
                    title = "Barplot",
                    background = "maroon",
                    solidHeader = TRUE,
                    plotOutput("familyPlot", height = "500px")
                    
                )
        )
        
        
        
        
    ))
)




