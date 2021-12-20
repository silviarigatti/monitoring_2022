# Ice melt in Greenland
# Proxy (verb that substitutes another): temperature (temperature substitutes the ice melt)

library(raster)
library(ggplot2)
library(RStoolbox)
library(patchwork)
library(viridis)

# set the working directory
setwd("C:/lab/greenland/")

# list the files
rlist <- list.files(pattern="lst")
rlist

# import the data with lapply
import <- lapply(rlist, raster)
import

# now we stack all together the 4 layers, the 4 images
tgr <- stack(import) # tgr = Temperature of Greenland
tgr

# now we plot all the 4 images with colours
cl <- colorRampPalette(c("blue", "light blue", "pink", "yellow"))(100)
plot(tgr, col=cl)

# let's do that with the ggplot, but plot only the first (2000) and the last image (2015)
p1 <- ggplot() + geom_raster(tgr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma") + ggtitle("LST in 2000")
p4 <- ggplot() + geom_raster(tgr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma") + ggtitle("LST in 2015")

# now we plot the together
p1 + p4


# plotting frequency distributions of data
par(mfrow=c(2,2))
hist(tgr$lst_2000)
hist(tgr$lst_2005)
hist(tgr$lst_2010)
hist(tgr$lst_2015)

plot(tgr$lst_2010, tgr$lst_2015)
abline(0,1) # this function add a line to the graph

# let the line start from zero
plot(tgr$lst_2010, tgr$lst_2015, xlim=c(12500, 15000), ylim=c(12500,15000))
abline(0,1, col="red")

# make a plot with all the histograms, all the regression for all the variables
par(mfrow=c(4,4))
hist(tgr$lst_2000)
hist(tgr$lst_2005)
hist(tgr$lst_2010)
hist(tgr$lst_2015)
plot(tgr$lst_2000, tgr$lst_2005, xlim=c(12500, 15000), ylim=c(12500,15000))
plot(tgr$lst_2000, tgr$lst_2010, xlim=c(12500, 15000), ylim=c(12500,15000))
plot(tgr$lst_2000, tgr$lst_2015, xlim=c(12500, 15000), ylim=c(12500,15000))
plot(tgr$lst_2005, tgr$lst_2010, xlim=c(12500, 15000), ylim=c(12500,15000))
plot(tgr$lst_2005, tgr$lst_2015, xlim=c(12500, 15000), ylim=c(12500,15000))
plot(tgr$lst_2010, tgr$lst_2015, xlim=c(12500, 15000), ylim=c(12500,15000))

# let's do it in an easier way!
# let's use the pairs function, it creates matrices of scatterplots
pairs(tgr)
# we obtain a comparison between the files
# we obtain 4 histrograms, because we have 4 variables, and 6 graphs, (4*3/2, each graph is a comparison between two images)

# nei grafici, in basso a sx ci sono le temperarture più basse. 
# in that part, with low temperatures, for every temperature in 2000 there's not the same temperature in 2015 bu higher, and that justify ice melt



