# 1st Function ----

say.hello <- function() # Observe function as variable assigned to function, also . 
{
  print("Hello World!")
}

say.hello() # Invoking the function

hello.person <- function(name)
{
  print(sprintf("Hello %s!",name))
}

hello.person("Torstein")        # Without argument name
hello.person(name = "Torstein") # Using argument name

names <- c("Torstein" ,"Tonje", "Tone")
hello.person(names) #Invoking the function for each element in vector

hello.fullname <- function(first, last)
{
  print(sprintf("Hello %s %s", first, last))
}

# List of 2 vectors - first and last
fullNames <- list(firstNames = c("Torstein", "Tonje", "Tone"), lastNames = c("Nesby", "Nesby", "Andersen"))
fullNames$firstNames

hello.fullname(first = fullNames$firstNames, last = fullNames$lastNames)

# Data frame - first - last
fullNDF <- data.frame(firstN = c("Torstein", "Tonje", "Tone"), lastN = c("Nesby", "Nesby", "Andersen"))

hello.fullname(first = fullNDF$firstN, last = fullNDF$lastN)

# Default argument ----

hello.last <- function(first, last = "Doe")
{
  print(sprintf("Hello %s %s", first, last))
}

hello.last(first = fullNDF$firstN)
hello.last(first = fullNDF$firstN, last = fullNDF$lastN)

# Extra argument ----

hello.extra <- function(first, last = "Doe", ...)
{
  print(sprintf("Hello %s %s", first, last))
}

hello.extra(first = fullNDF$firstN)
hello.extra(first = fullNDF$firstN, last = fullNDF$lastN)
hello.extra(first = fullNDF$firstN, last = fullNDF$lastN, 1:3, "Test")

# Return Value ----

double.num <- function(x)
{
  x*2
}

double.num(1:3)

double.num <- function(x)
{
  return(x*2)
}

double.num(1:5)

# do.call ----

do.call("hello.fullname", args = list(first = "Torstein", last = "Nesby"))
do.call(hello.fullname, args = list(first = "Torstein", last = "Nesby"))
do.call(hello.last, args = list(fullNDF$firstN))

