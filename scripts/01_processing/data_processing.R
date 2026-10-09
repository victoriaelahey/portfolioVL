################################################################################
#
# Victoria Lahey
# vel28@miami.edu
# 10/05/2026
#
# This script reads in raw fish-predation data collected on coral reefs,
# cleans and wrangles it into a tidy format using dplyr and tidyr,
# summarizes predation events by fish species, and exports the clean
# data as an .rds file for use in the exploratory visualization script.

################################################################################

# SET UP #######################################################################

## Load packages ---------------------------------------------------------------
library(tidyverse)   # will plan to use dplyr, tidyr, readr, ggplot2
library(janitor)     # clean column names
library(readr)


## Load data -------------------------------------------------------------------
fish_predation <- read_csv(file = "data/raw/fish_predation.csv")


# PROCESSING ###################################################################

## Modify column names ---------------------------------------------------------


## Remove columns that will not be used ----------------------------------------
cleaned_fish_predation <- fish_predation |>
  clean_names() |>
  select(
    -time_of_bite,
    -fish_id,
    -duration_min,
    -unique_fish_id,
    -merged, 
    -position_on_tray,
    -sheet,
    -species)

# Make it tidy


# VISUALIZE ####################################################################

## Check structure -------------------------------------------------------------


# ANALYSIS #####################################################################

## Create a basic summary for checking the cleaned data -----------------------



# EXPORT #######################################################################

## Export cleaned data ---------------------------------------------------------

