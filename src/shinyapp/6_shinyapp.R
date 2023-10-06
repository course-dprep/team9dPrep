###############################################################
#############             PACKAGES               ##############
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


#Setting the seed for reproducible results
set.seed(999)


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


# Load the R object
data_for_training <- readRDS("../../gen/analysis/input/data_for_training.rds")

xgb_mod <- readRDS("../../gen/analysis/input/xgb_mod.rds")

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




# Set to zero all relevant variables

#Host Listing Count
data_for_training[, 3] <- 0

#Accommodates, bedrooms and beds
data_for_training[, 6:8] <- 0

#Bathrooms
data_for_training[, 20] <- 0


#Host is Superhost
data_for_training[, 34] <- 0

#Host Verifications
data_for_training[, 35:38] <- 0

#Neighbourhoods
data_for_training[, 41:109] <- 0

#Property Type
data_for_training[, 110:129] <- 0

#Paid Parking
data_for_training[, 145] <- 0

#Dedicated WorkSpace
data_for_training[, 147] <- 0

#Air Conditioning
data_for_training[, 150] <- 0

#Elevator
data_for_training[, 152] <- 0

#Free Parking
data_for_training[, 153] <- 0

data_for_training <- data_for_training[1, ]


ui <- fluidPage(
  
  #PageHeader
  headerPanel('Price, Economic Return, and ROI Predictor'),
  
  #Side_Bar_for_User_Inputs
  sidebarPanel(
  radioButtons("paid_parking", "Do you have a paid parking on the house premises?", choices = c("YES" = "1", "NO" = "0"), selected = "0"),
  radioButtons("dedicated_workspace", "Is there a dedicated workspace in your house?", choices = c("YES" = "1", "NO" = "0"), selected = "0"),
  radioButtons("air_conditioning", "Does your house have an Air Conditioning System?", choices = c("YES" = "1", "NO" = "0"), selected = "0"),
  radioButtons("elevator", "Does your house have an Elevator?", choices = c("YES" = "0", "NO" = "0"), selected = "0"),
  radioButtons("free_parking", "Do you have a paid parking on the house premises?", choices = c("YES" = "1", "NO" = "0"), selected = "0"),
  
  radioButtons("superhost", "Are you a SuperHost?", choices = c("YES" = "1", "NO" = "0"), selected = "0"),
  
  numericInput("accommodates", "How many people does your house be able to accommodate?", 1, min = 1, max = 50),
  numericInput("bedrooms", "How many bedrooms are there in your house?", 1, min = 1, max = 50),
  numericInput("beds", "How many beds are there in your house", 1, min = 1, max = 50),
  numericInput("bathrooms", "How many bathrooms are there in your house?", 1, min = 1, max = 50),
  
  
  sliderInput("listings_count", "How many houses, rooms, or apartments have you already listed on Airbnb?", min = 1, max = 30, value = 1, step = 1),
  
  pickerInput("neighbourhood", "In which neighbourhood of Milan is your house located?", choices = c("AFFORI", "BAGGIO", "BANDE_NERE", "BARONA", "BICOCCA", "BOVISA", "BRERA", 
                                                                                                     "BRUZZANO", "BUENOS_AIRES_VENEZIA", "CENTRALE", "CITTA_STUDI", "COMASINA", 
                                                                                                     "CORSICA", "DE_ANGELI_MONTE_ROSA", "DERGANO", "DUOMO", "EX_OM_MORIVIONE", 
                                                                                                     "FARINI", "FORZE_ARMATE", "GALLARATESE", "GARIBALDI_REPUBBLICA", "GHISOLFA", 
                                                                                                     "GIAMBELLINO", "GIARDINI_PORTA_VENEZIA", "GRATOSOGLIO_TICINELLO", "GRECO", 
                                                                                                     "GUASTALLA", "ISOLA", "LAMBRATE", "LODI_CORVETTO", "LORENTEGGIO", "LORETO", 
                                                                                                     "MACIACHINI_MAGGIOLINA", "MAGENTA_S_VITTORE", "MAGGIORE_MUSOCCO", "MECENATE", 
                                                                                                     "NAVIGLI", "NIGUARDA_CA_GRANDA", "ORTOMERCATO", "PADOVA", "PAGANO", 
                                                                                                     "PARCO_FORLANINI_ORTICA", "PARCO_LAMBRO_CIMIANO", "PARCO_MONLUE_PONTE_LAMBRO", 
                                                                                                     "PARCO_SEMPIONE", "PORTA_ROMANA", "PORTELLO", "QT_8", "QUARTO_CAGNINO", 
                                                                                                     "QUARTO_OGGIARO", "RIPAMONTI", "ROGOREDO", "RONCHETTO_SUL_NAVIGLIO", "S_CRISTOFORO", 
                                                                                                     "S_SIRO", "SARPI", "SCALO_ROMANA", "SELINUNTE", "STADERA", "TIBALDI", "TICINESE", 
                                                                                                     "TORTONA", "TRE_TORRI", "UMBRIA_MOLISE", "VIALE_MONZA", "VIGENTINA", "VILLAPIZZONE", 
                                                                                                     "WASHINGTON", "XXII_MARZO"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  
  pickerInput("property_type", "What type of listing do you want to rent on Airbnb?", choices = c("Entire_guest_suit", "Entire_home", "Entire_loft", "Entire_place", "Entire_rental_unit",
                                                                                                  "Entire_service_apartment", "Entire_townhouse", "Entire_vacation_home", "Entire_villa",
                                                                                                  "Private_room_in_bed_and_breakfast", "Private_room_in_condo", "Private_room_in_hostel", 
                                                                                                  "Private_room_in_loft", "Private_room_in_rental_unit", "Private_room_in_serviced_apartment",
                                                                                                  "Room_in_aparthotel", "Room_in_bed_and_breakfast", "Room_in_boutique_hotel", "Room_in_hotel",
                                                                                                  "Tiny_home", "Hotel_room", "Private_room"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  
  pickerInput("host_verification", "By what means will you be verifified by Airbnb Platform?", choices = c("email_phone", "email_phone_workemail", "phone", "phone_workemail"), multiple = FALSE, selected = NULL, options = list(`actions-box` = TRUE)),
  
  numericInput("rent_nights", "For how many nights do you think your house will be rented over the course of a year?", 1, min = 1, max = 365),
  sliderInput("investment", "How much did it cost (or will it cost) to build the house you posted (or plan to post) on AirBnb?", min = 0, max = 4000000, value = 1, step = 200000),
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
  paid_parking_reactive <- reactive(ifelse(input$paid_parking == "1", TRUE, FALSE))
  dedicated_workspace_reactive <- reactive(ifelse(input$dedicated_workspace == "1", TRUE, FALSE))
  air_conditioning_reactive <- reactive(ifelse(input$air_conditioning == "1", TRUE, FALSE))
  elevator_reactive <- reactive(ifelse(input$elevator == "1", TRUE, FALSE))
  free_parking_reactive <- reactive(ifelse(input$free_parking == "1", TRUE, FALSE))
  superhost_reactive <- reactive(ifelse(input$superhost == "1", TRUE, FALSE))
  accommodates_reactive <- reactive(input$accommodates)
  bedrooms_reactive <- reactive(input$bedrooms)
  beds_reactive <- reactive(input$beds)
  bathrooms_reactive <- reactive(input$bathrooms)
  rent_nights_reactive <- reactive(input$rent_nights)
  neighbourhood_reactive <- reactive({ input$neighbourhood })
  property_type_reactive <- reactive({ input$property_type })
  host_verification_reactive <- reactive({ input$host_verification })

  
  # Define reactive for predicted price
  predicted_price_reactive <- reactive({
  
  data_for_training$Paid_parking_off_premisesYES <- ifelse(paid_parking_reactive(), 1, 0)
  data_for_training$Dedicated_workspaceYES <- ifelse(dedicated_workspace_reactive(), 1, 0)
  data_for_training$Air_conditioningYES <- ifelse(air_conditioning_reactive(), 1, 0)
  data_for_training$ElevatorYES <- ifelse(elevator_reactive(), 1, 0)
  data_for_training$Free_parking_on_premisesYES <- ifelse(free_parking_reactive(), 1, 0)
  data_for_training$host_is_superhostt <- ifelse(superhost_reactive(), 1, 0)
  data_for_training$accommodates <- (accommodates_reactive() - accommodates_mean) / accommodates_sd
  data_for_training$bedrooms <- (bedrooms_reactive() - bedrooms_mean) / bedrooms_sd
  data_for_training$beds <- (beds_reactive() - beds_mean) / beds_sd
  data_for_training$bathrooms <- (bathrooms_reactive() - bathrooms_mean) / bathrooms_sd
 
  column_name_1 <- paste0("neighbourhood_cleansed", neighbourhood_reactive())
  data_for_training[, column_name_1] <- 1
  column_name_2 <- paste0("property_type", property_type_reactive())
  data_for_training[, column_name_2] <- 1
  column_name_3 <- paste0("host_verifications", host_verification_reactive())
  data_for_training[, column_name_3] <- 1

  dmatrix <- xgb.DMatrix(as.matrix(data_for_training))
  predicted_price <- predict(xgb_mod, dmatrix)
  predicted_price <- round(exp(predicted_price), 3)
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


















