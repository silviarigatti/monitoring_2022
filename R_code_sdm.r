# R code for species distribution modelling, namely the distribution of individuals

install.packages("sdm")
library(sdm)
# we will use files inside the package sdm

library(raster) # predictors
library(rgdal) # species: they are points, not raster. we use rgdal for the species analysis

