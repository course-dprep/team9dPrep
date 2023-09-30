## Installing all packages

# List of packages used in this project
packages_to_install <- c(
  "tidyverse",
  "dplyr",
  "kableExtra",
  "knitr",
  "jsonlite",
  "ggplot2",
  "ggcorrplot",
  "ggthemes",
  "scales",
  "leaflet",
  "ggExtra",
  "gt",
  "readr",
  "here",
  "rstudioapi"
)

# Function to install and load packages if not already installed
install_and_load_packages <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if (length(new_packages) > 0) {
    install.packages(new_packages, dependencies = TRUE)
  }
  sapply(packages, require, character.only = TRUE)
}

# Install and load packages
install_and_load_packages(packages_to_install)
rm(packages_to_install)

# Set working Directory
library(here)
library(rstudioapi)

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




