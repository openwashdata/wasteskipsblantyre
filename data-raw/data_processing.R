## code to prepare `data_processing` dataset goes here

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

locations <- read_sf("./data-raw/gps_marked_skips_in_blantyre.kml")

st_bbox(locations)

wasteskipsblantyre <- locations |> 
  mutate(long = unlist(map(locations$geometry, 1)),
         lat = unlist(map(locations$geometry, 2))) |> 
  st_drop_geometry() |> 
  select(-Description) |>  
  rename("name" = Name) |> 
  # enrich data
  mutate(capacity_l = 7000)

usethis::use_data(wasteskipsblantyre, overwrite = TRUE)
