#required libraries
library(shiny) 
library(shinydashboard)
library(DT) 
library(ggtext) 
library(maps) 
library(dplyr)  
library(plotly) 
library(ggcorrplot) 
library(shinycssloaders) 
library(ggplot2) 

#---------------------------|Dataset Section|-----------------
# create data for the app
arrestData <- USArrests

# get the structure of the data
arrestData %>% str()

# getting the summary of the data
arrestData %>% summary()

# head of the data
arrestData %>% head()

# row names to obj
statesName =rownames(arrestData)

# adding a col to the dataset as statesName
arrestData=arrestData %>% mutate(stateName = statesName)

#---------------------------|Visualization Section|-----------------
# creating histogram of the data
histo = arrestData %>% plot_ly() %>% add_histogram(~Assault)

# creating boxplot
boxPlot = arrestData %>% plot_ly() %>% add_boxplot(~Assault)

# creating the crime selecttions
crimes = arrData %>%
  select( - stateName) %>%
  names()
#creating the
MAR = arrData %>% 
  select(-"stateName", -"UrbanPop") %>% 
  names()
