#required libraries
library(shiny)
library(shinydashboard)

shinyUI(
dashboardPage(
  #-----------------------------|Dashboard Header|--------------------------
  dashboardHeader(title="Exploring the USA  Crime data ", 
                  titleWidth = 640, 
                  tags$li(class="dropdown",
                  tags$a(href="https://github.com/RonakRah/shiny_app", icon("github"),
                         "My Github", target="_blank"))
                  ),
  #------------------------------|Dashboard Sidebar|-------------------------
  dashboardSidebar(
    #Menu of dashboard
    
    sidebarMenu(
      id="sidebar",
      # 1- item in menu
      menuItem(text="Dataset", tabName = "dataset" , icon=icon("database")),
      # 2- item in menu
      menuItem(text = "Visualization", tabName = "Visual", icon = icon("chart-line")),
      # 3- item in menu
      menuItem(text = "Color Theme Map", tabName = "Choroplet-Map", icon = icon("map"))
    )
  
  ),
  #-----------------------------|Dashboard Body|----------------------
  dashboardBody(
    tabItems(
      # items for first menu tab
      tabItem(tabName = "dataset",
              #defining tab boxes
              tabBox(id="t1",width = 14,
              tabPanel(title = "About",icon=icon("address-card"),
                column(width = 8, tags$img(src="crime_sc.jpeg", width =600 , height = 300,align = "center"),
                       tags$br() , 
                       tags$a("Photo by JUSTIN MCCARTHY on NEWS GALLUP"), align = "center",
                
                       tags$p( align = "center","This data set comes along with base R and contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also, given is the percent of the population living in urban areas.
                              To use the dataset in R just use 'USArrests' . the format is a data frame with 50 observations on 4 variables.")
                )
              )
              , #first tab box
              tabPanel(title ="Data",icon = icon("table"),dataTableOutput("dataTable")),# second tab box
              tabPanel(title ="Structure",icon=icon("uncharted"),verbatimTextOutput("structure")),# third tab box
              tabPanel(title ="Summary Stats",icon=icon("chart-pie"),verbatimTextOutput("summary")) #fourth tab box
              )),
              
      # items for second menu tab
      tabItem(tabName = "Visual",
              #defining tab boxes
              tabBox(id="t2", width=14, 
              tabPanel(title ="Crime Trends in each State",value = "trends"),  # first tab box
              tabPanel(title ="Distribution"), # second tab box
              tabPanel(title ="Correlation Matrix"), # third tab box
              tabPanel(title =" Arrest types & Urban Population Relationship"), # fourth tab box
              )),
      # items for third menu tab
      tabItem(tabName = "Choroplet-Map", box(h2("here is the place for map")))
      
      ))
  
  
  ))
