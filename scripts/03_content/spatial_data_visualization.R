################################################################################
# Assignment 3: Spatial data visualization
################################################################################
#
# Victoria Lahey
# vel28@miami.edu
# 11/15/2026
#
# Working with spatial data to produce a map of my study site,
# Coral City Camera (CCC) in the Port of Miami Florida.
# Fish predation on Porites astreoides microfragments
#
#
################################################################################

## Load packages ---------------------------------------------------------------
# (install.packages(c("rnaturalearth", "rnaturalearthdata")) in Console)

library(tidyverse) # for data wrangling and ggplot2
library(sf) # for spatial data
library(rnaturalearth) # world map source
library(rnaturalearthdata)
library(ggspatial) # north arrow and scale bar
library(mapview) # quick interactive map inspection


## Load data -------------------------------------------------------------------

bite_summary <- read_csv("data/processed/bite_summary.csv")

## Load world map data ---------------------------------------------------------

world <- ne_countries(
  scale = "medium",   # scale set to medium
  returnclass = "sf") #Ensure compatibility with geom_sf()

## Create Coral City Camera spatial point --------------------------------------

# Coordinates of Coral City Camera are in decimal degrees with the total bites 
ccc_point <- data.frame(   # create new object
  site = "CCC", # naming the site
  total_bites = sum(bite_summary$total_bites, na.rm = TRUE), # numeric total number of bites.
  lon = -80.151,    # coordinate of CCC in the port of Miami
  lat = 25.774
) |>
  st_as_sf(coords = c("lon", "lat"), crs = 4326) # convert data frame into sf object

## Load and crop base layer ----------------------------------------------------

# Load coastline for the study area
coast <- ne_countries(country = "United States of America") # polygons for the US

# Crop the coastline to southeast Florida
fl_coast <- st_crop(coast,    # Object to crop (US boundary) to the FL coast
  xmin = -81.5, xmax = -79.5, # West and east limits (longitude)
  ymin = 24.8, ymax = 26.8)  # South and north limits (latitude)

## Quick inspection ------------------------------------------------------------

mapviewOptions(basemaps = "Esri.WorldGrayCanvas")
mapview(list(fl_coast, ccc_point))


## Build Map -------------------------------------------------------------------

map <- ggplot() +
  geom_sf(data = world,           # Base layer (land for context)
          fill = "grey85",        # Land fill
          color = "grey50",       # Outlines to show borders
          linewidth = 0.2) +      # Outline thickness
  geom_sf(data = ccc_point,       # Study site
          aes(size = total_bites),# Point size designated by total bites
          color = "firebrick",
          alpha = 0.8) +
  coord_sf(xlim = c(-81.5, -79.5),  # Zoom to southeast Florida
           ylim = c(24.8, 26.8),
           expand = FALSE) +
  theme_bw() +
  theme(panel.background = element_rect(fill = "lightblue")) +   # Ocean color
  labs(title = "Coral City Camera (CCC) in the Port of Miami",
       subtitle = "Fish predation on Porites astreoides microfragments",
       x = "Longitude (°)",
       y = "Latitude (°)",
       size = "Total bites (count)",
       caption = "Base map: Natural Earth. Data: CCC fish predation study.") +
  annotation_scale(location = "br",
                   width_hint = 0.4,              # Control length of scale bar
                   pad_y = unit(0.3, "cm")) +     # Padding from bottom edge
  annotation_north_arrow(location = "bl",
                         which_north = "true",    # True North
                         height = unit(2, "cm"),
                         width = unit(2, "cm"),
                         pad_x = unit(1, "cm"),   # Padding from left edge
                         pad_y = unit(1, "cm"),   # Padding from bottom
                         style = north_arrow_nautical())

map

## Export figure -------------------------------------------------------------

# Save the map as a PNG
ggsave(
  filename = "results/img/coral_city_camera_map.png",  # Relative path, PNG format
  plot = map,       # The ggplot object to save
  width = 7,        # Width in inches
  height = 6,       # Height in inches
  dpi = 300)        # Resolution 














