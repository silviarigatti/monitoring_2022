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
