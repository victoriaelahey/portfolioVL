# Fish Predation on *Porites astreoides* Coral Fragments

## Author 
Victoria Ellen Lahey

## Description
This project examines which fish species predate on *Porites astreoides* coral 
fragments and how many bites they take, using fish-predation observations from 
Coral City Camera footage. It cleans the raw data into a tidy format, summarizes 
bites by species, visualizes how bite counts vary across species and fish size,
and maps the study site.


## Data sources

### `data/raw/fish_predation.csv`

- **Title of the dataset:** Fish predation on *Porites astreoides* fragments at Coral City Camera
- **Source:** Observations I recorded from Coral City Camera footage as an undergraduate student
- **Date of access:** April 2026 (recorded from footage)

### Natural Earth country polygons (not stored in this repo)

- **Title of the dataset:** Natural Earth countries (medium scale)
- **Source:** Natural Earth, accessed through the `rnaturalearth` R package: <https://www.naturalearthdata.com/>
- **Date of access:** Nov 15, 2026


## Repository structure and contents

- `data`: Contains the raw and processed data
  - `data/raw/fish_predation.csv`: Raw fish-predation observations
  - `data/processed/fish_predation.csv`: Tidy observation data with `date`, `timepoint`, `scientific_name`, `fork_length_cm`, and `number_of_bites`
  - `data/processed/bite_summary.csv`: Summary of species with `total_bites`, `mean_bites`, `mean_fork_length`, and `n`


- `scripts`: Contains all R scripts used in this project
  - `scripts/01_processing/data_processing.R`: Reads `data/raw/fish_predation.csv`, cleans it, summarizes bites by species, and exports `data/processed/fish_predation.csv` and `data/processed/bite_summary.csv`
  - `scripts/03_content/exploratory_data_visualization.R`: Reads `data/processed/fish_predation.csv` and `data/processed/bite_summary.csv`, builds three plots, and exports them to `results/img/`
  - `scripts/03_content/spatial_data_visualization.R`: Reads `data/processed/bite_summary.csv` and the Natural Earth polygons, maps the study site, and exports `results/img/coral_city_camera_map.png`


- `results`: Contains all output figures
  - `results/img/total_bites_by_species.png`: Bar chart of total bites by species, produced by `scripts/03_content/exploratory_data_visualization.R`
  - `results/img/mean_bites_by_fish_size.png`: Scatter plot of fork length vs number of bites, colored by species, produced by `scripts/03_content/exploratory_data_visualization.R`
  - `results/img/bites_per_fish.png`: Box plot of bites per fish, produced by `scripts/03_content/exploratory_data_visualization.R`
  - `results/img/coral_city_camera_map.png`: Map of the study site where the camera was placed, produced by `scripts/03_content/spatial_data_visualization.R`


- `README.md`: This file, documenting the project
- `portfolioVL.Rproj`: RStudio portfolio project file




