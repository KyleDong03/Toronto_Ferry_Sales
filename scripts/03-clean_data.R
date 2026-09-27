#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

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