
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
  crimes = arrestData %>%
    select( - stateName) %>%
    names()
  # -------------|plotting|-------------
  output$histogramplot <- renderPlotly({
    # creating hist
    his = arrestData %>%
      plot_ly() %>%
      add_histogram(~get(input$var1)) %>%
      layout(xaxis = list(title = paste(input$var1)))
    
    # creating box plot
    box = arrestData %>%
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
    scatterplot = arrestData %>% 
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
    arrestData %>% 
      plot_ly() %>% 
      add_bars(x=~stateName, y=~get(input$varT)) %>% 
      layout(title = paste("Statewise Arrests for", input$varT),
             xaxis = list(title = "State Name"),
             yaxis = list(title = paste(input$var2, "Arrests per 100,000 residents") ))
  })
  
  # Table of 5 top states with higest arrest
  output$highest <- renderTable({
    # top states  max
    top = arrestData %>% 
      select(stateName, input$varT) %>% 
      arrange(desc(get(input$varT))) %>% 
      head()
  })
  # Table of 5 low states with lowest arrest
  output$lowest <- renderTable({
    low = arrestData %>% 
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
  
  # thematic map
  output$thematicmap <- renderPlot({
    joined %>% 
      ggplot(aes(x=long, y=lat,fill=get(input$crimet) , group = group)) +
      geom_polygon(color="black", size=0.4) +
      scale_fill_gradient(low="#73A5C6", high="#001B3A", name = paste(input$crimet, "Arrest rate")) +
      theme_void() +
      labs(title = paste("Thematic map of", input$crimet , " Arrests per 100,000 residents by state")) +
      theme(
        plot.title = element_textbox_simple(face="bold", 
                                            size=18,
                                            halign=0.5),
        
        legend.position = c(0.2, 0.1),
        legend.direction = "horizontal"
        
      ) +
      geom_text(aes(x=x, y=y, label=abb), size = 4, color="white")
    
    
    
  })
  
  
  
  
  ## Correlation plot
  output$corplot <- renderPlotly({
    mydata <- arrestData %>% 
      select(-stateName)
    
    #  correlation matrix calculation
    corr <- round(cor(mydata), 1)
    
    # Compute a matrix of correlation p-values
    p.mat <- cor_pmat(mydata)
    
    corr_plot <- ggcorrplot(
      corr, 
      hc.order = TRUE, 
      lab= TRUE,
      outline.col = "white",
      p.mat = p.mat
    )
    
    ggplotly(corr_plot)
    
  })
}