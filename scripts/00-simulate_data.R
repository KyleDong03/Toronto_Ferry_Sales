#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####
# Possible year month combinations for the time period being analyzed
Date <- c(
  "2025-06", "2025-07", "2025-08", "2025-09", "2025-10", "2025-11", "2025-12",
  "2026-01", "2026-02", "2026-03", "2026-04", "2026-05", "2026-06", "2026-07", "2026-08"
)

# Creating the simulated data based on the Negative Binomial Distribution as the varience of the distribution fits well to simulating this kind of data
simulated_ferry_data <- tibble(
  Date = Date,

  Sales_Count = rnbinom(n = length(Date), mu = 200000, size = 2),
  
  Redemption_Count = rnbinom(n = length(Date), mu = 220000, size = 2)
)

#### Save Data ####
write.csv(simulated_ferry_data, file = "data/00-simulated_data/simulated_monthly_ferry_data.csv")

print(simulated_ferry_data)