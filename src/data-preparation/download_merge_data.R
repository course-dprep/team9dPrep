###############################################################
#############             PACKAGES               ##############
###############################################################
rm(list=ls())
library(readr)


###############################################################
#############      DOWNLOAD DATASETS             ##############
###############################################################



# URLs for downloading ZIP files
url <- c(
  "http://data.insideairbnb.com/italy/lombardia/bergamo/2023-06-30/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/emilia-romagna/bologna/2023-06-21/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/toscana/florence/2023-06-21/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/lombardy/milan/2023-06-21/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/campania/naples/2023-06-21/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/puglia/puglia/2023-06-30/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/lazio/rome/2023-06-10/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/sicilia/sicily/2023-06-29/data/listings.csv.gz",
  "http://data.insideairbnb.com/italy/trentino-alto-adige-s%C3%BCdtirol/trentino/2023-06-30/data/listings.csv.gz"
)

# Names for each URL
names <- c("listings_bergamo","listings_bologna", "listings_florence", "listings_milan", "listings_naples", "listings_puglia", "listings_rome", "listings_sicily", "listings_trentino")

# Define the target directory for extraction
data_dir <- "../../data/"

# Create an empty list to store the datasets


#Avoid too long downloads to be shut down
options(timeout = max(1000, getOption("timeout")))

# Loop through the URLs and extract/load the CSV files into separate datasets
for (i in 1:length(url)) {
  target_file <- paste0(data_dir, names[i], ".csv.gz")
  
  # Check if the CSV file already exists
  if (!file.exists(target_file)) {
    download.file(url[i], target_file, mode = "wb")
  } else {
    print(paste("ZIP file", names[i], "already exists. Skipping download."))
  }
  
  # Extract and load the CSV file
  gz_file <- gzfile(target_file, "rt")
  dataset_name <- paste("data_", names[i], sep = "")  # Create a unique dataset name
  assign(dataset_name, read.csv(gz_file))  # Load data into the dataset_name
  close(gz_file)  # Close the GZ file
  print(paste("Loaded", names[i]))
}



rm(url, target_file, names, i, gz_file, dataset_name)




###############################################################
#############       MERGING DATASETS             ##############
###############################################################

# List of dataset names
dataset_names <- c("data_listings_milan", "data_listings_bergamo", "data_listings_bologna", "data_listings_florence", "data_listings_naples", "data_listings_puglia", "data_listings_rome", "data_listings_sicily", "data_listings_trentino")

# Initialize the merged dataset with the first dataset
merged_data <- get(dataset_names[1])

# Loop through the remaining datasets and merge them
for (name in dataset_names[-1]) {
  merged_data <- rbind(merged_data, get(name))
}

# Deleting "source" datasets
for (name in dataset_names) {
  rm(list = name)
}


#Save merged dataset
save_if_not_exists <- function(data, file_path) {
  if (!file.exists(file_path)) {
    save(data, file = file_path)
    cat("File saved successfully:", file_path, "\n")
  } else {
    cat("File already exists:", file_path, "\n")
  }
}

save_if_not_exists(merged_data, "../../data/dataset1/dataset1.R")


rm(dataset_names, name)




###############################################################
#############       DELETING ZIP FILES           ##############
###############################################################


# List of ZIP file names
zip_file_names <- c("listings_milan.csv.gz", "listings_bergamo.csv.gz", "listings_bologna.csv.gz", "listings_florence.csv.gz", "listings_naples.csv.gz", "listings_puglia.csv.gz", "listings_rome.csv.gz", "listings_sicily.csv.gz", "listings_trentino.csv.gz")

# Loop through the ZIP file names and delete them
for (zip_name in zip_file_names) {
  zip_path <- file.path(data_dir, zip_name)
  if (file.exists(zip_path)) {
    file.remove(zip_path)
    print(paste("Deleted", zip_name))
  } else {
    print(paste("ZIP file", zip_name, "does not exist. Skipping deletion."))
  }
}



rm(data_dir, zip_file_names, zip_name, zip_path)




