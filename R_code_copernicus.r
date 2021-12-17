# R code for uploading and visualizing Copernicus data in R
# install.packages("ncdf4")
library(ncdf4)
library(raster)


# set the working directory
setwd("C:/lab/")
setwd("C:/lab//copernicus/") 


snow20211214 <- raster("c_gls_SCE_202112140000_NHEMI_VIIRS_V1.0.1.nc")
snow20211214

# let's plot the image
plot(snow20211214)
# the poles have saturation: the amount of snow is high.

# 16.12.2021

cl <- colorRampPalette(c('dark blue','blue','light blue'))(100)
plot(snow20211214, col=cl)

# use viridis package to change colours, and use colours that can be seen also by blind or daltonic people
install.packages("viridis")
library(viridis)
library(RStoolbox)
library(ggplot2)

ggplot() + geom_raster(snow20211214, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent))

#ggplot function with viridis

ggplot() + geom_raster(snow20211214, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent)) + 
scale_fill_viridis() + ggtitle("viridis palette")

# with other colours
ggplot() + geom_raster(snow20211214, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent)) + scale_fill_viridis(option="cividis")
# instead of typing cividis, you can also type "A", "B", etc., where every letter is a colour set (see online).


# 17.12.2021

library(ncdf4)
library(raster)
library(RStoolbox)
library(viridis)
library(ggplot2)
setwd("C:/lab/")
setwd("C:/lab//copernicus/")

# how to import multiple data all together: lapply function

# go in the lab folder and see the common pattern of the two images. we can use "SCE" (which stands for Snow Cover Extent)
# now we import the two images
rlist <- list.files(pattern="SCE")
rlist

# now we import all the data of the two images  
# (raster function is for a single layer, brick function is for multiple layer)
list_rast <- lapply(rlist, raster)
list_rast

# stack function is used when we have to put multiple layers all together. 
snowstack <- stack(list_rast)
snowstack

# unstack the images
# see the name of the original files in the snowstack and assign a simple name to each one.
# we do so to work with these two images. 
# but image we have like 100 images and we have to work only with the first one and the last one. 
# it's useful when you have a lot of images, now it's just and example on how to use this function
ssummer <- snowstack $ Snow.Cover.Extent.1
swinter <- snowstack $ Snow.Cover.Extent.2

# let's obtain the two images with ggplot function
p1 <- ggplot() + geom_raster(ssummer, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent.1)) + 
scale_fill_viridis() + ggtitle("Snow cover in summer")

p2 <- ggplot() + geom_raster(swinter, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent.2)) + 
scale_fill_viridis() + ggtitle("Snow cover in winter")

# use the patchwork package to plot the two images all together
library(patchwork)
p1 / p2

# how to zoom in a region I'm interested in?
# we use coordinates
# we crop the image on a certain area
# longitude from 0 to 20
# latitude from 30 to 50
ext <- c(0, 20, 30, 50)
ssummer_cropped <- crop(ssummer, ext)
swinter_cropped <- crop(swinter, ext)

# now we plot them with ggplot
p1_cropped <- ggplot() + geom_raster(ssummer_cropped, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent.1)) + 
scale_fill_viridis() + ggtitle("Snow cover in summer in Italy")

p2_cropped <- ggplot() + geom_raster(swinter_cropped, mapping = aes(x = x, y = y, fill = Snow.Cover.Extent.2)) + 
scale_fill_viridis() + ggtitle("Snow cover in winter in Italy")

p1_cropped
p2_cropped

p1_cropped + p2_cropped

