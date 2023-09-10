---
title: "Data Cleansing"
subtitle: "SKILLS: Data Preparation and Workflow Management - Group 9"
author:
  - "Rabino Tommaso"
  - "Franceschini Emanuele"
  - "Magalotti Bianca"
  - "Tan Colin"
  - "Benmrit Akram"
date: "\\textit{20 October 2024}"
output:
  pdf_document:
    latex_engine: xelatex
    toc: true
    toc_depth: 2
    number_sections: true
    fig_caption: true
header-includes:
  - "\\usepackage[english]{babel}"  # Language
  - "\\usepackage[T1]{fontenc}"  # Font encoding
  - "\\usepackage{mathptmx}"  # Times New Roman font for text
  - "\\usepackage{helvet}"  # Arial-like font for sans-serif
  - "\\usepackage{setspace}"  # Line spacing
  - "\\onehalfspacing"  # 1.5 line spacing
  - "\\usepackage{fancyhdr}"  # Header and footer customization
  - "\\usepackage{titlesec}"  # Section titles formatting
  - "\\usepackage{abstract}"  # Abstract formatting
  - "\\usepackage{caption}"  # Captions customization
  - "\\usepackage{graphicx}"  # Graphics
  - "\\usepackage{amsmath}"  # Math equations
  - "\\usepackage{amssymb}"  # Math symbols
  - "\\usepackage{natbib}"  # Citation style (change as needed)
  - "\\bibliographystyle{apalike}"  # Bibliography style (change as needed)
  - "\\usepackage{hyperref}"  # Hyperlinks and URLs
  - "\\hypersetup{colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue}"
  - "\\usepackage{appendix}"  # Appendix formatting
  - "\\usepackage{enumerate}"  # Enumerate environment
  - "\\pagestyle{fancy}"  # Custom page style
  - "\\fancyhf{}"
  - "\\renewcommand{\\headrulewidth}{0pt}"
  - "\\renewcommand{\\footrulewidth}{0pt}"
  - "\\fancyhead[R]{\\thepage}"  # Page number in the header
  - "\\fancypagestyle{plain}{\\fancyhf{}\\renewcommand{\\headrulewidth}{0pt}}"
  - "\\lhead{\\small{A.A. 2023/2024-Courses: SKILLS: Data Preparation and Workflow Management}}"
  - "\\usepackage{multicol}"  # For two columns
geometry: "left=2.5cm, right=1.5cm, top=2.5cm, bottom=2.5cm"  # Adjust margins
---



```{r, include=FALSE}
knitr::opts_chunk$set(tidy = FALSE,
                      size = "small",
                      out.width = "100%",
                      message = FALSE,
                      warning = FALSE,
                      error = FALSE)
```


```{r, include = FALSE}
###############################################################
#############             PACKAGES               ##############
###############################################################
#GENERAL PACKAGES:
library(tidyverse) #A "Package of Packages" for Data manipulation and visualization (includes magrittr, lubridate, purrr, tidyr, etc.).
library(dplyr) #Data frame manipulations (select, slice, etc.
library(kableExtra) #Building fancy tables.
library(knitr)

#PLOT PACKAGES:
library(ggplot2) #Building fancy plots.
library(ggcorrplot) #Building fancy Correlograms.
library(ggthemes) #Themes for ggplots (e.g. "solarized").
library(scales) #Scaling and formatting ggplots (e.g. scale_fill_gradient()).
library(leaflet) #Building interactive Map
library(ggExtra) #Building "marginal" plots
library(gt) #Latex tables
```


```{r, echo=FALSE}
load("../../data/dataset1/italian_AirBnb_listings.RData")
```












\newpage
\section{Introduction}
In this document, the data manipulation procedures applied to the original dataset are outlined. These procedures encompass the incorporation of new features, the conversion of variables into alternative formats, and the data cleansing process. These manipulations are indispensable for assuring the quality and appropriateness of the dataset for constructing the regression model.

\begin{enumerate}
    \item[\Roman{enumi}I.] Management of Empty Columns: Removal of the variables \texttt{calendar\_updated} and \texttt{bathrooms} from the dataset due to their sole containment of missing values.
    \item[\Roman{enumi}II.] Management of Price Outliers: Subsequent removal of observations with outliers in the \texttt{price} variable, as it serves as the dependent variable (DV) in our regression model.
    \item[\Roman{enumi}III.] Management of Unnecessary Variables: Elimination of variables that lack relevance to our regression model, such as \texttt{listing\_url}.
    \item[\Roman{enumi}IV.] Management of Character Variables: Conversion of specific variables from a "character" format to "date" and "factor" formats to ensure compatibility with our regression model, which exclusively accommodates "factor" and "numeric" formats.
    \item[\Roman{enumi}V.] Management of the Amenities Variable: Utilization of the \texttt{amenities} variable to generate a series of Boolean variables, indicating the provision of specific services within a listing, including "pool," "gym," "garden," "elevator," "oven," and more.
    \item[\Roman{enumi}VI.] Management of the \texttt{property\_type} and \texttt{neighbourhood\_cleansed} Variables: Removal of certain levels within the \texttt{property\_type} and \texttt{neighbourhood\_cleansed} (factor) variables, characterized by minimal observations, to alleviate the computational burden of our regression model.
    \item[\Roman{enumi}VII.] Management of Observations with Missing Values: Ultimate elimination of all observations containing missing values (NAs) across any variables within the dataset, acknowledging the incompatibility of regression models and correlations with missing data.
\end{enumerate}

\section{Manage empty coloumns}
Code for showing the number of columns that contains only missing values:

```{r}
cols_to_remove <- sapply(data_merged, function(x) all(is.na(x)))
indices <- which(unlist(cols_to_remove))
names_list <- names(cols_to_remove)[indices]
cat('There are only', length(names_list), 'columns with only missing values')
```

Code for extracting the names of columns with only missing values: 
```{r}
cat('Names of columns with only missing values:', names_list)
```

Code for removing columns with only missing values: 
```{r}
raw_data <- data_merged %>%
  select(-which(cols_to_remove))
```


As can be seen from the output below, once `calendar_updated` and `bathroom` have been removed, there are no other columns containing only NAs. 

```{r}
cols_to_remove <- sapply(raw_data, function(x) all(is.na(x)))
indices <- which(unlist(cols_to_remove))
names_list <- names(cols_to_remove)[indices]
cat("Now, there are", length(names_list), "columns containing only missing values")
```


```{r, echo=FALSE}
rm(indices, cols_to_remove, names_list, data_merged)
```

















\section{Manage Price Outliers}
In the initial phase of our analysis, emphasis was placed on addressing the presence of outliers within our dataset, particularly among numerical predictors. It is noteworthy that while the absence of outliers is often considered a beneficial practice for enhancing regression model performance, it does not represent an absolute requirement for regression analysis. Given this perspective, we directed our attention specifically to outliers within our response variable, which is the listings' \texttt{price}.

To explore potential strategies for handling outliers, we conducted experiments involving the replacement of outliers with both the mean and median values of the \texttt{price} variable. However, these approaches yielded unsatisfactory outcomes, leading to a decline in the overall performance of the final model.

Consequently, we made the decision to adopt a straightforward approach: the removal of observations exhibiting outliers concerning the \texttt{price} variable. Following an initial exploratory analysis, it was determined that listings with prices exceeding the 99th percentile would be excluded from the dataset.

The initial step in this process involved converting the \texttt{price} variable into a numeric format, which also entailed the removal of all non-numeric characters, such as dollar signs and commas. The code snippet below illustrates the procedure:
```{r}
raw_data <- raw_data %>%
  mutate(price = as.numeric(str_replace_all(price, "[^0-9.]", "")))
str(raw_data$price)
```

Outliers within the \texttt{price} variable are readily discernible through visual examination of \texttt{Figure 1} and \texttt{Figure 2}, illustrating the distribution of the \texttt{price} variable.

Conforming to the principles of regression analysis, where the presence of outliers contravenes underlying assumptions, a systematic removal process was applied to eliminate such data points from our dataset prior to model construction.

```{r, include=FALSE}
# Plot 1: Histogram
p1 <- ggplot(raw_data, aes(price)) +
  geom_histogram(binwidth = 100, col = "darkgrey", fill = alpha("grey", 0.5)) +
  scale_y_log10() +
  scale_x_continuous(labels = dollar_format(), n.breaks = 5) +
  labs(x = "Price",
       y = "Number of Listings",
       caption = element_text("Figure 1", color = "black"),
       title = element_text("Number of Listings by Price Class", color = "black"),
       subtitle = element_text("Data collected from Listings dataset", color = "black")) +
  theme_minimal() +
  theme(text = element_text(family = "serif"),
        plot.title = element_text(size = 16, hjust = 0.5, color = "black"),
        plot.subtitle = element_text(size = 12, hjust = 0.5, color = "black"),
        axis.title = element_text(size = 14, color = "black"),  # Black axis title
        axis.text = element_text(size = 12, color = "black"),  # Black axis text
        panel.grid.major = element_line(color = "gray", size = 0.5),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white"))

# Plot 2: Box Plot
p2 <- ggplot(raw_data, aes(y = price)) +
  geom_boxplot(varwidth = TRUE, col = "darkgrey", fill = alpha("grey", 0.5)) +
  scale_y_continuous(labels = dollar_format(), n.breaks = 5) +
  labs(title = element_text("Box Plot of Listings by Price Class", color = "black"),
       subtitle = element_text("Data collected from Listings dataset", color = "black"),
       caption = element_text("Figure 2", color = "black"),
       x = NULL,
       y = "Price") +
  theme_minimal() +
  theme(text = element_text(family = "serif"),
        plot.title = element_text(size = 16, hjust = 0.5, color = "black"),
        plot.subtitle = element_text(size = 12, hjust = 0.5, color = "black"),
        axis.title = element_text(size = 14, color = "black"),  # Black axis title
        axis.text = element_text(size = 12, color = "black"),  # Black axis text
        panel.grid.major = element_line(color = "gray", size = 0.5),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white")) +
  coord_flip()
```


```{r, echo=FALSE}
p1
p2
rm(p1, p2)
```

As illustrated in the table below, a significant proportion of outliers are situated beyond the 99th percentile threshold. Consequently, prior to model construction, the decision was made to exclude these listings from our dataset.
```{r, include = FALSE}
# Create the table
price_percentiles <- quantile(raw_data$price, c(0.50, 0.75, 0.80, 0.90, 0.95, 0.96, 0.97, 0.98, 0.99, 0.999, 1))

df_percentiles <- data.frame(percentile_range = names(price_percentiles), 
                             price = price_percentiles,
                             row.names = NULL)

# Style the table
t1 <- df_percentiles %>%
  gt() %>%
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = everything())
  ) %>%
  tab_header(
    title = "Table of Percentiles",
    subtitle = "Average Price by Percentile Range",
  ) 
```

```{r, echo=FALSE}
t1
rm(t1)
```

The subsequent code demonstrates the procedure for eliminating observations from the dataset whose prices exceed the 99th percentile:
```{r}
raw_data <- raw_data %>%
  dplyr::filter (price <= quantile(raw_data$price, probs = c(0.99)))
```

With the removal of outliers surpassing the 99th percentile, there is a notable enhancement in the distribution of prices among apartments, as evident in \texttt{Figures 3} and in \texttt{Figure 4}:


```{r, include = FALSE}

# Plot 3: Histogram
p3 <- ggplot(raw_data, aes(price)) +
  geom_histogram(binwidth = 100, col = "darkgrey", fill = alpha("grey", 0.5)) +
  scale_y_log10() +
  scale_x_continuous(labels = dollar_format(), n.breaks = 5) +
  labs(x = "Price",
       y = "Number of Listings",
       title = element_text("Number of Listings by Price Class", color = "black"),
       caption = element_text("Figure 3", color = "black"),
       subtitle = element_text("Data collected from Listings dataset", color = "black")) +
  theme_minimal() +
  theme(text = element_text(family = "serif"),
        plot.title = element_text(size = 16, hjust = 0.5, color = "black"),
        plot.subtitle = element_text(size = 12, hjust = 0.5, color = "black"),
        axis.title = element_text(size = 14, color = "black"),  # Black axis title
        axis.text = element_text(size = 12, color = "black"),  # Black axis text
        panel.grid.major = element_line(color = "gray", size = 0.5),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white"))

# Plot 4: Box Plot
p4 <- ggplot(raw_data, aes(y = price)) +
  geom_boxplot(varwidth = TRUE, col = "darkgrey", fill = alpha("grey", 0.5)) +
  scale_y_continuous(labels = dollar_format(), n.breaks = 5) +
  labs(title = element_text("Box Plot of Listings by Price Class", color = "black"),
       subtitle = element_text("Data collected from Listings dataset", color = "black"),
       caption = element_text("Figure 4", color = "black"),
       x = NULL,
       y = "Price") +
  theme_minimal() +
  theme(text = element_text(family = "serif"),
        plot.title = element_text(size = 16, hjust = 0.5, color = "black"),
        plot.subtitle = element_text(size = 12, hjust = 0.5, color = "black"),
        axis.title = element_text(size = 14, color = "black"),  # Black axis title
        axis.text = element_text(size = 12, color = "black"),  # Black axis text
        panel.grid.major = element_line(color = "gray", size = 0.5),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white")) +
  coord_flip()


rm(price_percentiles, df_percentiles)
```

```{r, echo=FALSE}
p3
p4
rm(p3, p4)
```

The enhancement in the distribution of the \texttt{price} variable is also discernible from the subsequent output, presenting a summary of the variable's statistics:
```{r}
summary(raw_data$price)
```










\section{Manage Unuseful Variables}
During this phase of the project, the 'select' function was utilized to identify and exclude variables that were deemed irrelevant for our price prediction analysis. The selection of variables for removal was made in accordance with the following criteria, with a focus on minimizing the number of exclusions:

\begin{enumerate}
    \item[\Roman{enumi}I.] Format Criteria: The majority of removed variables were in 'character' format.
    \item[\Roman{enumi}II.] Usefulness Criteria: Removal of variables that were clearly irrelevant for predicting listings' prices.
    \item[\Roman{enumi}III.] Redundancy Criteria: Removal of variables that overlapped each other and carried the same information (this was also to avoid multicollinearity, more on this later in this project).
    \item[\Roman{enumi}IV.] Consistency Criteria: Removal of variables present only in certain data sets.
\end{enumerate}

Following these guidelines, we chose to remove the following variables:
```{r, include=FALSE}
# Create a data frame with your itemized list
itemized_list <- data.frame(
  Variable = c(
    "id", "listing_url", "scrape_id", "last_scraped", "source",
    "name", "description", "neighborhood_overview", "picture_url",
    "host_id", "host_url", "host_name", "host_location", "host_about",
    "host_thumbnail_url", "host_picture_url", "host_neighbourhood",
    "neighbourhood", "neighbourhood_cleansed_group",
    "minimum_minimum_nights", "maximum_minimum_nights",
    "minimum_maximum_nights", "maximum_maximum_nights",
    "minimum_nights_avg_ntm", "maximum_nights_avg_ntm",
    "calendar_last_scraped", "license",
    "calculated_host_listings_count",
    "calculated_host_listings_count_entire_homes",
    "calculated_host_listings_count_private_rooms",
    "calculated_host_listings_count_shared_rooms"
  ),
  Description = c(
    "unique identifier for the listing",
    "URL of the listing",
    "ID of the data scrape",
    "last update of data set",
    "source from which the listing information were scraped",
    "title of the ad placed by the host on the AirBnb platform",
    "brief description of the listing",
    "brief description of the neighborhood",
    "URL of listings' pictures",
    "unique identifier for hosts",
    "URL of the host",
    "name of the host",
    "city of hosts' residence",
    "brief description of the hosts",
    "URL of the hosts' thumbnail pictures",
    "URL of the hosts' pictures",
    "host's neighborhood",
    "neighborhood (neighbourhood_cleansed was more informative)",
    "neighborhood_cleansed_group (only available for regions)",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy",
    "to avoid redundancy"
  )
)

t2 <- itemized_list %>%
  gt() %>%
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = everything())
  ) %>%
  tab_header(
    title = "Variables to Remove"
  )

```

```{r, echo=FALSE}
t2
rm(t2, itemized_list)
```


The following code, which implies the use of the \texttt{select} function, is used to remove those variables: 
```{r}
raw_data <- raw_data %>%
  dplyr::select (-id, -listing_url, -scrape_id, -last_scraped, -source, -name, -description, -neighborhood_overview, -picture_url, -host_id, -host_url, -host_name, -host_location, -host_about, -host_thumbnail_url, -host_picture_url,-host_neighbourhood, -neighbourhood, -neighbourhood_group_cleansed, -minimum_minimum_nights, -maximum_minimum_nights, -minimum_maximum_nights, -maximum_maximum_nights, -minimum_nights_avg_ntm, -maximum_nights_avg_ntm, -calendar_last_scraped, -license, -calculated_host_listings_count, -calculated_host_listings_count_entire_homes, -calculated_host_listings_count_private_rooms, -calculated_host_listings_count_shared_rooms)
```

The following character variables remain. Subsequent scripts will address these variables.  
```{r}
char_cols <- names(raw_data[,sapply(raw_data, is.character)])
cat('There are', length(char_cols), 'columns in character format and they are the following:')
```


```{r, echo=FALSE}
char_cols <- data.frame(Variable = char_cols)

t3 <-char_cols %>%
  gt() %>%
  tab_style(
    style = cell_text(weight = "bold"),
    locations = cells_column_labels(columns = everything())
  ) %>%
  tab_header(
    title = "Character Variables",
    subtitle = "List of Remaining Character Variables",
  )

t3
rm(t3)
```










\section{Manage Character Variables}
These scripts was used for the conversion of specific variables from character to date and factor formats, a crucial step to ensure the compatibility of our dataset with regression analysis.

The transformation of these variables holds significance as character variables would have imposed limitations on the scope of our model. These conversions now enable the incorporation of these variables into our regression analysis, expanding the analytical possibilities of our study.

\textbf{Date Variables:} Code for converting 'character' variable into 'date' format: 
```{r}
date_cols <- c("host_since", "first_review", "last_review")
raw_data <- raw_data %>%
  mutate_at(vars(all_of(date_cols)), ~as.Date(., format = "%Y-%m-%d"))
```

```{r, include=FALSE}
rm(date_cols)
```

\textbf{Numeric Variables 1:} Code for handling the \texttt{host\_response\_rate} and \texttt{host\_acceptance\_rate} variables involved several steps. Initially, we substituted "N/A" with "0%", following which we eliminated the '%' symbols. Subsequently, we altered the variables to a numeric format and concluded by modifying the variable names, appending "_percentage."

The decision to replace "N/A" with "0%" was founded on the realization that these particular observations did not indicate missing values. Instead, the absence of data regarding the host's response and acceptance rates stemmed from the host's recent enrollment, rendering this information currently unavailable (Refer to the InsideAirBnb documentation for additional information on this topic). 

```{r}
raw_data <- raw_data %>%
  mutate_at(vars(host_response_rate, host_acceptance_rate), ~gsub("N/A", "0%", .)) %>%
  mutate_at(vars(host_response_rate, host_acceptance_rate), ~as.numeric(gsub("%", "", .))) %>%
  rename(host_response_time_percentage = host_response_rate, host_acceptance_rate_percentage = host_acceptance_rate)
```

\textbf{Numeric Variables 2:} The processing of the bathrooms_text variable encompassed multiple steps. Initially, extraneous text was eliminated, retaining only the actual number of bathrooms. Subsequently, the column underwent a conversion to a numeric format. Finally, the variable name was changed to "bathroom."

```{r}
raw_data <- raw_data %>%
  mutate(bathrooms_text = gsub("[^0-9.]", "", bathrooms_text)) %>%
  mutate(bathrooms = as.numeric(bathrooms_text)) %>%
  select(-bathrooms_text)
```

\textbf{Factor Variables:} The remaining 'character' variables were systematically transformed into 'factor' format using the following code:

```{r}
factor_cols <- c(
  "host_response_time", "host_is_superhost", "host_verifications",
  "host_has_profile_pic", "host_identity_verified", "neighbourhood_cleansed",
  "room_type", "property_type", "instant_bookable", "has_availability")

raw_data <- raw_data %>%
  mutate_at(vars(all_of(factor_cols)), as.factor)
```

```{r, include=FALSE}
rm(factor_cols)
```


As shown below, presently only one 'character' variable remains. Subsequent scripts will address this variable as well.
```{r}
char_cols <- raw_data %>% 
  select_if(is.character) %>% 
  names()

cat('Now, there is only', length(char_cols), 'column in character format and it is the following:', char_cols)
```


