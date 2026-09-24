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

## read original data and prepare small dataset that does not include
## sensitive or personal information. original data is ignored from git.

#read_delim("data-raw/skips_dataset.csv", delim = ";") |> 
#  janitor::clean_names() |> 
#  select(market_skip_norm:notes) |> 
#  write_csv("data-raw/skips_dataset_sml.csv")

data_in1 <- read_csv("data-raw/skips_dataset_sml.csv")

skips <- data_in1 |> 
  rename(name = market_skip_norm) |> 
  rename(name_other = other_designations) |> 
  mutate(capacity = 7000) |> 
  relocate(capacity, .after = number_skips)

## second data resource

data_in2 <- read_delim("data-raw/POIs.csv", delim = ";") |> 
  rename(poi = POI)

poi <- data_in2  


# write data --------------------------------------------------------------

usethis::use_data(skips, poi, overwrite = TRUE)

# export data -------------------------------------------------------------

## CSV and XLSX copies for users who do not work in R. The data dictionary
## lives in data-raw/dictionary.xlsx (descriptions filled in by the data
## contributor) and data-raw/dictionary.csv.

fs::dir_create(here::here("inst", "extdata"))

readr::write_csv(skips, here::here("inst", "extdata", "skips.csv"))
readr::write_csv(poi, here::here("inst", "extdata", "poi.csv"))

writexl::write_xlsx(skips, here::here("inst", "extdata", "skips.xlsx"))
writexl::write_xlsx(poi, here::here("inst", "extdata", "poi.xlsx"))
