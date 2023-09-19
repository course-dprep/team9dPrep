###############################################################
#############             PACKAGES               ##############
###############################################################
#GENERAL PACKAGES:
library(tidyverse) #A "Package of Packages" for Data manipulation and visualization (includes magrittr, lubridate, purrr, tidyr, etc.).
library(dplyr) #Data frame manipulations (select, slice, etc.
library(jsonlite) #For Amenities Columns Creation

#PLOT PACKAGES:
library(ggplot2) #Building fancy plots.
library(ggthemes) #Themes for ggplots (e.g. "solarized").
library(ggcorrplot) #For correlograms
library(scales) #Scaling and formatting ggplots (e.g. scale_fill_gradient()).
library(gt) #Latex tables

#REGRESSION PACKAGES
library(caret) #Hyperparameters Tuning. 
library(xgboost) #XGBoost Regression. 
library(DALEX) #Summary of the XGBoost Regression Model ("explainer).
library(bayesforecast) #Checking Regression Assumptions.
library(shiny) #For the ShinyApp
library(shinyWidgets) #For the ShinyApp





# Load the R object
data_for_testing <- readRDS("../../gen/analysis/input/data_for_testing.rds")

accommodates_mean <- readRDS("../../gen/analysis/input/accommodates_mean.rds")
accommodates_sd <- readRDS("../../gen/analysis/input/accommodates_sd.rds")

bedrooms_mean <- readRDS("../../gen/analysis/input/bedrooms_mean.rds")
bedrooms_sd <- readRDS("../../gen/analysis/input/bedrooms_sd.rds")

beds_mean <- readRDS("../../gen/analysis/input/beds_mean.rds")
beds_sd <- readRDS("../../gen/analysis/input/beds_sd.rds")

host_listings_count_mean <- readRDS("../../gen/analysis/input/host_listings_count_mean.rds")
host_listings_count_sd <- readRDS("../../gen/analysis/input/host_listings_count_sd.rds")

bathrooms_mean <- readRDS("../../gen/analysis/input/bathrooms_mean.rds")
bathrooms_sd <- readRDS("../../gen/analysis/input/bathrooms_sd.rds")

xgb_mod <- readRDS("../../gen/analysis/input/xgb_mod.rds")



#Setting the seed for reproducible results
set.seed(999)

#ShinyApp Data Preparation
dtest_conclusion <- data_for_testing %>%
  dplyr::slice(1)

rm(data_for_testing)


# Set to zero all relevant variables

#Host Listing Count
dtest_conclusion[, 3] <- 0

#Accommodates, bedrooms and beds
dtest_conclusion[, 6:8] <- 0

#Bathrooms
dtest_conclusion[, 20] <- 0

#Host Response Time
dtest_conclusion[, 30:33] <- 0

#Host is Superhost
dtest_conclusion[, 34] <- 0

#Host Verifications
dtest_conclusion[, 35:38] <- 0

#Neighbourhoods
dtest_conclusion[, 41:109] <- 0

#Property Type
dtest_conclusion[, 110:129] <- 0

#Paid Parking
dtest_conclusion[, 145] <- 0

#Dedicated WorkSpace
dtest_conclusion[, 147] <- 0

#Air Conditioning
dtest_conclusion[, 150] <- 0

#Elevator
dtest_conclusion[, 152] <- 0

#Free Parking
dtest_conclusion[, 153] <- 0




ui <- fluidPage(theme = shinytheme("simplex"),
  
  #PageHeader
  headerPanel('Price, Economic Return, and ROI Predictor'),
  
  #Side_Bar_for_User_Inputs
  sidebarPanel(
  radioButtons("paid_parking", "Do you have a paid parking on the house premises?", choices = c("YES" = "0", "NO" = "1"), selected = "0"),
  radioButtons("dedicated_workspace", "Is there a dedicated workspace in your house?", choices = c("YES" = "0", "NO" = "1"), selected = "0"),
  radioButtons("air_conditioning", "Does your house have an Air Conditioning System?", choices = c("YES" = "0", "NO" = "1"), selected = "0"),
  radioButtons("elevator", "Does your house have an Elevator?", choices = c("YES" = "0", "NO" = "1"), selected = "0"),
  radioButtons("free_parking", "Do you have a paid parking on the house premises?", choices = c("YES" = "0", "NO" = "1"), selected = "0"),
  
  radioButtons("superhost", "Are you a SuperHost?", choices = c("YES" = "1", "NO" = "0"), selected = "0"),
  
  numericInput("accommodates", "How many people does your house be able to accommodate?", 1, min = 1, max = 50),
  numericInput("bedrooms", "How many bedrooms are there in your house?", 1, min = 1, max = 50),
  numericInput("beds", "How many beds are there in your house", 1, min = 1, max = 50),
  numericInput("bathrooms", "How many bathrooms are there in your house?", 1, min = 1, max = 50),
  
  
  sliderInput("listings_count", "How many houses, rooms, or apartments have you already listed on Airbnb?", min = 1, max = 30, value = 1, step = 1),
  
  pickerInput("neighbourhood", "In which neighbourhood of Milan is your house located?", choices = c("AFFORI", "BAGGIO", "BANDE_NERE", "BARONA", "BICOCCA", "BOVISA", "BOVISASCA", "BRERA", "BRUZZANO", "BUENOS_AIRES_VENEZIA", "CANTALUPA", "CASCINA_TRIULZA_EXPO", "CENTRALE", "CHIARAVALLE", "CITTA_STUDI", "COMASINA", "CORSICA", "DE_ANGELI_MONTE_ROSA", "DERGANO", "DUOMO", "EX_OM_MORIVIONE", "FARINI", "FIGINO", "FORZE_ARMATE", "GALLARATESE", "GARIBALDI_REPUBBLICA", "GHISOLFA", "GIAMBELLINO", "GIARDINI_PORTA_VENEZIA", "GRATOSOGLIO_TICINELLO", "GRECO", "GUASTALLA", "ISOLA", "LAMBRATE", "LODI_CORVETTO", "LORENTEGGIO", "LORETO", "MACIACHINI_MAGGIOLINA", "MAGENTA_SAN_VITTORE", "MAGGIORE_MUSOCCO", "MECENATE", "MUGGIANO", "NAVIGLI", "NIGUARDA_CA_GRANDA", "ORTOMERCATO", "PADOVA", "PAGANO", "PARCO_AGRICOLO_SUD", "PARCO_BOSCO_IN_CITTA", "PARCO_DEI_NAVIGLI", "PARCO_DELLE_ABBAZIE", "PARCO_FORLANINI_ORTICA", "PARCO_LAMBRO_CIMIANO", "PARCO_MONLUE_PONTE_LAMBRO",  "PARCO_NORD",  "PARCO_SEMPIONE", "PORTA_ROMANA", "PORTELLO", "QT_8", "QUARTO_CAGNINO", "QUARTO_OGGIARO", "QUINTO_ROMANO", "QUINTOSOLE", "RIPAMONTI", "ROGOREDO", "RONCHETTO_SUL_NAVIGLIO", "SAN_CRISTOFORO", "SAN_SIRO", "SACCO", "SARPI", "SCALO_ROMANA", "SELINUNTE", "STADERA", "TIBALDI", "TICINESE", "TORTONA", "TRE_TORRI", "TRENNO", "TRIULZO_SUPERIORE", "UMBRIA_MOLISE", "VIALE_MONZA", "VIGENTINA", "VILLAPIZZONE", "WASHINGTON", "XXII_MARZO"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  pickerInput("response_time", "How quickly do you guarantee a response to potential customers? ", choices = c("FEW_DAYS", "A_DAY", "FEW_HOURS", "AN_HOUR"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  pickerInput("property_type", "What type of listing do you want to rent on Airbnb?", choices = c("CASA_PARTICULAR", "ENTIRE_CONDO", "ENTIRE_GUEST_SUIT", "ENTIRE_GUEST_HOUSE", "ENTIRE_HOME", "ENTIRE_APARTMENT", "ENTIRE_LOFT", "ENTIRE_PLACE", "ENTIRE_RENTAL_UNIT", "ENTIRE_SERVICED_APARTMENT", "ENTIRE_TOWN_HOUSE", "ENTIRE_VACATION_HOME", "ENTIRE_VILLA", "PRIVATE_ROOM", "PRIVATE_ROOM_IN_B&B", "PRIVATE_ROOM_IN_CASA_PARTICULAR", "PRIVATE_ROOM_IN_CONDO", "PRIVATE_ROOM_IN_FARM_STAY", "PRIVATE_ROOM_IN_GUEST_SUIT", "PRIVATE_ROOM_IN_GUESTHOUSE", "PRIVATE_ROOM_IN_HOME", "PRIVATE_ROOM_IN_HOSTEL", "PRIVATE_ROOM_IN_LOFT", "PRIVATE_ROOM_IN_RENTAL_UNIT", "PRIVATE_ROOM_IN_SERVICED_APARTMENT", "PRIVATE_ROOM_IN_TINY_HOME", "PRIVATE_ROOM_IN_TOWN_HOUSE", "PRIVATE_ROOM_IN_VACATION_HOME", "PRIVATE_ROOM_IN_VILLA", "ROOM_IN_APARTHOTEL", "ROOM_IN_B&B", "ROOM_IN_BOUTIQUE_HOTEL", "ROOM_IN_HOSTEL", "ROOM_IN_HOTEL", "ROOM_IN_SERVICED_APARTMENT", "SHARED_ROOM_IN_B&B", "SHARED_ROOM_IN_CONDO", "SHARED_ROOM_IN_HOME", "SHARED_ROOM_IN_HOSTEL", "SHARED_ROOM__IN_LOFT", "SHARED_ROOM_IN_RENTAL_UNIT", "TINY_HOME"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  pickerInput("host_verification", "By what means will you be verifified by Airbnb Platform?", choices = c("EMAIL", "PHONE", "EMAIL_AND_PHONE", "EMAIL_AND_WORK_EMAIL", "PHONE_AND_WORKEMAIL", "NO_VERIFICATION"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  
  numericInput("rent_nights", "How many nights will the house be rented out per year?", 1, min = 1, max = 365),
  sliderInput("investment", "How much will it cost to build the house?", min = 0, max = 4000000, value = 1, step = 200000),
  actionButton("build_button", "Build the House")
),

mainPanel(
  actionButton("economic_return_button", "Calculate the Yearly Economic Return"),
  verbatimTextOutput("economic_return_result"),
  hr(),
  actionButton("roi_button", "Calculate ROI"), verbatimTextOutput("roi_result")
  )
)




#SERVER

server <- function(input, output) {
  # Define reactive input values
  pool_reactive <- reactive(ifelse(input$pool == "1", TRUE, FALSE))
  gym_reactive <- reactive(ifelse(input$gym == "1", TRUE, FALSE))
  air_conditioning_reactive <- reactive(ifelse(input$air_conditioning == "1", TRUE, FALSE))
  garden_reactive <- reactive(ifelse(input$garden == "1", TRUE, FALSE))
  elevator_reactive <- reactive(ifelse(input$elevator == "1", TRUE, FALSE))
  sauna_reactive <- reactive(ifelse(input$sauna == "1", TRUE, FALSE))
  superhost_reactive <- reactive(ifelse(input$superhost == "1", TRUE, FALSE))
  accommodates_reactive <- reactive(input$accommodates)
  bedrooms_reactive <- reactive(input$bedrooms)
  beds_reactive <- reactive(input$beds)
  rent_nights_reactive <- reactive(input$rent_nights)
  neighbourhood_reactive <- reactive({ input$neighbourhood })
  response_time_reactive <- reactive({ input$response_time })
  property_type_reactive <- reactive({ input$property_type })
  host_verification_reactive <- reactive({ input$host_verification })

  
  # Define reactive for predicted price
  predicted_price_reactive <- reactive({
  data <- dtest_conclusion[1, ]
  
  data$PoolYES <- ifelse(pool_reactive(), 1, 0)
  data$GymYES <- ifelse(gym_reactive(), 1, 0)
  data$Air_conditioningYES <- ifelse(air_conditioning_reactive(), 1, 0)
  data$GardenYES <- ifelse(garden_reactive(), 1, 0)
  data$ElevatorYES <- ifelse(elevator_reactive(), 1, 0)
  data$SaunaYES <- ifelse(sauna_reactive(), 1, 0)
  data$HOST_IS_SUPERHOST <- ifelse(superhost_reactive(), 1, 0)
  data$accommodates <- (accommodates_reactive() - accommodates_mean) / accommodates_sd
  data$bedrooms <- (bedrooms_reactive() - bedrooms_mean) / bedrooms_sd
  data$beds <- (beds_reactive() - beds_mean) / beds_sd
 
  column_name_1 <- paste0("NEIGHBOURHOOD_", neighbourhood_reactive())
  data[, column_name_1] <- 1
  column_name_2 <- paste0("HOST_RESPONSE_TIME_", response_time_reactive())
  data[, column_name_2] <- 1
  column_name_3 <- paste0("PROPERTY_TYPE_", property_type_reactive())
  data[, column_name_3] <- 1
  column_name_4 <- paste0("HOST_VERIFICATIONS_", host_verification_reactive())
  data[, column_name_4] <- 1

  data_matrix <- xgb.DMatrix(data = as.matrix(data))
  predicted_price <- predict(xgb_mod, data_matrix)
  predicted_price <- round(10^predicted_price, 3)
  return(predicted_price)
})
  
  observeEvent(input$build_button, {
    predicted_price_reactive()
  })
  
  
  #Calculate Economic Return
  observeEvent(input$economic_return_button, {
    predicted_price <- predicted_price_reactive()
    annual_return <- predicted_price * rent_nights_reactive()
    year_for_ROI <- round(input$investment / annual_return)
    output$economic_return_result <- renderPrint({
      paste("If the price (per night) of the new flat will be, as predicted by our model, equal to", predicted_price,"€, and the flat will be rented for", rent_nights_reactive(), "nights, then, over the course of a year,the host will have an economic return of approximately", round(annual_return), "€.")
    })})
  
  
    # Calculate ROI
  observeEvent(input$roi_button, {
    predicted_price <- predicted_price_reactive()
    annual_return <- predicted_price * rent_nights_reactive()
    year_for_ROI <- round(input$investment / annual_return)
    output$roi_result <- renderPrint({
      paste("Therefore, if the investment is equal to: ", input$investment, "€, and the annual economic return will be equal to", round(annual_return), "€ it will take approximately", year_for_ROI, "years for recovering the whole investment")
    })
  })
}

shinyApp(ui, server)





