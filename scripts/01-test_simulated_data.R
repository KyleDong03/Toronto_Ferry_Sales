#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Australian 
  #electoral divisions dataset.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_monthly_ferry_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 15 rows, one for each valid date
if (nrow(analysis_data) == 15) {
  message("Test Passed: The dataset has 15 rows.")
} else {
  stop("Test Failed: The dataset does not have 15 rows.")
}

# Check if the dataset has 3 columns
if (ncol(analysis_data) == 3) {
  message("Test Passed: The dataset has 3 columns.")
} else {
  stop("Test Failed: The dataset does not have 3 columns.")
}

# Check if all values in the 'Date' column are unique
if (n_distinct(analysis_data$Date) == nrow(analysis_data)) {
  message("Test Passed: All values in 'Date' are unique.")
} else {
  stop("Test Failed: The 'Date' column contains duplicate values.")
}

# Check if the 'Date' column contains only valid Year Month combos for our timeframe
valid_Dates <- c("2025-06", "2025-07", "2025-08", "2025-09", "2025-10", "2025-11", "2025-12",
  "2026-01", "2026-02", "2026-03", "2026-04", "2026-05", "2026-06", "2026-07", "2026-08")

if (all(analysis_data$Date %in% valid_Dates)) {
  message("Test Passed: The 'Date' column contains only valid Year Month combos for our timeframe.")
} else {
  stop("Test Failed: The 'Date' column contains only valid Year Month combos for our timeframe.")
}

# Checks to make sure the Sales Count and Redemption Count are all numbers
if (all(is.numeric(analysis_data$Sales_Count))) {
  message("Test Passed: Sales Count is a number")
} else {
  stop("Test Failed: Sales Count is NOT a number")
}

if (all(is.numeric(analysis_data$Redemption_Count))) {
  message("Test Passed: Redemption Count is a number")
} else {
  stop("Test Failed: Redemption Count is NOT a number")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'Date' column
if (all(analysis_data$Date != "")) {
  message("Test Passed: There are no empty Dates.")
} else {
  stop("Test Failed: There are empty Dates.")
}