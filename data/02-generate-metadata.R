# Description -------------------------------------------------------------

# An R script to generate metadata for published data

# libraries ---------------------------------------------------------------

library(dataspice)
library(dplyr)

# Code --------------------------------------------------------------------

data_path <- here::here("data/derived_data/")

create_spice(data_path)

data_files <- fs::dir_ls(path = data_path, glob = "*.csv")

attributes_path <- here::here("data/derived_data/metadata/attributes.csv")

data_files %>%
  purrr::map(~ prep_attributes(.x, attributes_path),
             attributes_path = attributes_path
  ) 


# -------------------------------------------------------------------------

readr::read_csv(attributes_path) %>%
  mutate(
    description = c(
      "Name of the waste skip location.",
      "Longitude of the location.",
      "Latitude of the location.",
      "Capacity of the container."),
    unitText = c(rep(NA, 3), "liters")
  ) %>% 
  readr::write_csv("data/derived_data/metadata/attributes.csv")


# -------------------------------------------------------------------------

metadata_path <- "data/derived_data/metadata/"

#edit_biblio(metadata_dir = metadata_path)
#edit_access(metadata_dir = metadata_path)
edit_creators(metadata_path)


# write JSON-LD -----------------------------------------------------------

write_spice(metadata_path)

fs::file_move(path = "data/derived_data/metadata/dataspice.json",
             new_path = here::here("waste-skips.json"))


build_site(path = "waste-skips.json", out_path = "docs/index.html")
