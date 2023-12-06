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

data_in <- read_csv("data-raw/skips_dataset_sml.csv")

skips <- data_in |> 
  rename(name = market_skip_norm) |> 
  rename(name_other = other_designations) |> 
  mutate(capacity = 7000) |> 
  relocate(capacity, .after = number_skips)

usethis::use_data(skips, overwrite = TRUE)
