
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wasteskipsblantyre

<!-- badges: start -->

[![R-CMD-check](https://github.com/openwashdata/wasteskipsblantyre/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/openwashdata/wasteskipsblantyre/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

# Overview

The wasteskipsblantyre data package includes locations of the publicly
accessible waste skips in Blantyre, Malawi. The data was collected in
2021.

## Installation

You can install the development version of wasteskipsblantyre from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/wasteskipsblantyre")
```

Alternatively, you can download the individual datasets as a CSV or XLSX
file from the table below.

| dataset            | CSV                                                                              | XLSX                                                                               |
|:-------------------|:---------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------|
| wasteskipsblantyre | [Download CSV](wasteskipsblantyre/tree/main/inst/extdata/wasteskipsblantyre.csv) | [Download XLSX](wasteskipsblantyre/tree/main/inst/extdata/wasteskipsblantyre.xlsx) |

# Project

## TITLE_OF_PROJECT

(One sentence) Evaluating the potential of ……..

### Description

(One to two short paragraphs) This Project focuses on determining …….

### Research Question

(One to two questions)

### Data

The data set inlcludes the locations of the publicly accessible waste
skips in Blantyre, Malawi. In the context of the **PROJECT_NAME**
project described above the data was collected in **MONTH** of 2021.

The package provides access to one data set.

``` r
library(wasteskipsblantyre)
```

The `wasteskipsblantyre` data set has 4 variables and 53 observations.
For an overview of the variable names, see the following table.

``` r
wasteskipsblantyre
```

| variable_name | variable_type | description                                   |
|:--------------|:--------------|:----------------------------------------------|
| name          | character     | Name of the waste skip location.              |
| long          | double        | Longitude of the location as decimal degrees. |
| lat           | double        | Latitude of the location as decimal degrees.  |
| capacity_l    | double        | Capacity of the container in liters.          |

<div class="figure">

<img src="man/figures/README-fig-waste-skips-simple-1.png" alt="A small visualisation of this data set" width="100%" />
<p class="caption">
A small visualisation of this data set
</p>

</div>

## Example

This is a basic example which shows you how to use the data:

``` r
library(wasteskipsblantyre)
library(sf)
library(tmap)

# read data set into a simple feature (spatial vector data)
sf_wsb <- st_as_sf(wasteskipsblantyre, coords = c('long', 'lat'), crs = 4326)
# set mapping mode to interactive ("view")
tmap_mode("view")
# create an interactive map 
qtm(sf_wsb)
```
