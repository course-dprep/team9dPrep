# Predict Italian Airbnb Listings Prices
![image](https://www.digital.ink/wp-content/uploads/airbnb_logo_detail.jpg)

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
   |-- paper
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

2. **LaTex Distribution** --> To compile the final paper into A PDF document with LaTeX styling, you need to have a LaTeX distribution installed on your computer. To install a LaTeX Distribution:
   - On Windows: You can use distributions like MiKTeX or TeX Live. You can download the from the following links: [MikTex Download](https://miktex.org/download); [Tex Live Download](https://tug.org/texlive/windows.html)
   - On macOS: MacTeX is a popular distribution. You can download it from the following link: [MacTex Download](https://tug.org/mactex/mactex-download.html)

3. **LaTex Packages** --> For the same purpose, you also need to need to to make sure that the following necessary LaTeX packages are installed in your LaTeX distribution. You can typically install missing packages using the package manager of your LaTeX distribution.

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

4. **RMarkdown** --> RMarkdown was used to convert the code from RStudio into more comprehensible pdf documents, allowing for a seamless representation of the analysis flow. Refer to the [RMarkdown Installation Guide](https://rmarkdown.rstudio.com/authoring_quick_tour.html#Installation)" for detailed instructions On how to install RMarkdown into your RStudio environment.

5. **make** --> Finally, the build tool make was employed to manage the automation of the compilation of all source code files and the final paper pdf document. The guide to install make can be found at this page: [Make Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).


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
- [x] Random seed is set at __line 53__ of program _1_download_data_.















---
---


# README TAMPLATE FROM TILBURG SCIENCE HUB (to be adapted)



























## Description of programs/code

> INSTRUCTIONS: Give a high-level overview of the program files and their purpose. Remove redundant/ obsolete files from the Replication archive.

- Programs in `programs/01_dataprep` will extract and reformat all datasets referenced above. The file `programs/01_dataprep/main.do` will run them all.
- Programs in `programs/02_analysis` generate all tables and figures in the main body of the article. The program `programs/02_analysis/main.do` will run them all. Each program called from `main.do` identifies the table or figure it creates (e.g., `05_table5.do`).  Output files are called appropriate names (`table5.tex`, `figure12.png`) and should be easy to correlate with the manuscript.
- Programs in `programs/03_appendix` will generate all tables and figures  in the online appendix. The program `programs/03_appendix/main-appendix.do` will run them all. 
- Ado files have been stored in `programs/ado` and the `main.do` files set the ADO directories appropriately. 
- The program `programs/00_setup.do` will populate the `programs/ado` directory with updated ado packages, but for purposes of exact reproduction, this is not needed. The file `programs/00_setup.log` identifies the versions as they were last updated.
- The program `programs/config.do` contains parameters used by all programs, including a random seed. Note that the random seed is set once for each of the two sequences (in `02_analysis` and `03_appendix`). If running in any order other than the one outlined below, your results may differ.

### (Optional, but recommended) License for Code

> INSTRUCTIONS: Most journal repositories provide for a default license, but do not impose a specific license. Authors should actively select a license. This should be provided in a LICENSE.txt file, separately from the README, possibly combined with the license for any data provided. Some code may be subject to inherited license requirements, i.e., the original code author may allow for redistribution only if the code is licensed under specific rules - authors should check with their sources. For instance, some code authors require that their article describing the econometrics of the package be cited. Licensing can be complex. Some non-legal guidance may be found [here](https://social-science-data-editors.github.io/guidance/Licensing_guidance.html).

The code is licensed under a MIT/BSD/GPL [choose one!] license. See [LICENSE.txt](LICENSE.txt) for details.

## Instructions to Replicators

> INSTRUCTIONS: The first two sections ensure that the data and software necessary to conduct the replication have been collected. This section then describes a human-readable instruction to conduct the replication. This may be simple, or may involve many complicated steps. It should be a simple list, no excess prose. Strict linear sequence. If more than 4-5 manual steps, please wrap a main program/Makefile around them, in logical sequences. Examples follow.

- Edit `programs/config.do` to adjust the default path
- Run `programs/00_setup.do` once on a new system to set up the working environment. 
- Download the data files referenced above. Each should be stored in the prepared subdirectories of `data/`, in the format that you download them in. Do not unzip. Scripts are provided in each directory to download the public-use files. Confidential data files requested as part of your FSRDC project will appear in the `/data` folder. No further action is needed on the replicator's part.
- Run `programs/01_main.do` to run all steps in sequence.

### Details

- `programs/00_setup.do`: will create all output directories, install needed ado packages. 
   - If wishing to update the ado packages used by this archive, change the parameter `update_ado` to `yes`. However, this is not needed to successfully reproduce the manuscript tables. 
- `programs/01_dataprep`:  
   - These programs were last run at various times in 2018. 
   - Order does not matter, all programs can be run in parallel, if needed. 
   - A `programs/01_dataprep/main.do` will run them all in sequence, which should take about 2 hours.
- `programs/02_analysis/main.do`.
   - If running programs individually, note that ORDER IS IMPORTANT. 
   - The programs were last run top to bottom on July 4, 2019.
- `programs/03_appendix/main-appendix.do`. The programs were last run top to bottom on July 4, 2019.
- Figure 1: The figure can be reproduced using the data provided in the folder “2_data/data_map”, and ArcGIS Desktop (Version 10.7.1) by following these (manual) instructions:
  - Create a new map document in ArcGIS ArcMap, browse to the folder
“2_data/data_map” in the “Catalog”, with files  "provinceborders.shp", "lakes.shp", and "cities.shp". 
  - Drop the files listed above onto the new map, creating three separate layers. Order them with "lakes" in the top layer and "cities" in the bottom layer.
  - Right-click on the cities file, in properties choose the variable "health"... (more details)

## List of tables and programs


> INSTRUCTIONS: Your programs should clearly identify the tables and figures as they appear in the manuscript, by number. Sometimes, this may be obvious, e.g. a program called "`table1.do`" generates a file called `table1.png`. Sometimes, mnemonics are used, and a mapping is necessary. In all circumstances, provide a list of tables and figures, identifying the program (and possibly the line number) where a figure is created.
>
> NOTE: If the public repository is incomplete, because not all data can be provided, as described in the data section, then the list of tables should clearly indicate which tables, figures, and in-text numbers can be reproduced with the public material provided.

The provided code reproduces:

- [ ] All numbers provided in text in the paper
- [ ] All tables and figures in the paper
- [ ] Selected tables and figures in the paper, as explained and justified below.


| Figure/Table #    | Program                  | Line Number | Output file                      | Note                            |
|-------------------|--------------------------|-------------|----------------------------------|---------------------------------|
| Table 1           | 02_analysis/table1.do    |             | summarystats.csv                 ||
| Table 2           | 02_analysis/table2and3.do| 15          | table2.csv                       ||
| Table 3           | 02_analysis/table2and3.do| 145         | table3.csv                       ||
| Figure 1          | n.a. (no data)           |             |                                  | Source: Herodus (2011)          |
| Figure 2          | 02_analysis/fig2.do      |             | figure2.png                      ||
| Figure 3          | 02_analysis/fig3.do      |             | figure-robustness.png            | Requires confidential data      |

## References

> INSTRUCTIONS: As in any scientific manuscript, you should have proper references. For instance, in this sample README, we cited "Ruggles et al, 2019" and "DESE, 2019" in a Data Availability Statement. The reference should thus be listed here, in the style of your journal:

Steven Ruggles, Steven M. Manson, Tracy A. Kugler, David A. Haynes II, David C. Van Riper, and Maryia Bakhtsiyarava. 2018. "IPUMS Terra: Integrated Data on Population and Environment: Version 2 [dataset]." Minneapolis, MN: *Minnesota Population Center, IPUMS*. https://doi.org/10.18128/D090.V2

Department of Elementary and Secondary Education (DESE), 2019. "Student outcomes database [dataset]" *Massachusetts Department of Elementary and Secondary Education (DESE)*. Accessed January 15, 2019.

U.S. Bureau of Economic Analysis (BEA). 2016. “Table 30: "Economic Profile by County, 1969-2016.” (accessed Sept 1, 2017).

Inglehart, R., C. Haerpfer, A. Moreno, C. Welzel, K. Kizilova, J. Diez-Medrano, M. Lagos, P. Norris, E. Ponarin & B. Puranen et al. (eds.). 2014. World Values Survey: Round Six - Country-Pooled Datafile Version: http://www.worldvaluessurvey.org/WVSDocumentationWV6.jsp. Madrid: JD Systems Institute.

---

## Acknowledgements

Some content on this page was copied from [Hindawi](https://www.hindawi.com/research.data/#statement.templates). Other content was adapted  from [Fort (2016)](https://doi.org/10.1093/restud/rdw057), Supplementary data, with the author's permission.
