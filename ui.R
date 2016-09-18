library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('Miles per Gallon Modelling'),
    sidebarPanel(
        numericInput("nCyl",label="Enter number of cylinders:",4, min=4,max=8,step=2),
        numericInput("nDisp",label="Enter Displacement:",60, min=60,max=500,step=10),
        numericInput("nHp",label="Enter Horse Power:",60, min=60,max=400,step=20),
        numericInput("nWt",label="Enter Weight:",1.500, min=1.500,max=3.5000,step=0.5000),
        actionButton("go","Build Model")
    ),
    mainPanel(
        p('User should enter the values to predict the miles per gallon. Once the values are entered, click on \'Build Model\' to show the mpg predicted value'),
        br(),
        h5('Values used for prediction are:'),
        p('No. of cylinders'),
        textOutput("cyl"),
        br(),
        p('Displacement'),
        textOutput("disp"),
        br(),
        p('Horse Power'),
        textOutput("hp"),
        br(),
        p('Weight'),
        textOutput("wt"),
        br(),
    
        textOutput('goText'),
        textOutput("aV")
        
    )
))