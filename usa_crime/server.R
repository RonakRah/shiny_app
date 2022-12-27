
library(shiny)
library(DT)
function(input,output,session){
  
  # -------------|Structure|-------------
  output$structure <- renderPrint(
  # get the structure of the data
  arrestData %>% str()
  )
  
  # -------------|Summary|-------------
  output$summary <- renderPrint(
    # getting the summary of the data
    arrestData %>% summary()
  )
  
  # -------------|Data table|-------------
  output$dataTable <- renderDataTable(
    arrestData
  )
  
}