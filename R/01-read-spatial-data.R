
# description -------------------------------------------------------------

# A script to read a KML file and extract the long and lat coordinates for
# further processing

# libraries ---------------------------------------------------------------

library(dplyr)
library(tidyr)
library(sf)
library(purrr)
library(readr)
library(stringr)

# read data ---------------------------------------------------------------

locations <- read_sf("data/raw_data/GPS marked skips in Blantyre.kml")

st_bbox(locations)

locations_df <- locations %>% 
  mutate(long = unlist(map(locations$geometry, 1)),
         lat = unlist(map(locations$geometry, 2))) %>% 
  st_drop_geometry() %>% 
  select(-Description) %>% 
  
  # enrich data
  mutate(capacity = 7000)

write_csv(locations_df, file = "data/derived_data/public-waste-skips-blantyre-malawi.csv")

