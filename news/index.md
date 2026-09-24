# Changelog

## wasteskipsblantyre 0.1.0

### Data

- The 2023 data update replaces the dataset `wasteskipsblantyre` (53
  skip locations collected in 2021, 4 variables) with two datasets:
  - `skips` (67 rows, 13 variables): public waste skip locations with
    their names, cleansing supervision area, context, vehicle access,
    number of skips, fill-up times and notes. 20 rows have no name and
    no location
    ([\#11](https://github.com/openwashdata/wasteskipsblantyre/issues/11)).
  - `poi` (5 rows, 3 variables): points of interest for the collection
    of the waste (depot, dump site, compost site and gas stations).
- The skip capacity is documented in litres (7000 litres per skip).
- CSV and XLSX exports in `inst/extdata/` for `skips` and `poi`; the
  `wasteskipsblantyre` exports are removed.

### Metadata

- Nicolas Seemann-Ricard joins as author.
- Lars Schöbitz takes over as maintainer; Sebastian Camilo Loos stays as
  author.
- The version follows the Zenodo record v0.0.3; DESCRIPTION still said
  0.0.2.
