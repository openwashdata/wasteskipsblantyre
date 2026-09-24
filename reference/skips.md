# skips: Public waste skip locations in Blantyre, Malawi

Public waste skip locations in Blantyre, Malawi, from the 2023 update of
the dataset. Each row is a skip location with its names, cleansing
supervision area, surrounding context, vehicle access, the number of
skips and the fill-up times reported by the people surveyed. The dataset
replaces `wasteskipsblantyre` (53 skip locations collected in 2021).

## Usage

``` r
skips
```

## Format

A tibble with 67 rows and 13 variables. Rows 48 to 67 (20 rows) have no
name, no location and no other values; they carry only the constant
`capacity` value (see
<https://github.com/openwashdata/wasteskipsblantyre/issues/11>). A
further 4 named locations have no coordinates.

- name:

  Main name of skip location.

- name_other:

  Alternative names of skip location separated by commas.

- supervision_area:

  Cleansing supervision area.

- context:

  Type of urban environment surrounding skip location.

- direct_access:

  Vehicle access path type.

- fillup:

  Number of days to fill up according to person surveyed.

- fillup_dry:

  Number of days to fill up in dry season according to person surveyed.

- fillup_rainy:

  Number of days to fill up in rainy season according to person
  surveyed.

- number_skips:

  Number of skips at skip location.

- capacity:

  Capacity of one skip in litres.

- y:

  Y (latitude) coordinate in WGS 84.

- x:

  X (longitude) coordinate in WGS 84.

- notes:

  Notes relating to skip location.
