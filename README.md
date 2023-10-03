# Predict Italian Airbnb Listings Prices
![image](https://www.digital.ink/wp-content/uploads/airbnb_logo_detail.jpg)


---


## Table of content
[I. Introduction](https://github.com/course-dprep/team-project-team_9_group_project/#introduction)
- [Contributors](https://github.com/course-dprep/team-project-team_9_group_project/#contributors)
- [Research Motivation](https://github.com/course-dprep/team-project-team_9_group_project/#research-motivation)
- [Research Questions](https://github.com/course-dprep/team-assignment-team-6#conceptual-model)
- [Overview](https://github.com/course-dprep/team-assignment-team-6#conceptual-model)
                                                                                                                  
[II. Method](https://github.com/course-dprep/team-assignment-team-6#2-method)
- [Datasets](https://github.com/course-dprep/team-assignment-team-6#datasets)
- [Variables](https://github.com/course-dprep/team-assignment-team-6#variables)
- [Research method](https://github.com/course-dprep/team-assignment-team-6#research-method)

[III. Results and interpretation](https://github.com/course-dprep/team-assignment-team-6#3-results-and-interpretation)

[IV. Repository](https://github.com/course-dprep/team-assignment-team-6/master/README.md#4-repository)
- [Structure](https://github.com/course-dprep/team-assignment-team-6#structure)

[V. Running instructions](https://github.com/course-dprep/team-assignment-team-6#5-running-instructions)
- [Software](https://github.com/course-dprep/team-assignment-team-6#software)
- [Running the code](https://github.com/course-dprep/team-assignment-team-6#running-the-code)

[VI. More resources](https://github.com/course-dprep/team-assignment-team-6#6-more-rescources)

[VII. About](https://github.com/course-dprep/team-assignment-team-6#7-about)

---

# Introduction

### Contributors

| Author                                      | Contact                                     | 
|---------------------------------------------|---------------------------------------------|
| **Bianca Magalotti**                        | b.magalotti@tilburguniversity.it            |
| **Emanuele Franceschini**                   | e.franceschini@tilburguniversity.it         |
| **Tommaso Rabino**                          | t.rabino@tilburguniversity.it               |
| **Akram Benmrit**                           | a.benmrit@tilburguniversity.it              |
| **Colin Tan**                               | c.tan@tilburguniversity.it                  |


### Research Motivation
The rapid growth of Airbnb, a global platform for short-term property rentals, has introduced new challenges and opportunities for hosts, necessitating data-driven tools and insights to empower them. The objective of this study is twofold. First, an XGBoost Regression Model designed to assist Airbnb hosts in setting optimal rental prices for their listings was developed. Second, insights from the regression model and other data analysis techniques were levereged to highlight the critical factors influencing listing prices. Our findings not only provide valuable decision-making tools for hosts but also contribute to the broader discourse on short-term property rentals in Italy.

### Research Questions
* __Regression Model__: Is it possible to develop a predictive model able to help Airbnb hosts in setting the optimal rental prices for their listings?
* __Exploratory Data Analysis__: How to use exploratory data analysis to help Airbnb hosts understand the critical factors that influence the price of their listings?

### Overview
The code in this replication package constructs all the files in the folders `data preparation` and `analysis` from the data source ([Milan listings.csv from InsideAirbnb](http://insideairbnb.com/get-the-data/)) using R. Six main code files (5 in _RMarkdown_, 1 in _plain R_) run all of data, insights and results discussed in the final paper, which can be find in the following folder: _gen/paper/output_. The replicator should expect the code to run for about 4 hours.


---


# Data Availability and Provenance Statements

### Data Availability
The data was gathered from [Inside Airbnb]( http://insideairbnb.com/), a website operated directly by Airbnb that provides publicly available dataset of Airbnb listings. This platform provides the most recent version of required data for a multitude of cities around the world, allowing users to download specific datasets for their specific needs. 

Specifically, the website provides both a downloader page, where the dataset can be freely downloaded ([Inside Airbnb: Get the Data](http://insideairbnb.com/get-the-data)), and an explorer page, where a user-friendly tool enables users to analyze and explore specific listings dataset ([Inside Airbnb: Explore]( http://insideairbnb.com/explore)).

For the purposes of this project, the dataset used was “listings.csv.gz”, representing the detailed listings data specifically for the city of Milan, last update 21 June, 2023. The dataset can be downloaded and explored from the following two links: [Inside Airbnb: Milan Listings Downloader]( http://data.insideairbnb.com/italy/lombardy/milan/2023-09-13/data/listings.csv.gz); [Inside Airbnb: Milan Listings Explorer]( http://insideairbnb.com/milan).

### Statement about Rights

- [x] I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript.

### Summary of Availability
- [x] All data **are** publicly available.
- [ ] Some data **cannot be made** publicly available.
- [ ] **No data can be made** publicly available.

### Repository Structure
```
|-- data
   |-- dataset1
|-- gen
   |-- analysis
        |-- input
   |-- data-preparation
        |-- input
   |-- paper
        |-- input
        |-- output
|-- src
   |-- analysis
        |-- 5_regression_model
        |-- 6_shinyapp
   |-- data-preparation
        |-- 0_installing_packages
        |-- 1_data_download
        |-- 2_data_cleaning
        |-- 3_data_exploration
        |-- 4_data_preparation
   |-- 7_clean-up
|-- .gitignore
|-- README.md
|-- makefile
```

### Details on Data Source formats and locations

1. **Download the Data**: The raw dataset can be downloaded from the following link: [Inside Airbnb: Milan Listings Downloader]( http://data.insideairbnb.com/italy/lombardy/milan/2023-09-13/data/listings.csv.gz).

Additionally, once all source files of the present project are run, the following dataset will be automatically stored in the described folders and formats: 

2. **Raw Dataset**: The raw dataset (systematically extracted from the zip file that can be downloaded as described above) will be stored in the following two folders and formats:

| Folder                                      | Name                      | Format                    |
|---------------------------------------------|---------------------------|---------------------------|
| `data/dataset1`                             | milan_listings            | .csv                      |
| `gen/data-preparation/input`                | raw_data                  | .rds                      |

3. **Cleaned Dataset**: After all data cleaning and feature enginnering operations performed in the source code file *2_data_cleaning* the cleaned dataset will be stored in the following folder and format:

| Folder                                      | Name                      | Format                    |
|---------------------------------------------|---------------------------|---------------------------|
| `gen/data-preparation/input`                | clean_data                | .rds                      |

4. **Regression Data**: After all data preparation operations performed in the source code file *4_data_preparation* the dataset used for modelling the regression will be stored in the following folder and format:

| Folder                                      | Name                      | Format                    |
|---------------------------------------------|---------------------------|---------------------------|
| `gen/analysis/input`                        | regression_data           | .rds                      |

These steps ensure that users can always inspect the dataset characteristics at each stage of the project.



### Details on the raw Data Source
The dataset used for the present project comprises 23,142 observations, each corresponding to individual Airbnb listings in Milan, spanning 75 variables that offer diverse insights into listing characteristics, management, and performance.

It's crucial to highlight that not all listed variables will be utilized in subsequent analyses. Some will be omitted due to their lack of relevance or contribution to the analytical objectives of this project. Conversely, in the course of analysis, certain feature engineering operations were applied to create new variables. This enhances the encapsulation and representation of information in the dataset, facilitating a more comprehensive understanding of trends, patterns, and insights. Finally, due to data cleaning operations, the number of observations in the dataset may vary.

Here’s an overview of what each (origianl) variable represents:

| Variable                              | Description or Motivation for Removal                                         |
|---------------------------------------|-------------------------------------------------------------------------------|
| `id`                                  | A unique identifier for the listing.                                          |
| `listing_url`                         | The URL of the listing on Airbnb.                                            |
| `scrape_id`                           | The unique id of the scraping session.                                       |
| `last_scraped`                        | The date when the data for the listing was last scraped.                      |
| `source`                              | The origin of the listing data.                                              |
| `name`                                | The name of the listing.                                                     |
| `description`                         | A comprehensive description of the listing.                                  |
| `neighborhood_overview`               | An overview of the listing's neighborhood.                                   |
| `picture_url`                         | The URL of the listing's featured picture.                                   |
| `host_id`                             | A unique identifier for the host of the listing.                             |
| `host_url`                            | The URL of the host's Airbnb profile.                                        |
| `host_name`                           | The name of the host.                                                        |
| `host_since`                          | The date when the host joined Airbnb.                                        |
| `host_location`                       | The location of the host.                                                    |
| `host_about`                          | Information provided by the host about themselves.                           |
| `host_response_time`                  | The typical amount of time the host takes to respond to messages.            |
| `host_response_rate`                  | The host’s response rate to messages.                                        |
| `host_acceptance_rate`                | The rate at which the host accepts booking requests.                         |
| `host_is_superhost`                   | Indicator of whether the host is a Superhost.                                |
| `host_thumbnail_url`                  | The URL of the host’s thumbnail picture.                                     |
| `host_picture_url`                    | The URL of the host’s profile picture.                                       |
| `host_neighbourhood`                  | The neighborhood the host is located in.                                    |
| `host_listings_count`                 | The total number of listings the host has.                                   |
| `host_total_listings_count`           | The total number of listings the host has across all platforms.              |
| `host_verifications`                  | The methods the host has used to verify their identity.                      |
| `host_has_profile_pic`                | Indicator of whether the host has a profile picture.                         |
| `host_identity_verified`              | Indicator of whether the host’s identity has been verified.                  |
| `neighbourhood`                       | The neighborhood the listing is located in.                                  |
| `neighbourhood_cleansed`              | The cleaned name of the neighborhood the listing is located in.              |
| `neighbourhood_group_cleansed`        | The cleaned name of the neighborhood group the listing is located in.        |
| `latitude` & `longitude`              | The geographical coordinates of the listing.                                 |
| `property_type`                       | The type of property listed.                                                 |
| `room_type`                           | The type of room listed.                                                     |
| `accommodates`                        | The number of people the listing can accommodate.                            |
| `bathrooms`                           | The number of bathrooms in the listing.                                     |
| `bathrooms_text`                      | Textual description of the bathrooms.                                        |
| `bedrooms`                            | The number of bedrooms in the listing.                                       |
| `beds`                                | The number of beds in the listing.                                           |
| `amenities`                           | The amenities offered by the listing.                                        |
| `price`                               | The price of the listing per night.                                          |
| `minimum_nights` to `maximum_nights`   | Various restrictions and requirements related to the minimum and maximum nights a guest can book. |
| `calendar_updated`                    | When the listing’s calendar was last updated.                                |
| `has_availability`                    | Indicator of whether the listing is available.                              |
| `availability_30` to `availability_365`| The number of days the listing is available over different time spans.      |
| `calendar_last_scraped`               | The date when the listing’s calendar was last scraped.                       |
| `number_of_reviews` to `number_of_reviews_l30d`| Various measures of the number of reviews the listing has received.   |
| `first_review` & `last_review`        | Dates of the first and last reviews received.                                |
| `review_scores_rating` to `review_scores_value`| Various scores representing the quality of the listing as rated by guests. |
| `license`                             | The license number of the listing, if applicable.                            |
| `instant_bookable`                    | Indicator of whether the listing can be booked instantly.                   |
| `calculated_host_listings_count` to `calculated_host_listings_count_shared_rooms`| Various measures of the number of listings the host has.           |
| `reviews_per_month`                   | The average number of reviews the listing receives per month.               |
 

---


# Requirements

### Computational Requirements
The present project does not involve exceptionally large datasets, and the R environment is systematically cleaned by a specific code snippet at the end of each code file, making the project accessible for a standard PC commonly available in 2023. The whole set of code files were last run on a Apple MacBook Air (2020), with the following technical specifications: (i) CPU: Apple M1 8-core - 3.2 GHz; (ii) GPU: Apple M1 7-Core GPU; (iii) RAM: 8GB; (iv) SSD: 256GB; (v) Operating System: MacOS 14.

### Software Requirements
1. **R & RStudio** --> The code was developed and executed in R (R version 4.2.2), utilizing RStudio (RStudio version 2022.12.0+353) as the integrated development environment (IDE). The software and the programming language can be installed from this link: [R and RStudio Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).

2. **R Libraries and Packages** --> The source code files utilize the following R packages and libraries. You do nnot need to download or load them in advance, the source code file *0_installing_packages* will handle this issue for you.

```
- GENERAL PACKAGES:
library(readr)
library(tidyverse) #A "Package of Packages" for Data manipulation and visualization (includes magrittr, lubridate, purrr, tidyr, etc.).
library(dplyr) #Data frame manipulations (select, slice, etc.
library(jsonlite) #For Amenities Columns Creation
library(moments) #Measuring the skewness.

- REGRESSION PACKAGES
library(caret) #Hyperparameters Tuning. 
library(xgboost) #XGBoost Regression. 
library(DALEX) #Summary of the XGBoost Regression Model ("explainer).
library(bayesforecast) #Checking Regression Assumptions.

- SHINYAPP PACKAGES
library(shiny) #For the ShinyApp
library(shinyWidgets) #For the ShinyApp

- PLOT AND FIGURES PACKAGES:
library(ggplot2) #Building fancy plots.
library(ggthemes) #Themes for ggplots (e.g. "solarized").
library(ggcorrplot) #For correlograms
library(scales) #Scaling and formatting ggplots (e.g. scale_fill_gradient()).
library(gt) #Latex tables

- WORKING DIRECTORY SETTING PACKAGES
library(here)
library(rstudioapi)

```

4. **LaTex Distribution** --> To compile the final paper into A PDF document with LaTeX styling, you need to have a LaTeX distribution installed on your computer. To install a LaTeX Distribution:
   - On Windows: You can use distributions like MiKTeX or TeX Live. You can download the from the following links: [MikTex Download](https://miktex.org/download); [Tex Live Download](https://tug.org/texlive/windows.html)
   - On macOS: MacTeX is a popular distribution. You can download it from the following link: [MacTex Download](https://tug.org/mactex/mactex-download.html)

5. **LaTex Packages** --> For the same purpose, you also need to need to to make sure that the following necessary LaTeX packages are installed in your LaTeX distribution. You can typically install missing packages using the package manager of your LaTeX distribution.

```
%----------------------------------------------------------------------------------------
%	FONTS, MARGINS, AND PDF STYLING
%----------------------------------------------------------------------------------------
- babel: Language settings.
- fontenc: Font encoding.
- inputenc: Required for inputting international characters.
- mathpazo: Use the Palatino font.
- microtype: Slightly tweak font spacing for aesthetics. 
- mathptmx: Times New Roman font for text.
- helvet: Arial-like font for sans-serif.
- setspace: Line spacing.
- geometry: set the margin.
- amsmath: Math equations.
- amssymb: Math symbols.
- hyperref: Hyperlinks and URLs.
- enumerate: Enumerate environment.
- enumitem: Required for list customization.
- multicol: For two columns.


%----------------------------------------------------------------------------------------
%	HEADERS, FOOTERS, TITLE, ABSTARCT, BIBLIOGRAPHY, CAPTIONS AND GRAPHICS
%----------------------------------------------------------------------------------------
- fancyhdr: Header and footer customization.

- titlesec: Section titles formatting.
- titling: Required for customizing the title section.

- biblatex: to style bibliography.
- natbib: Citation style.
- appendix: Appendix formatting.

- abstract: Abstract formatting.
- caption: Captions customization.
- graphicx: Graphics.


%----------------------------------------------------------------------------------------
%	TABLES
%----------------------------------------------------------------------------------------
\usepackage{color}
\usepackage{rotating}
\usepackage{tabularray}
\usepackage{booktabs}


%----------------------------------------------------------------------------------------
%	TABLES
%----------------------------------------------------------------------------------------
- etoolbox
- footmisc
- listings
```

5. **RMarkdown** --> RMarkdown was used to convert the code from RStudio into more comprehensible pdf documents, allowing for a seamless representation of the analysis flow. Refer to the [RMarkdown Installation Guide](https://rmarkdown.rstudio.com/authoring_quick_tour.html#Installation)" for detailed instructions On how to install RMarkdown into your RStudio environment.

6. **make** --> Finally, the build tool make was employed to manage the automation of the compilation of all source code files and the final paper pdf document. The guide to install make can be found at this page: [Make Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).


### Runtime
The whole set of code files were last run on a Apple MacBook Air (2020). On this hardware, the code took almost 5 hours to generate the whole output. Most of the time required to run the entire code is spent to process the following R objects:

```
- xgb_caret.rds (4 hours)
- xgb_mod.rds (5 minutes)
- xgbcv.rds (10 minutes)
```

Therefore, in case you want to save almost the entire time needed to run the whole set of source code files, follow these instructions:
- Before running the project, go to the project's GitHub repository page.
- Open the folder _save-time-objects_.
- Download the 3 files you find inside this folder.
- Store the 3 files in the following folder _gen/analysis/input_.

The _5_regression_model_ file code is written in such a way as to avoid reprocessing the mentioned R objects if they are already located in the mentioned folder.


### Controlled Randomness
- [x] Random seed is set at **line 53** of program **1_download_data**.


--- 


# Description of programs/code
All source code files present in this repository are described in the table below:

| File Name                                   | File Format | File Description                            | File Location        | File Output            | 
|---------------------------------------------|-------------|---------------------------------------------|----------------------| -----------------------|
| **0_installing_packages**                   | .R          | Installs all the necessary R packages and set the working directory to the source file location.                                            | src/data-preparation | N/A                    |
| **1_data_download**                         | .Rmd        | Downloads the data source zip file, extract the database, and load it into R.         | src/data-preparation | 1_data_download.pdf    |
| **2_data_cleaning**                         | .Rmd        | Cleans the dataset from NAs, outliers, and useless or empty columns.              | src/data-preparation | 2_data_cleaning.pdf    |
| **3_data_exploration**                      | .Rmd        | Set of EDA operations, including correlograms and categorical variable visualizations.              | src/data-preparation | 3_data_exploration.pdf |
| **4_data_preparation**                      | .Rmd        | Set of operations needed to prepare the dataset for the regression modeling, including computation of logarithm of the DV, one-hot encoding of factor variables, centering and scaling numeric variables, and dividing the dataset into a training and a testing dataset.                 | src/data-preparation | 4_data_preparation.pdf |
| **5_regression_model**                      | .Rmd        | Hyperparameter tuning, determining the optimal number of iterations, training the model and assessing its performance, checking regression assumptions.                  | src/analysis         | 5_regression_model.pdf |
| **6_shinyapp**                              | .R          | Develops an interactive and user-friendly ShinyApp capable of predicting the price of an Airbnb listing located in Milan. The ShinyApp uses the previously trained and validated regression model to predict the price of a listing whose characteristics (number of rooms, beds, bathrooms, and accommodated people, location, type of apartment, etc.) can be defined a priori by the user.               | src/analysis         | ShinyApp Interface     |
| **7_clean-up**                              | .R          | Eliminates all not relevant file, including .RHistory and .RData.                  | src/                 | N/A                    |
| **final_paper**                             | .pdf        | Pdf file with all results and insights gained from the anlysis.                  | gen/paper/output     | N/A                    |

---

# Instructions to Replicators

### Step-by-step
To run the code, follow these instructions:
1. Fork this repository
2. Open your command line / terminal and run the following code:
```
git clone https://github.com/course-dprep/team-project-team_9_group_project.git
```
3. Set your working directory to `airbnb-price-calculator` using the following command:
```
cd "your_repository_path/team-project-team_9_group_project
```
4. Run the following command:
```
make
```

4. When make has succesfully run all the code, a window of RStudio with the ShinyApp will open.
   - Note: when the command line/terminal is closed, the ShinyApp will not be available anymore.


### Alternative route
An alternative route to run the code would be to run (or knitr) all .R (and .Rmd) files in order (follow the numbers in the files names). Note: through this alternative route, the final_paper.pdf document will not be generated automatically.


---
---
