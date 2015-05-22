# Load diamon data ----
require(ggplot2)
data(diamonds)

# Diamonds to Mathematica ----

homeDir <- "~/Rtmp"
if (!dir.exists(homeDir)) {
  dir.create(homeDir)
}
save(diamonds, file = paste(homeDir, "diamonds.rdata", sep = "/"))
write.csv(
  diamonds, 
  file = paste(homeDir, "diamonds.csv", sep = "/"), 
  fileEncoding = "UTF-8"
  )

# Base Histogram ----

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


# ggplot2 Histogram, Density, Scatter plot and MORE  ----

require(ggplot2)

ggplot(data = diamonds) + geom_histogram(aes(x = carat))

ggplot(data = diamonds) + geom_density(aes(x = carat))

ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point() # Scatter plot

# ggplot2 - Playing aorund with settings ----

scPlot <- ggplot(data = diamonds, aes(x = carat, y = price)) # saving to variable

scPlot + geom_point(aes(color = color)) #Adding color based on color column of diamonds

scPlot + geom_point(aes(color = color)) + facet_wrap(~color)      # Separate into plots
scPlot + geom_point(aes(color = color)) + facet_grid(cut~clarity) # Separate into plots in grid

ggplot(data = diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)

ggplot(data = diamonds, aes(y = carat, x = 1)) + geom_boxplot() 

ggplot(data = diamonds, aes(y = carat, x = cut)) + geom_boxplot() 

ggplot(data = diamonds, aes(y = carat, x = cut)) + geom_violin() 











