# http://adv-r.had.co.nz/Functions.html

# Basic about functions ----
x <- 10
f1 <- function(x) {
     function() {
          x + 10
     }
}
f1(1)()

# f1(1) will return the function, thus
# <function>() is just a normal function invocation - no params

f2 <- function(a, b) {
     a * 10
}
f2(10, stop("This is an error!"))

# Returning 100 - lazy evaluation, b is NOT used

f <- function(x) x^2
f

# All functions have 3 parts, can use them for CHANGING function.....!!

formals(f)
body(f)
environment(f)

# Cannot see 3 parts when implemented in C code

# Lexical Scoping ----

# ** Name masking **

# Use local assigned objects
f <- function() {
     x <- 1
     y <- 2
     c(x, y)
}
f()
rm(f)

# If not local assigned object, look into the parent environm
x <- 2
g <- function() {
     y <- 1
     c(x, y)
}
g()
rm(x, g)

# As above, just one more level of function inside function
x <- 1
h <- function() {
     y <- 2
     i <- function() {
          z <- 3
          c(x, y, z)
     }
     i()
}
h()
rm(x, h)

# Same apply for closure - function defined by function

j <- function(x) {
     y <- 2
     function() {
          c(x, y)
     }
}
k <- j(1)
k()
rm(j, k)

# Finding funcions works as finding variables above

l <- function(x) x + 1
m <- function() {
     l <- function(x) x * 2
     l(10)
}
m()
rm(l, m)

# It is a difference to search for function versus variable
# n-function will be used, NOT the n variable

n <- function(x) x / 2
o <- function() {
     n <- 10
     n(n)
}
o()
rm(n, o)

# ** A Fresh Start **

j <- function() {
     if (!exists("a")) {
          a <- 1
     } else {
          a <- a + 1
     }
     print(a)
}
j() # Returning same value each time due to execution environment for each invocation
rm(j)

# ** Dynamic Lookup **

# Demonstrating the point, don't want to do this, loosing self containment...
# Can use codetools::findGlobals(f) to find external references in case of glitch

f <- function() x
x <- 15
f()

x <- 20
f()

# Every Operation in R is a function call ----

# don't be confused by infix functions
x <- 10; y <- 5
x + y
`+`(x, y)

for (i in 1:2) print(i)
`for`(i, 1:2, print(i))

if (i == 1) print("yes!") else print("no.")
`if`(i == 1, print("yes!"), print("no."))

x[3]
`[`(x, 3)

{ print(1); print(2); print(3) }
`{`(print(1), print(2), print(3))

# Can be used in some cases, e.g.
add <- function(x, y) x + y
sapply(1:10, add, 3)
sapply(1:5, `+`, 3) # avoiding add, use of +-function
sapply(1:5, "+", 3) # as above, sapply will translate char to function-name

x <- list(1:3, 4:9, 10:12)
sapply(x, "[", 2)              # use of infix function instead of anonymous func
sapply(x, function(x) x[2])    # better to use existing infix function

# “To understand computations in R, two slogans are helpful:
#      
#      Everything that exists is an object.
#      Everything that happens is a function call."
# — John Chambers

# Function Arguments ----

# Pri 1 - Exact match
# Pri 2 - Partial match
# Pri 3 - Positioning

# Calling function with a list of arguments

args <- list(1:10, na.rm = TRUE)
do.call(mean, args)

# Default arguments

f <- function(a = 1, b = 2) {
     c(a, b)
}
f()

# Lazy evaluation...

g <- function(a = 1, b = a * 2) {
     c(a, b)
}
g()
g(10)

f <- function(x) {
     10
}
f(stop("This is an error!"))

f <- function(x) {
     force(x)
     10
}
f(stop("This is an error!"))

# Checking if arguments are given

i <- function(a, b) {
     c(missing(a), missing(b))
}
i()
i(a = 1)
i(b = 2)
i(1, 2)

# Special Calls -  ----

# Create custom infix functions

`%+%` <- function(a, b) paste0(a, b)
"new" %+% " string"
`%+%`("new", " string")

# Create custom replacement func

`second<-` <- function(x, value) {
     x[2] <- value
     x
}
x <- 1:10
second(x) <- 5L
x

# on.exit

in_dir <- function(dir, code) {
     old <- setwd(dir)
     on.exit(setwd(old))
     
     force(code)
}
getwd()
in_dir("~", getwd())
