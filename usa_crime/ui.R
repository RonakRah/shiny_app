#required libraries
library(shiny)
library(shinydashboard)

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
      menuItem("Dataset", tabname = "Dataset" , icon=icon("database")),
      # 2- item in menu
      menuItem(text = "Visualization", tabName = "Visualization", icon = icon("chart-line")),
      # 3- item in menu
      menuItem(text = "Color Theme Map", tabName = "Choropleth Map", icon = icon("map"))
    )
  ),
  dashboardBody()
  
  
)