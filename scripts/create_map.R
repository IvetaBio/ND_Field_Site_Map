
# Loading libraries
library(sf)
library(ggplot2)
library(ggiraph)
library(dplyr)
library(maps)
library(htmltools)

Dickinson_and_Williston_sites <- read.csv("data/site_coordinates.csv")

#now turning the regular table into a spatial object "sf"
sites_sf <- st_as_sf(
  Dickinson_and_Williston_sites,
  coords = c("Longitude", "Latitude"),
  crs = 4326 #Note: crs = coordinate reference system, based on GPS(WGS84), and units are in degrees
)
