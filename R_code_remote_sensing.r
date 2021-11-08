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



# lesson 05.11.2021

# let's repeat the things we did last lesson
# now, let's plot only the green band
# plot is the function, the things written inside the parentesis () are the argument

plot(l2011$B2_sre)

# again, as last lecture, we change the colors of the raster obtained with the plot function

cl <- colorRampPalette(c("black", "grey", "light grey"))(100)

plot(l2011$B2_sre, col=cl)

# let's change the colorRampPalette with dark green, green and light green
clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(l2011$B2_sre, col=clg)

# let's plot the blue band and do the same as before
plot(l2011$B1_sre)
clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(l2011$B2_sre, col=clb)

# let's introduce another functon, the par multiframe
# Let's  plot the blue and the green besides, with different colorRampPalette, in one multi frame graph
# (1, 2) means one row and two columns. first number: n° of rows; second number: n° of columns
par(mfrow=c(1, 2))
plot(l2011$B2_sre, col=clb)
plot(l2011$B2_sre, col=clg)


# Let's do another plot, with two rows and one colums
par(mfrow=c(2, 1))
plot(l2011$B2_sre, col=clb)
plot(l2011$B2_sre, col=clg)


# lesson 08.11.2021
library(raster)
# set the working directory every time, because R only creates temporary files.
setwd("C:/lab/")

# do again the same things as last time

# now, let's plot the first four bands with two rows and two columns
# first, we have to do the red and the near infrared bands
plot(l2011$B3_sre)
clr <- colorRampPalette(c("dark red", "red", "pink"))(100)
plot(l2011$B3_sre, col=clr)

plot(l2011$B4_sre)
clnir <- colorRampPalette(c("red", "orange", "yellow"))(100)
plot(l2011$B4_sre, col=clnir)

# now we have to plot the four bands
par(mfrow=c(2, 2))
plot(l2011$B2_sre, col=clb)
plot(l2011$B2_sre, col=clg)
plot(l2011$B3_sre, col=clr)
plot(l2011$B4_sre, col=clnir)



# the dev.off() function closes the plotting device window
dev.off()

# now, we want to obtain the raster in natural colors
# we use the function plotRGB
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")

#now, let's see the near infrared. we can see all the vegetation, because it reflects the NIR
plotRGB(l2011, r=4, g=2, b=1, stretch="Lin")

# let's put the NIR in the green.
plotRGB(l2011, r=3, g=4, b=1, stretch="Lin")

# let's change again, and put the NIR in the blue.
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")


# let's do a multi frame of thele last 4 images
par(mfrow=c(2,2))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")   # natural colors
plotRGB(l2011, r=4, g=2, b=1, stretch="Lin")   # false colors
plotRGB(l2011, r=3, g=4, b=1, stretch="Lin")   # false colors
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")   # false colors
