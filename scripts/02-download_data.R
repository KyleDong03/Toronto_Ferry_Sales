#### Preamble ####
# Purpose: Downloads and saves the Toronto island ferry ticket count
# Data from open data Toronto 
# Author: Kyle Dong
# Date: 28 September 2026
# Contact: ky.dong@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `opendatatoronto` package must be installed and loaded
  # - The `dplyr` package must be installed and loaded  
# Any other information needed? N/A


#### Workspace setup ####get package
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("000ec8ae-1231-49ca-b6f8-6eb35b74a7ee")
package

# get all resources for this package
resources <- list_package_resources("000ec8ae-1231-49ca-b6f8-6eb35b74a7ee")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

# Write the loaded data to the raw data folder
write.csv(data, file = "data/01-raw_data/Toronto_island_ferry_ticket_counts.csv")