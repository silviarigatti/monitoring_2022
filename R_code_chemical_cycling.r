# R code for chemical cycling study
# time series of NO2 change in Europe during the lockdown

library(raster)

# set the working directory
setwd("C:/lab/en/")

EN01 <- raster("EN_0001.png")
# what is the range of the data?
# the minimum value is 0, the max is 255
# this means that we have a 8 bit information, because 2^8=256

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
# plot the NO2 values of January
plot(EN01, col=cl)


# plot the NO2 values of March
EN13 <- raster("EN_0013.png")
plot(EN13, col=cl)

# plot the NO2 values of Janyary and March in 2 rows and one column
par(mfrow=c(2,1))
plot(EN01, col=cl)
plot(EN13, col=cl)

EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# plot all the data together
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# there's also another method, building a stack
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)
# you can write also EN = stack etc., not only "<-"


# plot only the first image from the stack
plot(EN$EN_0001, col=cl)

# rgb
# plot the rgb
plotRGB(EN, r=1, g=7, b=13, stretch="Lin")
# red: high values of NO2 in the first part of the lockdown, 1st image, in January and low in other periods
# green: high values of NO2 in the 7 image, in February
# blue: high values of NO2 in the 13 image, in March
# yellow: unalterate during the whole lockdown
# 
