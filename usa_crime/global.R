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

#-------------------------| correlation | ------------------------

state_in_map <- map_data("state")
lowecase = arrData %>% 
  mutate(State = tolower(stateName))

## Add the lat, long and other info needed 
merged_data =right_join(lowecase, state_in_map,  by=c("State" = "region"))

#  Create a dataframe out of  State Abreviations and center locations of each states 
state_center = data.frame(abb = state.abb, stname=tolower(state.name), x=state.center$x, y=state.center$y)

# Join the state abbreviations and center location to the dataset for each of the observations in the merged dataset
joined = left_join(merged_data, state_center, by=c("State" = "stname"))

#-------------------------| plots | ------------------------

# creating the crime selecttions
crimes = arrData %>%
  select( - stateName) %>%
  names()
#creating the
MAR = arrData %>% 
  select(-"stateName", -"UrbanPop") %>% 
  names()



