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

# prepare dictionaires ----------------------------------------------------

library(tibble)

get_variable_info <- function(data, directory = "", file_name = "") {
  total_variables <- sum(sapply(data, function(df) length(names(df))))
  
  variable_info <- tibble(
    directory = character(total_variables),
    file_name = character(total_variables),
    variable_name = character(total_variables),
    variable_type = character(total_variables),
    description = character(total_variables)
  )
  
  index <- 1
  
  for (i in seq_along(data)) {
    dataframe <- data[[i]]
    variable_names <- names(dataframe)
    variable_types <- sapply(dataframe, typeof)
    
    num_variables <- length(variable_names)
    variable_info$variable_name[index:(index + num_variables - 1)] <- variable_names
    variable_info$variable_type[index:(index + num_variables - 1)] <- variable_types
    variable_info$file_name[index:(index + num_variables - 1)] <- rep(file_name[i], num_variables)
    variable_info$directory[index:(index + num_variables - 1)] <- rep(directory[i], num_variables)
    
    index <- index + num_variables
  }
  
  return(variable_info)
}


# Specify values for directory and file_name
directories <- c("data/", "data/")
file_names <- c("skips.rda", "poi.rda")

dictionary <- get_variable_info(data = list(skips, poi),
                                directory = directories,
                                file_name = file_names)

dictionary |>
  openxlsx::write.xlsx("data-raw/dictionary.xlsx")
