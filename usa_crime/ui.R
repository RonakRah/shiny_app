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
  #
  dashboardSidebar(),
  dashboardBody()
  
  
)