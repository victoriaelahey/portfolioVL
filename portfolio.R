# Load packages
library(EVR628tools)
library(tidyverse)


# Load data
data(data_lionfish)

# Glimpse data
glimpse(data_lionfish)


# Basic bar plot with site
ggplot(data = data_lionfish, aes(x = site)) +
  geom_bar() +
  coord_flip() +
  labs(x = "Site", y = "Number of fish")


# Save plot
ggsave(plot = p, filename = "results/img/first_plot.png")
