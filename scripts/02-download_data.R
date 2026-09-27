#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Kyle Dong
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


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