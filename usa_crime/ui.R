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
      conditionalPanel("input.sidebar == 'Visual' && input.t2 == 'dist'", selectInput(inputId = "var1" , label ="Select the Crime" , choices = crimes, selected = "Murder")),#for histo and boxplot
      
      conditionalPanel("input.sidebar == 'Visual' && input.t2 == 'rel' ", selectInput(inputId = "varA" , label ="Select the X axis" , choices = crimes, selected = "Rape")), # fort scatter plot var A
      conditionalPanel("input.sidebar == 'Visual' && input.t2 == 'rel' ", selectInput(inputId = "varB" , label ="Select the Y axis" , choices = crimes, selected = "Assault")), # fort scatter plot var B
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
              tabPanel(title = "About",icon=icon("address-card"),fluidRow(
                column(width = 8, tags$img(src="crime_sc.jpeg", width =600 , height = 300),
                       tags$br() , 
                       tags$a("Photo by Tom Filip on News-Ugo"), align = "center"),
                column(width = 4, tags$br() ,
                       tags$p("This data set comes along with base R and contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973.
                              Also, given is the percent of the population living in urban areas. This dataset
                              contains A data frame with 50 observations on 4 variables.")
                )
              )),
               #first tab box
              tabPanel(title ="Data",icon = icon("table"),dataTableOutput("dataTable")),# second tab box
              tabPanel(title ="Structure",icon=icon("uncharted"),verbatimTextOutput("structure")),# third tab box
              tabPanel(title ="Summary Stats",icon=icon("chart-pie"),verbatimTextOutput("summary")) #fourth tab box
              )),
              
      # items for second menu tab
      tabItem(tabName = "Visual",
              #defining tab boxes
              tabBox(id="t2", width=14, 
              tabPanel(title ="Crime Trends in each State",value = "trends"),  # first tab box
              tabPanel(title ="Distribution",plotlyOutput("histogramplot"),value = "dist"), # second tab box
              tabPanel(title ="Correlation Matrix"), # third tab box
              tabPanel(title =" Arrest types & Urban Population Relationship",plotlyOutput("scatter"),value="rel",
                       radioButtons(inputId ="method" , label = "Select The method" , choices = c("loess", "lm"), selected = "loess" , inline = TRUE)), # fourth tab box
              )),
      # items for third menu tab
      tabItem(tabName = "Choroplet-Map", box(h2("here is the place for map")))
      
      ))
  
  
  ))
