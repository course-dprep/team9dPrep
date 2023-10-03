# Predict Italian Airbnb Listings Prices - Dataset Description
![image](https://www.digital.ink/wp-content/uploads/airbnb_logo_detail.jpg)

---

# Contributors
  - [B. Magalotti](mailto:b.magalotti@tilburguniversity.it)
  - [E. Franceschini](mailto:e.franceschini@tilburguniversity.it)
  - [A. Benmrit](mailto:a.benmrit@tilburguniversity.it)
  - [C. Tan](mailto:c.tan@tilburguniversity.it)
  - [T. Rabino](mailto:t.rabino@tilburguniversity.it)

---

# Motivation of Data Collection
The intent behind the collection of this data was to address the burgeoning need for advanced, data-driven strategies in the realm of property management within the Italian Airbnb market. Given the continued expansion of Airbnb listings in the region, there is an escalating need for hosts to strategize their listing prices effectively to remain competitive and maximize profitability.

In light of these industry dynamics, the primary motivation of this research is to equip Airbnb hosts with the tools and insights required to make informed pricing decisions, leveraging detailed exploratory data analysis and predictive regression models.

The broader objective is to foster an enriched Airbnb experience, allowing hosts to optimize their offerings and guests to find listings that offer the best value for their investment.

---

# Composition of the Dataset

The dataset used for the present project comprises 23,142 observations, each corresponding to individual Airbnb listings in Milan, spanning 75 variables that offer diverse insights into listing characteristics, management, and performance.

It's crucial to highlight that not all listed variables will be utilized in subsequent analyses. Some will be omitted due to their lack of relevance or contribution to the analytical objectives of this project. Conversely, in the course of analysis, certain feature engineering operations were applied to create new variables. This enhances the encapsulation and representation of information in the dataset, facilitating a more comprehensive understanding of trends, patterns, and insights. Finally, due to data cleaning operations, the number of observations in the dataset may vary.

Here’s an overview of what each (origianl) variable represents:

| Variable                              | Description                                                                   |
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

# Collection Process

The data was gathered from [Inside Airbnb]( http://insideairbnb.com/), a website operated directly by Airbnb that provides publicly available dataset of Airbnb listings. This platform provides the most recent version of required data for a multitude of cities around the world, allowing users to download specific datasets for their specific needs. 

Specifically, the website provides both a downloader page, where the dataset can be freely downloaded ([Inside Airbnb: Get the Data](http://insideairbnb.com/get-the-data)), and an explorer page, where a user-friendly tool enables users to analyze and explore specific listings dataset ([Inside Airbnb: Explore]( http://insideairbnb.com/explore)).

For the purposes of this project, the dataset used was “listings.csv.gz”, representing the detailed listings data specifically for the city of Milan, last update 21 June, 2023. The dataset can be downloaded and explored from the following two links: [Inside Airbnb: Milan Listings Downloader]( http://data.insideairbnb.com/italy/lombardy/milan/2023-09-13/data/listings.csv.gz); [Inside Airbnb: Milan Listings Explorer]( http://insideairbnb.com/milan).


---

# Data Processing, Cleaning, and Labelling

1. **Management of Empty Columns:**
   - Removed variables `calendar_updated`, `neighbourhood_group_cleansed`, and `bathrooms` from the dataset due to their sole containment of missing values.

2. **Management of Unnecessary Variables:**
   - Eliminated variables lacking relevance to the regression model, as listed below:

   | Variable                                    | Description                                                |
|---------------------------------------------|------------------------------------------------------------|
| `id`                                        | Unique identifier for the listing.                          |
| `listing_url`                               | URL of the listing.                                        |
| `scrape_id`                                 | ID of the data scrape.                                     |
| `last_scraped`                              | Last update of the data set.                               |
| `source`                                    | Source from which the listing information was scraped.     |
| `name`                                      | Title of the ad placed by the host on the Airbnb platform.  |
| `description`                               | Brief description of the listing.                           |
| `neighborhood_overview`                     | Brief description of the neighborhood.                     |
| `picture_url`                               | URL of the listing's pictures.                             |
| `host_id`                                   | Unique identifier for hosts.                               |
| `host_url`                                  | URL of the host.                                           |
| `host_name`                                 | Name of the host.                                          |
| `host_location`                             | City of the host's residence.                               |
| `host_about`                                | Brief description of the hosts.                            |
| `host_thumbnail_url`                        | URL of the hosts' thumbnail pictures.                      |
| `host_picture_url`                          | URL of the hosts' pictures.                                |
| `host_neighbourhood`                        | Host's neighborhood.                                       |
| `neighbourhood`                             | Neighborhood (neighbourhood_cleansed was more informative).|
| `minimum_minimum_nights`                    | To avoid redundancy.                                       |
| `maximum_minimum_nights`                    | To avoid redundancy.                                       |
| `minimum_maximum_nights`                    | To avoid redundancy.                                       |
| `maximum_maximum_nights`                    | To avoid redundancy.                                       |
| `minimum_nights_avg_ntm`                    | To avoid redundancy.                                       |
| `maximum_nights_avg_ntm`                    | To avoid redundancy.                                       |
| `calendar_last_scraped`                     | To avoid redundancy.                                       |
| `license`                                   | To avoid redundancy.                                       |
| `calculated_host_listings_count`            | To avoid redundancy.                                       |
| `calculated_host_listings_count_entire_homes`| To avoid redundancy.                                       |
| `calculated_host_listings_count_private_rooms`| To avoid redundancy.                                      |
| `calculated_host_listings_count_shared_rooms`| To avoid redundancy.                                      |


3. **Management of Observations with Missing Values:**
   - Eliminated all observations containing missing values (NAs) across any variables within the dataset to ensure compatibility with regression models.

4. **Management of Price Outliers:**
   - Removed observations with outliers in the `price` variable, the dependent variable in the regression model.

5. **Management of the Amenities Variable:**
   - Utilized the `amenities` variable to generate Boolean variables indicating the provision of specific services within a listing, such as "dedicated workspace," "parking," "oven," "elevator," and "essentials."

6. **Management of Factor Variables:**
   - Removed certain levels within factor variables (`host_response_time`, `host_is_superhost`, `host_verifications`, `property_type`, and `neighbourhood_cleansed`) to alleviate computational burden.

7. **Removal of Highly Correlated Predictors:**
   - Addressed multicollinearity issues by removing predictors that exhibited high correlation.

8. **Logarithm Transformation of Price:**
   - Computed and used the logarithm of the `price` variable to address its high skewness.

9. **Conversion of Date Predictors:**
   - Converted date predictors into numerical format by extracting the day, month, and year for each.

10. **One-Hot Encoding:**
    - Applied one-hot encoding to all categorical, binomial, and factorial variables to transform them into numerical format.

11. **Centering and Scaling:**
    - Centered and scaled numeric predictors to ensure consistent scales for improved model performance.

These comprehensive data preparation and cleaning steps were undertaken to enhance the quality and relevance of the dataset for building an effective regression model to predict Milan Airbnb listing prices.



---

# Data Processing, Cleaning, and Labelling







