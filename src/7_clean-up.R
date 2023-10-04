#GENERAL PACKAGES:
library(readr)
library(tidyverse) #A "Package of Packages" for Data manipulation and visualization (includes magrittr, lubridate, purrr, tidyr, etc.).
library(dplyr) #Data frame manipulations (select, slice, etc.
library(jsonlite) #For Amenities Columns Creation
library(moments) #Measuring the skewness.

#REGRESSION PACKAGES
library(caret) #Hyperparameters Tuning. 
library(xgboost) #XGBoost Regression. 
library(DALEX) #Summary of the XGBoost Regression Model ("explainer).
library(bayesforecast) #Checking Regression Assumptions.

#SHINYAPP PACKAGES
library(shiny) #For the ShinyApp
library(shinyWidgets) #For the ShinyApp

#PLOT AND FIGURES PACKAGES:
library(ggplot2) #Building fancy plots.
library(ggthemes) #Themes for ggplots (e.g. "solarized").
library(ggcorrplot) #For correlograms
library(scales) #Scaling and formatting ggplots (e.g. scale_fill_gradient()).
library(gt) #Latex tables

# WORKING DIRECTORY SETTING PACKAGES
library(here)
library(rstudioapi)



# Set the working directory to the source file location

current_document_path <- getActiveDocumentContext()$path
# Check if the document path is set
if (!is.null(current_document_path)) {
  # Set the working directory to the source file's location
  setwd(dirname(current_document_path))
  setwd("../..")
  rm(current_document_path)
} else {
  cat("No active document or path found. Set working directory manually.\n")
}



# Deletes files in all subdirectories with the endings specified here
fileEndings <- c('*.log','*.aux','*.Rout','*.Rhistory','*.fls','*.fdb_latexmk', ".RData")
for (fi in fileEndings) { 
  files <- list.files(getwd(),fi,include.dirs=F,recursive=T,full.names=T,all.files=T)
  file.remove(files)
}
