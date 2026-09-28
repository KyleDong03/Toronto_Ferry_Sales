#### Preamble ####
# Purpose: Tests the aggregated actual Toronto Island ferry ticket count data
# For correct structure and validity 
# Author: Kyle Dong
# Date: 28 September 2026
# Contact: ky.dong@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - The `testthat` package must be installed and loaded  
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("data/02-analysis_data/monthly_ferry_data.csv")


#### Test data ####
# Test that the dataset has 15 rows, as we are watching a 15 month period
test_that("dataset has 15 rows", {
  expect_equal(nrow(analysis_data), 15)
})

# Test that the dataset has 3 columns
test_that("dataset has 3 columns", {
  expect_equal(ncol(analysis_data), 3)
})

# Test that the 'Date' column is character type
test_that("'Date' is character", {
  expect_type(analysis_data$Date, "character")
})

# Test that the 'Redemption_Count' column is character type
test_that("'Redemption_Count' is double", {
  expect_type(analysis_data$Redemption_Count, "double")
})

# Test that the 'Sales_Count' column is character type
test_that("'Sales_Count' is double", {
  expect_type(analysis_data$Sales_Count, "double")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that 'Date' contains unique dates (no duplicates)
test_that("'Date' column contains unique dates", {
  expect_equal(length(unique(analysis_data$Date)), 15)
})

# Test that 'Date' contains only valid Dates from our timeframe
valid_dates <- c("2025-06", "2025-07", "2025-08", "2025-09", "2025-10", "2025-11", "2025-12",
  "2026-01", "2026-02", "2026-03", "2026-04", "2026-05", "2026-06", "2026-07", "2026-08")
test_that("'Date' contains valid Year Month Combos", {
  expect_true(all(analysis_data$Date %in% valid_dates))
})

# Test that there are no empty strings in Date column
test_that("no empty strings in 'Date' column", {
  expect_false(any(analysis_data$Date == ""))
})

