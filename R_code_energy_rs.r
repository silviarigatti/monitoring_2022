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


# 22.11.2021
library(raster)
library(rgdal)

l2006 <- brick("defor2_.jpg") # image of 2006
l2006

# plotting the information
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# defor1_.1=NIR
# defor1_.2=red
# defor1_.3=green

# par
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# let's calculate the energy in 1992
dev.off()
dvi1992 <- l1992$defor1_.1 - l1992$defor1_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)

# now let's thee the energy loss
dvi2006 <- l2006$defor2_.1 - l2006$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# differencing two images of energy in two different times
dvidif <- dvi1992 - dvi2006
# plot the results
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvidif, col=cld)
# in the image obtained, red areas are charachterized by a big loss of vegetation

# final plot: original images, dvis, final dvis difference
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)

# to obtain a b&w image
plotRGB(l2006, r=3, g=2, b=????4, stretch="Lin")

# let's create a PDF of the image obtained
pdf("energy.pdf")
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
dev.off()
