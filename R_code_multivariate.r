# R code for measuring community interactions
install.packages("vegan")
library(vegan)

setwd("C:/lab/")

# now we download the data, a complete project (and not data as last time)
# we use the load function
load("biomes_multivar.RData")

# let's see the files present in the project just uploaded
ls()
# now i see all the dataset of one of the elements present in the ls()
biomes 
# columns: species; raws: frequency

biomes_types

multivar <- decorana(biomes)
multivar

plot(multivar)

# now we plot the biomes to see if the species are in the same biome or not
attach(biomes_types)
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind="ehull", lwd=3)
ordispider(multivar, type, col=c("black", "red", "green", "blue"), label=TRUE)

# sdm: species distribution modeling package
install.packages("sdm")
library(sdm)
