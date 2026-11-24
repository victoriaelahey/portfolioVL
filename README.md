# Fish Predation on *Porites astreoides* Coral Fragments

## Author 
Victoria Ellen Lahey

## Description
This project examines which fish species predate on *Porites astreoides* coral 
fragments and how many bites they take, using fish-predation observations from 
Coral City Camera footage. It cleans the raw data into a tidy format, summarizes 
bites by species, and visualizes how bite counts vary across species, fish size 
and study site.


## Data sources

### `data/raw/fish_predation.csv`

- **fish_predation.csv:** Fish predation on *Porites astreoides* fragments at Coral City Camera
- **Source:** Observations I recorded from Coral City Camera footage as an undergraduate student
- **Date of access:** 04/2026 recorded

### Natural Earth country polygons (not stored in this repo)

- **Title of the dataset:** Natural Earth countries (medium scale)
- **Source:** Natural Earth, accessed through the `rnaturalearth` R package: <https://www.naturalearthdata.com/>
- **Date of access:** Nov 15, 2026


## Repository structure and contents

- `data`: Contains the raw and processed data
  - `data/raw/fish_predation.csv`: Raw fish-predation observations
  - `data/processed/fish_predation.csv`: Tidy observation data with `date`, `timepoint`, `scientific_name`, `fork_length_cm`, and `number_of_bites`
  - `data/processed/bite_summary.csv`: Summary of species with `total_bites`, `mean_bites`, `mean_fork_length`, and `n`

## R-scripts:
- **script name:** data_processing.R
    - **location:** scripts/01_processing/
    - **purpose:** cleans the raw data, and summarizes predation events (bites) by species 
      and exports the newly cleaned data sets. 

- **script name:** exploratory_data_visualization.R
    - **location:** scripts/03_content/
    - **purpose:** reads the cleaned data from "data_processing.R" that was made and builds 
      three plots and exports the figures. 
      
- **script name:** spatial_data_visualization.R
    - **location:** scripts/03_content/
    - **purpose:** reads the cleaned data from "data_processing.R" that was made and 
      incorporated the coordinates of the study site to map a plot where the data 
      was collected. 



## Figures:
- **figure name:** total_bites_by_species.png
    - **location:** results/img/
    - **purpose:** bar chart of total bites by species

- **figure name:** mean_bites_by_fish_size.png
    - **location:** results/img/
    - **purpose:** scatter plot of fork length vs the number of bites colored by species

- **figure name:** bites_per_fish.png
    - **location:** results/img/
    - **purpose:** box plot of bites per fish 
    
- **figure name:** coral_city_camera_map.png
    - **location:** results/img/
    - **purpose:** map of study site where camera was placed and data was collected
    
    











