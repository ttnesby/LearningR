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
boxplot(diamonds$carat)
