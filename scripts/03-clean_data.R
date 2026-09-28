#### Preamble ####
# Purpose: Cleans the raw Toronto island ferry data by aggregating them to monthly totals
# Author: Kyle Dong
# Date: 28 September 2026
# Contact: ky.dong@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # - The `tidyverse` package must be installed and loaded
  # - The `dplyr` package must be installed and loaded  
  # - The `lubridate` package must be installed and loaded
  # - 02-download_data.R must have been run
# Any other information needed? N/A

#### Workspace setup ####
library(tidyverse)
library(dplyr) 
library(lubridate)

#### Clean data ####
# Load the data into a dataframe for cleaning 
df <- read.csv("data/01-raw_data/Toronto_island_ferry_ticket_counts.csv") 

# Rename the count columns to have a consistent format 
df <- df %>% rename(Redemption_Count = Redemption.Count, Sales_Count = Sales.Count) 

# Convert the Timestamp column into a date-time data type 
df$Timestamp <- ymd_hms(df$Timestamp)

# Create a Date column to hold the Year and Month, which will later be used to sum the data 
df <- df %>%
  mutate(
    Date = format(floor_date(Timestamp, unit = "month"), "%Y-%m")
  )

# Create a new dataframe to store the total redemptions and sales per month 
monthly_totals <- df %>% group_by(Date) %>% summarise( Redemption_Count = sum(Redemption_Count, na.rm = TRUE), Sales_Count = sum(Sales_Count, na.rm = TRUE)) 

# Export the monthly data to a CSV file
write.csv(monthly_totals, "data/02-analysis_data/monthly_ferry_data.csv", row.names = FALSE)