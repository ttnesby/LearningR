# 3 building blocks, anonymous func, function closure, list of func

# Motivation

set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99,-999,-9999), 6, rep = TRUE)))
names(df) <- letters[1:6]

# How to substitue -99 (missing info) to NA as clean as possible?
# pragmatic programmer - don't repeat yourself DRY

fix_missing <- function(x){
     # Substitue -99 with NA
     x[x == -99] <- NA
     # Return the new vector
     x
}

# By df[] will get data frame instead of list
# lapply work column-wise through data frame - thus on each vector
df[] <- lapply(df, fix_missing)

# In case there are multiple values to fix

missing_fixer <- function(to_be_na){
     function(x){
          x[x == to_be_na] <- NA
          x
     }
}

# Need to create a function per to_be_na value...
fix_missing_99 <- missing_fixer(-99)
fix_missing_999 <- missing_fixer(-999)

# Better aproach - supporting vector of to_be_na's instead of multiple functions
fix_missing_v2 <- function(x, to_be_na){
     # Substitue to_be_na with NA
     x[x %in% to_be_na] <- NA
     # Return the new vector
     x
}

df[] <- lapply(df, fix_missing_v2, to_be_na = c(-99, -999, -9999))

# Functions in list

# Need to handle different nummerical summaries for different columns

mean(df$a)
median(df$a)
sd(df$a)
mad(df$a)
IQR(df$a)

# ... and for the other columns...

# Can invoke a function

summary <- function(x){
     c(mean(x), median(x), sd(x), mad(x),IQR(x))
}

# A little better, but still a lot of repetition - DRY

# Establish a vector of relevan functions and iterate them with anonymous func for invoking them
summary <- function(x) {
     funs <- c(mean, median, sd, mad, IQR)
     lapply(funs, function(f) f(x, na.rm = TRUE))
}

# Anonymous function

(function(x) 3)()

# Main purpose of anonym func is closure, function returning a func
power <- function(exponent) {
     function(x) {
          x ^ exponent
     }
}

square <- power(2)
square(12)

cube <- power(3)
cube(4)

# to see details for closure cases
as.list(environment(square))
require(pryr)
unenclose(square)

# Mutable state
new_counter <- function() {
     i <- 0
     function() {
          i <<- i + 1  # <<- will look for name in the parent env, thus, new_counter i
          i
     }
}

counter_1 <- new_counter()
counter_2 <- new_counter()

counter_1()
counter_2()

# List of functions - functions can be stored in lists

compute_mean <- list(
     base = function(x) mean(x),
     sum = function(x) sum(x) / length(x),
     manual = function(x) {
          total <- 0
          n <- length(x)
          for (i in seq_along(x)) {
               total <- total + x[i] / n
          }
          total
     }
)

x <- runif(1e5)
system.time(compute_mean$base(x))
system.time(compute_mean$sum(x))
system.time(compute_mean$manual(x))

require(microbenchmark)

print(microbenchmark(NULL, compute_mean$manual(x), times=1000L))
boxplot(microbenchmark(compute_mean$manual(x)))

# Check that the results are the same
lapply(compute_mean, function(f) f(x))

# Another way with defined func
call_fun <- function(f, ...) f(...)
lapply(compute_mean, call_fun, x)

# Micro benching while iterating list
lapply(compute_mean, function(f) print(microbenchmark(f(x))))

