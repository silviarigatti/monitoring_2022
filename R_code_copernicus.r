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
