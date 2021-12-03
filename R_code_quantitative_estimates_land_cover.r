# R_code_quantitative_estimates_land_cover.r

library(raster)
library(RStoolbox)
library(ggplot2)
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
l1996 <- list_rast[[1]]
plotRGB(l1996, r=1, g=2, b=3, stretch="lin")

# let's do the same with the 2006 image
l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# let's estimate the amount of forest loss
# Unsupervised classification
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
ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white") 
