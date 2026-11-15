################################################################################
# Assignment 3: Spatial data visualization
################################################################################
#
# Victoria Lahey
# vel28@miami.edu
# 11/15/2026
#
# Working with spatial data to produce a map of my study site,
# Coral City Camera in the Port of Miami Florida.
# Research: Fish predation on Porites astreoides microfragments
#
#
################################################################################

## Load packages ---------------------------------------------------------------
# (install.packages(c("rnaturalearth", "rnaturalearthdata")) in Console if needed)

library(tidyverse) # for data wrangling and ggplot2
library(sf) # for spatial data
library(rnaturalearth) # world map source
library(rnaturalearthdata)
library(ggspatial) # north arrow and scale bar

## Load data -------------------------------------------------------------------

bite_summary <- read_csv("data/processed/bite_summary.csv")

## Load world map data ---------------------------------------------------------

world <- ne_countries(
  scale = "medium",
  returnclass = "sf")

## Create Coral City Camera spatial point --------------------------------------

# Coordinates of Coral City Camera are in decimal degrees with the total bites 
ccc_point <- data.frame(   # create new object
  site = "Coral City Camera", # naming the site
  total_bites = sum(bite_summary$total_bites, na.rm = TRUE), # numeric total number of bites.
  lon = -80.151,    # coordinate of CCC in the port of Miami
  lat = 25.774
) |>
  st_as_sf(coords = c("lon", "lat"), crs = 4326) # convert data frame into sf object


