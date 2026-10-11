################################################################################
#
# Victoria Lahey
# vel28@miami.edu
# 10/05/2026
#
# This script reads the raw fish-predation data collected on Porites astreoides coral
# fragments that used Coral City Camera footage. This script cleans the data into a 
# tidy format, summarizes predation events by fish species, and exports the clean 
# data as a .csv file. 

################################################################################

# SET UP #######################################################################

## Load packages ---------------------------------------------------------------
library(tidyverse)
library(janitor)
library(readr)

# PROCESSING ###################################################################

## Load data -------------------------------------------------------------------
fish_predation <- read_csv(file = "data/raw/fish_predation.csv") |>
  clean_names() |> # standardizes column names to snake_case
  select(-c(time_of_bite, # removed columns I have already looked at before as an undergrad
            fish_id, 
            duration_min, 
            unique_fish_id,
            merged, 
            position_on_tray, 
            sheet, 
            species, 
            age_phase)) |>
  mutate() |>
  filter(number_of_bites >= 0) |> # removes impossible values
  arrange(date, timepoint) |> # orders these chronologically
  relocate(scientific_name, .after = timepoint) # puts species next to time



# VISUALIZE ####################################################################

#inspecting the column names
colnames(fish_predation)

# viewing how many columns and rows there are in the data
dim(fish_predation)


# ANALYSIS #####################################################################

# summarize bites by species and age phase:
  bite_summary <- fish_predation |>
     group_by(scientific_name) |>
     summarize(total_bites = sum(number_of_bites),
               mean_bites = mean(number_of_bites),
               mean_fork_length = mean(fork_length_cm),
              n = n())


# EXPORT #######################################################################

## Export cleaned data ---------------------------------------------------------
write_csv(fish_predation, "data/processed/fish_predation.csv")
write_csv(bite_summary, "data/processed/bite_summary.csv")



