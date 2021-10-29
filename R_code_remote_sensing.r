# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://cran.r-project.org/web/packages/raster/index.html

install.packages("raster")

library(raster)

install.packages("terra")



# to use the brick("p224r63_2011.grd") and l2011<-brick("p224r63_2011.grd") functions (see below), I need to install the package raster (every time I have to use them!)

library(raster)

setwd("C:/lab/")

# we are going to import satellite data
# objects cannot be numbers
brick("p224r63_2011.grd")

# let's assign an object to the brick("p224r63_2011.grd"). 
# let's call it l2011. it stands for Landsat 2011, the year when the image was taken.
l2011<-brick("p224r63_2011.grd")

plot (l2011)
# B1 is the reflectance in the blue band
# B2 is the reflectance in the green band
# B3 is the reflectance in the green band

# to change a color palette use the function colorRampPalette(c("color 1","color 2","color 3"))(number of how many tones I want to use from a color to the other).
# It changes the colors that I want to use to show the different bands.
# I also want to assign an object (cl) to the function
cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011, col=cl)

# plotRGB is a function that associate each component to a red, yellow or blue band.
# plotRGB(x=raaster, r=band to be put in the red channel, g=band to be put in the green channel, b=band to be put in the blue channel, 
# the stretch is used to stretch the data (in next lesson it will be explained)
# with this function, we can obtain the natural colors of the image
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")

