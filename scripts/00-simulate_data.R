#### Preamble ####
# Purpose: Simulates a dataset of Toronto island ferry ticket sales and redemptions
# Spanning 15 months
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

# Creating the simulated data based on the Negative Binomial Distribution as the varience of the distribution fits well to simulating this kind of data
simulated_ferry_data <- tibble(
  Date = Date,

  Redemption_Count = rnbinom(n = length(Date), mu = 200000, size = 2),
  Sales_Count = rnbinom(n = length(Date), mu = 220000, size = 2)
)

#### Save Data ####
write.csv(simulated_ferry_data, file = "data/00-simulated_data/simulated_monthly_ferry_data.csv", row.names = FALSE)