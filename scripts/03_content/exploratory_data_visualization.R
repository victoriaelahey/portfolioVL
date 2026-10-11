################################################################################
#
# Victoria Lahey
# vel28@miami.edu
# 10/05/2026
#
# This script reads the cleaned fish-predation data collected on Porites
# astreoides coral fragments from Coral City Camera footage and creates three
#  plots: total bites by species, bites vs. fish size, and bites per
# fish by species. The plots are exported as .png files to results/img/.

################################################################################

# SET UP #######################################################################

## Load packages ---------------------------------------------------------------
library(tidyverse)

# PROCESSING ###################################################################

## Load data -------------------------------------------------------------------
predation_summary <- read_csv("data/processed/bite_summary.csv")
predation <- read_csv("data/processed/fish_predation.csv")


# VISUALIZE ####################################################################

## Build plots -----------------------------------------------------------------

### Plot 1: Total bites by species
p1 <- ggplot(data = predation_summary,
             mapping = aes(x = total_bites,
             y = fct_reorder(scientific_name, total_bites))) + ##orders by total
  geom_col(fill = "blue") +
  labs(x = "Total bites", y = "Scientific name",
       title = "Total bites by species", 
       caption = "Data: Documented predation events from Coral City Camera footage 
       of Porites astreoides") +
  theme_bw()
p1


### Plot 2: Mean bites by fish size 
p2 <- ggplot(data = predation,
       mapping = aes(x = fork_length_cm, y = number_of_bites,
           color = scientific_name)) +
  geom_jitter(alpha = 0.6, width = 0.3, height = 0.2) +
  labs(x = "Fork length (cm)", y = "Number of bites", color = "Species",
       title = "Mean bites by fish size",
       caption = "Data: Documented predation events from Coral City Camera footage 
       of Porites astreoides") +
  theme_bw() 
p2


### Plot 3: Bites per fish by species
p3 <- ggplot(data = predation,
       mapping = aes(x = number_of_bites,
                     y = scientific_name)) +
  geom_boxplot() +
  geom_jitter(height = 0.15, alpha = 0.3) +
  labs(x = "Number of bites per fish", y = "Species",
       title = "Bites per fish by species",
       caption = "Data: Documented predation events from Coral City Camera footage 
       of Porites astreoides") +
  theme_bw()
p3


# EXPORT #######################################################################
## Export the 3 plots made -----------------------------------------------------

ggsave(plot = p1,
       filename = "results/img/total_bites_by_species.png",
       width = 8,
       height = 10)

ggsave(plot = p2,
       filename = "results/img/mean_bites_by_fish_size.png",
       width = 8,
       height = 10)

ggsave(plot = p3, 
       filename = "results/img/bites_per_fish.png",
       width = 8,
       height = 10)














