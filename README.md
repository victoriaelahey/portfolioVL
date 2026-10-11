# Fish Predation on Porites astreoides Coral Fragments

## Author 
Victoria Ellen Lahey

## Description
This project examines which fish species predate on Porites astreoides coral 
fragments and how many bites they take, using fish-predation observations from 
Coral City Camera footage. It cleans the raw data into a tidy format, summarizes 
bites by species, and visualizes how bite counts vary across species and fish size.

## Repository contents 
Raw data:
- file: fish_predation.csv
- location: data/raw
- source:Fish-predation observations I recorded from Coral City Camera footage of 
Porites astreoides coral fragments as an undergrad last semester.

R-scripts:
- file: data_processing.R
    - location: scripts/01_processing
    - purpose: cleans the raw data, and summarizes predation events (bites) by species 
      and exports the newly cleaned data sets. 

- file: exploratory_data_visualization.R
    - location: scripts/03_content
    - purpose: reads the cleaned data from "data_processing.R" that was made and builds 
      three plots and exports the figures. 

Cleaned data:
