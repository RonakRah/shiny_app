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
      menuItem(text = "Color Theme Map", tabName = "Map", icon = icon("map"))
    )
  
  ),
  #-----------------------------|Dashboard Body|----------------------
  dashboardBody(
    tabItems(
      # items for first menu tab
      tabItem(tabName = "dataset",
              #defining tab boxes
              tabBox(id="t1",width = 14,
              tabPanel(title = "About",icon=icon("address-card")), #first tab box
              tabPanel(title ="Data",icon = icon("table")),# second tab box
              tabPanel(title ="Structure",icon=icon("uncharted")),# third tab box
              tabPanel(title ="Summary Stats",icon=icon("chart-pie")) #fourth tab box
              )),
              
      # items for second menu tab
      tabItem(tabName = "Visual",
              #defining tab boxes
              tabBox(id="t2", width=14, 
              tabPanel(title ="Crime Trends in each State",value = "trends"),  # first tab box
              tabPanel(title ="Distribution"), # second tab box
              tabPanel(title ="Correlation Matrix"), # third tab box
              tabPanel(title =" Arrest types & Urban Population Relationship"), # fourth tab box
              ))
      ))
  
  
  ))
