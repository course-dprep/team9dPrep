

###############################################################
#############       PRELIMINARY SETTINGS         ##############
###############################################################

#Restore Environment
rm(list=ls())

#Setting the seed for reproducible results
set.seed(999)






###############################################################
######    AUTOMATICALLY DOWNLOAD UNINSTALLED PACKAGES    ######
###############################################################


# find all source code files in (sub)folders
files <- list.files(pattern='[.](R|rmd)$', all.files=T, recursive=T, full.names = T, ignore.case=T)

# read in source code
code=unlist(sapply(files, scan, what = 'character', quiet = TRUE))

# retain only source code starting with library
code <- code[grepl('^library', code, ignore.case=T)]
code <- gsub('^library[(]', '', code)
code <- gsub('[)]', '', code)
code <- gsub('^library$', '', code)

# retain unique packages
uniq_packages <- unique(code)

# kick out "empty" package names
uniq_packages <- uniq_packages[!uniq_packages == ''] 

# order alphabetically
uniq_packages <- uniq_packages[order(uniq_packages)] 

cat('Required packages: \n')
cat(paste0(uniq_packages, collapse= ', '),fill=T)
cat('\n\n\n')

# retrieve list of already installed packages
installed_packages <- installed.packages()[, 'Package']

# identify missing packages
to_be_installed <- setdiff(uniq_packages, installed_packages)

if (length(to_be_installed)==length(uniq_packages)) cat('All packages need to be installed.\n')
if (length(to_be_installed)>0) cat('Some packages already exist; installing remaining packages.\n')
if (length(to_be_installed)==0) cat('All packages installed already!\n')

# install missing packages
if (length(to_be_installed)>0) install.packages(to_be_installed, repos = 'https://cloud.r-project.org')

cat('\nDone!\n\n')








###############################################################
#############           LOAD PACKAGES            ##############
###############################################################

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








###############################################################
######      AUTOMATICALLY SET WORKING DIRECTORY         #######
###############################################################

if (rstudioapi::isAvailable()) {
  # Get the path of the active document
  current_document_path <- getActiveDocumentContext()$path
  
  # Check if the document path is set
  if (!is.null(current_document_path)) {
    # Set the working directory to the source file's location
    setwd(dirname(current_document_path))
    
    # Optionally, you can remove the document path variable
    rm(current_document_path)
  } else {
    cat("No active document or path found. Set working directory manually.\n")
  }
} else {
  # This section is executed when not in RStudio
  # Here, you can set the working directory manually or leave it at its default
  cat("Script is not running in RStudio. Consider setting the working directory manually if required.\n")
}









