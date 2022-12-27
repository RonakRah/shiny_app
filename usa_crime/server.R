
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
  # -------------|plotting|-------------
  output$histogramplot <- renderPlotly({
    # creating hist
    his = arrestData %>%
      plot_ly() %>%
      add_histogram(~Rape) %>%
      layout(xaxis = list(title = "Rape"))
    
    # creating box plot
    box = arrestData %>%
      plot_ly() %>%
      add_boxplot (~Rape) %>%
      layout(yaxis = list(showticklabels = F))
    
    # stacking both plots
    subplot(his , box , nrows = 2)  %>%
      layout(title = "Distribution chart - Histogram and Boxplot" ,
             yaxis = list(title = " Frequency")) %>% hide_legend()
  })
  
  
}