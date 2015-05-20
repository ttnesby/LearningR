#This is a comment

# Installing and uninstall packages ----
install.packages("a_packate")
remove.packages("a_package")

# Load and unload packages ----
library(a_package)
require(a_package) # Returning TRUE|FALSE for success or not
detach("a_package")

# In case of name conflict across packages, the last loaded package has presedence
# Back to Ada - never use use, use is useless
# By the following syntax, the package don't need to be loaded before invoking the function
<package>::<function_name>

#Some basic math operations ----
10*10 #This is a another comment
sqrt(4)
3*7*2
4/3

# Assignment ----
x <- 2        # Standard notation
y = 5
3 -> z        # Possible to flip around the assignment
a <- b <- 7   # Multiple assignments
assign("j",4) # Assignment function, required once a while?
i <- 5L       # Assign Integer type

# Variables are CaseSensitive, use of numbers, _ and even .

# Automatic garbage collection, just in case of thight of memory or large data set
# Remove (memory clear) of a variable
rm(j)

# Check data type
is.numeric(x)  # Numeric is the most common one, integer and decimals (float, double)
is.integer(i)
class(i)       # Returning the data type as string

# Normal string versus vector
x <- "Hello World!"
y <- factor("Hello World") # Vectorized

# Character are CaseSensitive

# Length of string/characters/numeric
nchar(x)

# Dates - reference January 1th 1970 
# Date as days since reference
# POSIXct as seconds since reference

date1<-as.Date("2015-04-28")
date2<-as.POSIXct("2015-04-28 02:56:23")
as.numeric(date2)

# EASIER date handling by using chron or lubridate

# TRUE (as 1) FALSE(as 0) ----
TRUE
FALSE

TRUE*5      # operation on boolean due to 1|0
FALSE*10

x <- TRUE
is.logical(x) # check if logical

# Comparison, ==, !=, >, <, >=, <= 
2==3
2!=3
"text" < "text2"

# Vectors - elements of the same type, c(combine) function, alternative - use of : ----
c(1,2,3)
-5:5
x <- c(1,2,3,4)

c("hello","world","this","a","test")

# !! cannot mix data types in vector - NOT column/row vector
# R as vectorized language - AUTOMATIC operations on each element in vector

x*4         # Each element in vector multiplied by 4
x+2         # Each element in vector added 2
x^2         # ...
sqrt(x)     # ...

# UNEQAL length of vectors - the shorter is recycled to match the longest one,
# ASSUMING that the long one is an integer factor longer that the shortest.

y <- -5:5
length(y)   # length of vector

z <- 1:11
y*z         # Assuming vector of equal length
x*y         # OBS - vectors of different length => warning!
x <= 3      # Check if each elem is less or equal to 3

all(x <= 3) # check if all elements are true
any(x <= 3) # check if any is true

# Getting elements in vector
x[1]       # single
x[1:3]     # consecutive elements
x[c(1,3)]  # non-consecutive

# Naming a vector
c(One="a", Two="b", Three="c") # During creation
w<-1:3
names(w)<-c("a","b","c")       # After creation


# Importance of factor (category/enumeration) when building models
# storing unique values as numbers, only numbers are repeated, SAVING space

q<-c("Hockey","Football","Baseball","Curling","Rugby","Lacrosse","Basketball","Tennis","Cricket","Soccer")
q2<-c(q,"Hockey","Lacrosse","Hockey","Water Polo","Hockey","Lacrosse")
q2Factor<-as.factor(q2)
q2Factor                  # Levels are the unique components of the vector - can also order the level
as.numeric(q2Factor)

schools <- factor(
  x=c("High School","College","Masters","Doctorate"),
  levels=c("High School","College","Masters","Doctorate"),
  ordered=TRUE
  )

# Help on functions
?`+`
?mean

# If need of help on start of function name
apropos("mea")

# Absence of data NA, absence of anything NULL

z<-c(1,2,3,NA,5,6)    # Absence of data - NA
is.na(z)
c(1,NULL,2)           # Absence of anything - nothingness - CANNOT exist within a vector
is.null(NULL)


# Chapter 5 - Advanced Data Structures ----


# data.frames - rows and columns ----


# Each column is a variable , each row is an observation
# Each row is actually a vector => same data type

x<- 10:1
y<- -4:5
q<- c("one","two","three","four","five","six","seven","eight","nine","ten")
theDF<-data.frame(x,y,q)
theDF

nrow(theDF)  # no of rows
ncol(theDF)  # no of columns
dim(theDF)   # dimension row, column

# Setting the name for columns, even setting the name for rows

names(theDF) <- c("First","Second","names") 
names(theDF)
rownames(theDF) <- c("one","two","three","four","five","six","seven","eight","nine","ten")
rownames(theDF)
rownames(theDF) <- NULL  # Setting row names back to index

# Printing a few lines - head, tail
head(theDF,4)
tail(theDF,3)

theDF[3]             # Get 3rd column
theDF$names          # Get column name
theDF[3,2]           # 3rd row, 2nd column
theDF[3,1:3]         # 3rd row, column 1:3
theDF[2:5,1:3]       # ...
theDF[c(3,6),1:3]    # 3rd and 6th row, column 1:3
theDF[,2]            # all in column 2
theDF[3,]            # row 3 for all columns
theDF[["names"]]     #returning the factor for relevant column

# NB! Careful about the syntax for returning factor vector versus data.frame...

# Lists ----

# Can hold various data types

list(1,2,3)                  # list with 3 elements
list(c(1,2,3))               # list with 1 element - vector
(list3 <-list(c(1,2,3),3:7)) # list with 2 elements, vectors of different length, enclosing paranthese - show result
list(theDF, 1:10)            # list with 2 elements, data.frame and vector

list5 <- list(theDF, 1:10, list3)
names(list5) <- c("data.frame", "vector", "list") # Adding names to list elements
emptyList <- vector(mode="list", length=4)        # Creating empty list with vector...

# Accessing list elements

list5[[1]]             # by element
list5[["data.frame"]]  # by name
list5[[1]]$names       # Accessing element returned from list
list5[[1]][,3]         # Accessing element returned from list

# Adding list elements

list5[4] <- 2               # Adding unnamed 4th elem
list5[["NewElement"]] <- 3:6  # Adding named 5th elem

# Length of list

length(list5)

# PERFORMANCE TIP - adding to a long list is slow, create an empty list and define the elements

# Matrices ----


A <- matrix(1:10, nrow = 5)
B <- matrix(21:30, nrow = 5)
C <- matrix(21:40, nrow = 2)

# nrow, ncol, dim as before, also addition, sub, ...
# also both row and column names

A + B
A * B
A == B

A %*% t(B)  # Matrix operation, transpose of B

# Special vectors - letters and LETTERS

# Arrays ----

# Multidimensional vector

theArray <- array(1:12, dim = c(2,3,2))
theArray