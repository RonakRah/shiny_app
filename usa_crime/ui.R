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
      menuItem(text = "Visualization", tabName = "Visualization", icon = icon("chart-line")),
      # 3- item in menu
      menuItem(text = "Color Theme Map", tabName = "Choropleth-Map", icon = icon("map"))
    )
  
  ),
  #-----------------------------|Dashboard Body|----------------------
  dashboardBody(
    tabItems(
      # items for first menu tab
      tabItem(tabName = "dataset",
              #first tab box
              tabBox(id="t1",width = 12,tabPanel("about",icon=icon("address-card")),
              # second tab box
              tabPanel("Data",icon = icon("table")),
              tabPanel("Structure",icon=icon("uncharted")),
              tabPanel("Summary Stats",icon=icon("chart-pie"))),
              
      
      
      
      )
   
  
  
  )))
)