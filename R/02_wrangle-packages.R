## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()
library(tidyverse)
library(here)

pkg <- readr::read_csv(file = here("data", "installed-packages.csv")) %>%
  as_tibble()

## filter out packages in the default library
## keep variables Package and Built
## if you use dplyr, code like this will work:
apt <- pkg %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv
write_csv(x = apt, here("data", "add-on-packages.csv"))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:
apt_freqtable <- apt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples
write_csv(x = apt_freqtable, here("data", "add-on-packages-freqtable.csv"))

## when this script works, stage & commit it and the csv files
## PUSH!
