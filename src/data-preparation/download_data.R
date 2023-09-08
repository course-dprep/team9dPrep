# Download dataset 1

# Define the URL and the target file name
url <- "http://data.insideairbnb.com/italy/lombardy/milan/2023-06-21/data/listings.csv.gz"
target_file <- "../../data/listings_milan.csv.gz"  # Relative path to the data directory

# Use download.file to download the file
download.file(url, target_file, method = "auto")

# Define the absolute path to the zip folder and the target CSV file
zip_file <- file.path(getwd(), "../../data/listings_milan.csv.gz")
csv_file <- file.path(getwd(), "../../data/listings.csv")

# Unzip the contents of the zip folder
unzip(zip_file, exdir = csv_file)


# Load the extracted CSV file into R
data <- read.csv(csv_file)


