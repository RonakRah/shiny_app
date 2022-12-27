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

# create data for the app
arrestData <- USArrests

# get the structure of the data
arrestData %>% str()

# getting the summary of the data
arrestData %>% summary()

# head of the data
arrestData %>% head()

