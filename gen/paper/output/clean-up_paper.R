
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



# Deletes files in all subdirectories with the endings specified here
fileEndings <- c('*.cls','*.bib','*.aux','*.bcf','*.log','*.out', ".xml", ".Rhistory", ".RData", ".tex")
for (fi in fileEndings) { 
  files <- list.files(getwd(),fi,include.dirs=F,recursive=T,full.names=T,all.files=T)
  file.remove(files)
}
