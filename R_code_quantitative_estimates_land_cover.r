# R_code_quantitative_estimates_land_cover.r

library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)
setwd("C:/lab/")

# brick
# 1. list the files available
rlist <- list.files(pattern="defor")

# 2. lapply_ apply a function to a list
list_rast <- lapply(rlist, brick)
list_rast

# let's obtain the image of 1996

plot(list_rast[[1]])

# defor: NIR1, red 2, green 3
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")
# let's assign an easier name to the image
l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

# let's do the same with the 2006 image
l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# let's estimate the amount of forest loss
# Unsupervised classification: now we classify the pixels
l1992 <- list_rast[[1]]
l1992c <- unsuperClass(l1992, nClasses=2)
l1992c

# let's obtain an image with 2 values: 1 and 2.
plot(l1992c$map)
# value 1 = agricultural areas and water
# value 2 = forest

# how many pixels are forest and how much are agricultural areas?
freq(l1992c$map)
# agricultural areas and water (class 1) = 35807
# forest (class 2) = 305485

# calculate the proportion of agricultural and forest areas
# the number 341292 is the total number of pixel
# i find this number in the properties of l1992c
total <- 341292
propagri <- 35807/total
propagri #  0.104916 ~ 0.10 -> agricultural and water areas
propforest <- 305485/total
propforest # 0.895084 ~ 0.90 -> forest areas

# build a dataframe: 3 rows, 2 columns: 1st column: cover, forest, agricultural. 2nd column: proportion
cover <- c("Forest","Agriculture")
prop1992 <- c(0.895084, 0.104916)
proportion1992 <- data.frame(cover, prop1992)
proportion1992

# let's make a plot, an histogram
# to use this function, the ggplot package is requested. we installed it at the beginning of the code
ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white") 
# aes in the previous code stays for aesthetics

# 06.12

l2006 <- list_rast[[2]]
l2006c <- unsuperClass(l2006, nClasses=2)
l2006c

# let's obtain an image with 2 values: 1 and 2.
plot(l2006c$map)
# value 1 = agricultural areas and water
# value 2 = forest

# how many pixels are forest and how much are agricultural areas?
freq(l2006c$map)
# agricultural areas and water (class 1) = 35807
# forest (class 2) = 305485

# calculate the proportion of agricultural and forest areas
# the number 341292 is the total number of pixel
# i find this number in the properties of l2006c
total <- 342726
propagri2006 <- 163352/total
propagri2006 #  0.4766256 ~ 0.48 -> agricultural and water areas
propforest2006 <- 179374/total
propforest2006 # 0.5233744 ~ 0.52 -> forest areas

# build a dataframe for the 2006 image
cover <- c("Forest", "Agriculture")
prop1992 <- c(propforest, propagri)
prop2006 <- c(propforest2006, propagri2006)
proportion <- data.frame(cover, prop1992, prop2006)

# let's make a plot, an histogram
ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white") 

# let's plot everything together
# we need the library(gridExtra) to use the grid.arrange function to put several graphs in the multi frame
# let's first assign every ggplot to an object
p1 <- ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white") 
p2 <- ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white") 

grid.arrange(p1, p2, nnow=1)

# to have the same scale bar and the same y max value, we can add ylim(0,1) to the ggplot fuunction 
p1bis <- ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(0,1)
p2bis <- ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(0,1)
grid.arrange(p1bis, p2bis, nnow=1)?? non va



