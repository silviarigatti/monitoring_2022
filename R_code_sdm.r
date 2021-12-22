# R code for species distribution modelling, namely the distribution of individuals
# sdm= spacial distribution modelling package
install.packages("sdm")
library(sdm)
# we will use files inside the package sdm

library(raster) # predictors
library(rgdal) # species: they are points, not raster. we use rgdal for the species analysis

# now, we use the system.file function. It shows all the files in a certain package.
file <- system.file("external/species.shp", package="sdm")
# shp is shapefile
# external is a folder inside the R folder in my pc
file
# we obrain "C:/Users/Silvia/Documents/R/win-library/4.1/sdm/external/species.shp": it's the path of the data
# now we re create a file from the shp file with a shapefile fuunction, to import that shapefile
# it works exactly as the raster function for raster files. they are points in space
species <- shapefile(file)
species
plot(species, pch=19, col="red") # pch is a type of point, look iin the internet: every number is a type of point
