# R code for estimating energy in ecosystems

install.packages("raster")
library(raster)
install.packages("rgdal")
library(rgdal)

# we have to set the working directory
setwd("C:/lab/")

# let's import the data
l1992 <- brick("defor1_.jpg") # image of 1992

# let's see the information of the data
l1992

# Bands: defor_.1, defor_.2, defor_.1
# plotRGB
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l1992, r=2, g=3, b=1, stretch="Lin")


