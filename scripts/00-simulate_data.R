#### Preamble ####
# Purpose: Simulates a dataset of Toronto Island ferry ticket sales and redemptions spanning 15 months
# Author: Kyle Dong
# Date: 28 September 2026
# Contact: ky.dong@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####
# Possible year month combinations for the time period being analyzed
Date <- c(
  "2025-06", "2025-07", "2025-08", "2025-09", "2025-10", "2025-11", "2025-12",
  "2026-01", "2026-02", "2026-03", "2026-04", "2026-05", "2026-06", "2026-07", "2026-08"
)

# Create specific lambda values for each month to simulate the general trend
# Random values inputed by hand
sales_lambda <- c(
  100000, # 2025-06
  280000, # 2025-07
  350000, # 2025-08
  100000, # 2025-09
  40000,  # 2025-10
  12000,  # 2025-11
  10000,  # 2025-12
  12000,  # 2026-01
  30000,  # 2026-02
  40000,  # 2026-03
  55000,  # 2026-04
  92000, # 2026-05
  230000, # 2026-06
  340000, # 2026-07
  320000  # 2026-08
)

# Make the simulated redemptions less than the sales as every redeemed ticket must have been sold at some point, but not all tickets sold are redeemed 
redemption_lambda <- sales_lambda * 0.90

# Creating the simulated data based on the Negative Binomial Distribution as the varience of the distribution fits well to simulating this kind of data
simulated_ferry_data <- tibble(
  Date = Date,

  Redemption_Count = rpois(n = length(Date), lambda = redemption_lambda),
  Sales_Count = rpois(n = length(Date), lambda = sales_lambda)
)

#### Save Data ####
write.csv(simulated_ferry_data, file = "data/00-simulated_data/simulated_monthly_ferry_data.csv", row.names = FALSE)