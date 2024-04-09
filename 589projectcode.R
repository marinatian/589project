library(spatstat)
library(sf)
library(raster)
coho_data <- read.delim('Coho_Salmon.csv')
View(coho_data)
load('BC_Covariates.Rda')
lapply(DATA,class)
elevation_im <- DATA$Elevation
forest_im <- DATA$Forest
hfi_im <- DATA$HFI
dist_water_im <- DATA$Dist_Water

#data exploration
summary(coho_data)
coho_data_cleaned <- coho_data[
  !is.na(coho_data$decimalLatitude) & 
    !is.na(coho_data$decimalLongitude) & 
    coho_data$stateProvince %in% c('British Columbia', 'british columbia', 'bc', 'BC'), ]
View(coho_data_cleaned)
plot(coho_data_cleaned$decimalLongitude, coho_data_cleaned$decimalLatitude, main = "Coho Salmon Occurrences", xlab = "Longitude", ylab = "Latitude", pch = 20, col = 'blue')
plot(elevation_im, main = "Elevation")
