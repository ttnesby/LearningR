# Base Histogram ----

require(ggplot2)
data(diamonds)
hist(
  diamonds$carat,
  #breaks = 10,
  main = "Carat histogram",
  xlab = "Carat"
  )

# Base Scatter plot ----

# For observing two variables

plot(price~carat, data = diamonds)    # formula notation y~x
plot(diamonds$carat, diamonds$price)  # x, y notation

# Boxplot ----

# Middle of box - median
# Box is bounded by 1st and 3rd quartiles
# Conclusion - cannot see 50% of the data...

boxplot(diamonds$carat)

# Diamonds to Mathematica ----

homeDir <- "~/Rtmp"
if (!dir.exists(homeDir)) {
  dir.create(homeDir)
}
save(diamonds, file = paste(homeDir, "diamonds.rdata", sep = "/"))

# ggplot 2 Histogram and Density ----

require(ggplot2)
ggplot(data = diamonds) + geom_histogram(aes(x = carat))

ggplot(data = diamonds) + geom_density(aes(x = carat))