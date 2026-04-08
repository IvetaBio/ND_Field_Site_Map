
# Loading libraries
library(sf)
library(ggplot2)
library(ggiraph)
library(dplyr)
library(maps)
library(htmltools)
library(tidyverse)
library(patchwork)

Dickinson_and_Williston_sites <- read.csv("data/site_coordinates.csv")

#now turning the regular table into a spatial object "sf"
sites_sf <- st_as_sf(
  Dickinson_and_Williston_sites,
  coords = c("Longitude", "Latitude"),
  crs = 4326 #Note: crs = coordinate reference system, based on GPS(WGS84), and units are in degrees
)


#creating the smallest possible map first
ggplot()+
  geom_sf(data = sites_sf)

#Now we are going to add North Dakota as the base map 
ND <- map_data("state") %>% 
  filter(region == "north dakota")


# Now we are going to plot my points onto ND's base map
ggplot()+
  geom_polygon(
    data = ND,
    aes(x = long, y = lat, group = group),
    fill = "grey90",
    color = "black")+
  geom_sf(data = sites_sf, aes(color = Site, shape = as.factor(Year)), size = 3)+
  geom_sf_text(
    data = sites_sf[!duplicated(sites_sf$Site),],dataYear = sites_sf[!duplicated(sites_sf$Site),],
    aes(label = paste(Site)),
    nudge_y = 0.08,
    size = 3)+
  coord_sf()+
  theme_minimal()+
  labs(
    shape = "Year",
    color = "Site",
    title = "North Dakota"
  )+
  theme(axis.text.x = element_text(color = "black"),
        axis.text.y = element_text(color = "black"))












