
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
  
  # creating the crime selecttions
  crimes = arrData %>%
    select( - stateName) %>%
    names()
  # -------------|plotting|-------------
  output$histogramplot <- renderPlotly({
    # creating hist
    his = arrData %>%
      plot_ly() %>%
      add_histogram(~get(input$var1)) %>%
      layout(xaxis = list(title = paste(input$var1)))
    
    # creating box plot
    box = arrData %>%
      plot_ly() %>%
      add_boxplot (~get(input$var1)) %>%
      layout(yaxis = list(showticklabels = F))
    
    # stacking both plots
    subplot(box , his , nrows = 2)  %>%
      layout(title = "Distribution chart - Histogram and Boxplot" ,
             yaxis = list(title = " Frequency"),xaxis = list(title = input$var1)) %>% hide_legend()
  })
  
  ### Scatter plot for finding the rel between vars 
  output$scatter <- renderPlotly({
    scatterplot = arrData %>% 
      ggplot(aes(x=get(input$varA), y=get(input$varB))) +
      geom_point() +
      geom_smooth(method=get(input$method)) +
      labs(title = paste("Relation between", input$varA , "and" , input$varB),
           x = input$var3,
           y = input$var4) +
      theme(  plot.title = element_textbox_simple(size=10,
                                                  halign=0.5))
    # applied ggplot to make it interactive
    ggplotly(scatterplot)
    
  })
  
  ### Bar Charts to show he trends
  output$barchart <- renderPlotly({
    arrData %>% 
      plot_ly() %>% 
      add_bars(x=~stateName, y=~get(input$varT)) %>% 
      layout(title = paste("Statewise Arrests for", input$varT),
             xaxis = list(title = "State Name"),
             yaxis = list(title = paste(input$var2, "Arrests per 100,000 residents") ))
  })
  
  # Table of 5 top states with higest arrest
  output$highest <- renderTable({
    # top states  max
    top = arrData %>% 
      select(stateName, input$varT) %>% 
      arrange(desc(get(input$varT))) %>% 
      head()
  })
  # Table of 5 low states with lowest arrest
  output$lowest <- renderTable({
    low = arrData %>% 
      select(stateName, input$varT) %>% 
      arrange(get(input$varT)) %>% 
      head()
    
  
    
  })
  # header of boxes
  output$headingT <- renderText(
    paste(" First 6 top states with the highest rate of", input$varT)
  )
  output$headingL <- renderText(
    paste(" First 6 top states with the Lowest rate of", input$varT)
  )
  
}