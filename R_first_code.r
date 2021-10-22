# This is my first code in github! Quite exciting, right?

# Here are the input data
# Costanza data on streams
water <- c(100, 200, 300, 400, 500)
water

# Marta data on fishes genomes
fishes <- c(10, 50, 60, 100, 200)
fishes

# plot the diversity of fishes (y) versus the amount of water (x)
plot(water, fishes)

# the data we developed can be stored in a table
# a table in R is called data frame

streams<-data.frame(water,fishes)

# From now on, we are going to import and/or export data!

setwd("C:/lab")

# Let's export our table!
write.table(streams, file="my_first_table.txt")

# Some colleagues did send us a file. How to import it in R? Let's import the dataset into R!
read.table("my_first_table.txt")

# Let's assign the table (dataframe) to an object inside R
silviatable<-read.table("my_first_table.txt")

# Let's do our first statistic in R! We're going to do a summary of the dataset.
summary(silviatable)

# Marta does not like water
# Marta wants to get info only on fishes
summary(silviatable$fishes)

# Let's make an histogram
hist(silviatable$fishes)
hist(silviatable$water)
