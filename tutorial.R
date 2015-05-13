#This is a comment

#Some basic math operations
10*10 #This is a another comment
sqrt(4)
3*7*2
4/3

# Assignment, the first is actually the standard one
x <- 2
y = 5
3 -> z        # Possible to flip around the assignment
a <- b <- 7   # Multiple assignments
assign("j",4) # Assignment function, required once a while?
i <- 5L       # Assign Integer type

# Remove (memory clear) of a variable
rm(j)

# Check data type
is.numeric(x)
is.integer(i)
class(i)       # Returning the data type

# Normal string versus vector
x <- "Hello World!"
y <- factor("Hello World") # Vectorized

# Length of string/characters/numeric
nchar(x)

# Dates - reference January 1th 1970 
# Date as days since reference
# POSIXct as seconds since reference

date1<-as.Date("2015-04-28")
date2<-as.POSIXct("2015-04-28 02:56:23")
as.numeric(date2)

# TRUE (as 1) FALSE(as 0)
TRUE
FALSE

TRUE*5      # operation on boolean due to 1|0
FALSE*10

# Comparison, ==, !=, >, <, >=, <= 
2==3
2!=3
"text" < "text2"

# Vectors, c(combine) function, use of :
c(1,2,3)
-5:5
x <- c(1,2,3,4)

c("hello","world","this","a","test")

# !! cannot mix data types in vector - NOT column/row vector
# OBSERVE AUTOMATIC operations on each element in vector

x*4         # Each element in vector multiplied by 4
x+2         # Each element in vector added 2
x^2         # ...
sqrt(x)     # ...

y <- -5:5
length(y)

z <- 1:11
y*z         # Assuming vector of equal length
x*y         # OBS - vectors of different length => warning!
x <= 3      # Check if each elem is less or equal to 3

all(x <= 3) # check if all elements are true
any(x <= 3) # check if any is true

# Element in vector
x[1]
x[1:3]
# non-consecutive
x[c(1,3)]

# Naming a vector, also afterwards

c(One="a", Two="b", Three="c")

w<-1:3
names(w)<-c("a","b","c")
w

# Importance of factor (category/enumeration)

q<-c("Hockey","Football","Baseball","Curling","Rugby","Lacrosse","Basketball","Tennis","Cricket","Soccer")
q2<-c(q,"Hockey","Lacrosse","Hockey","Water Polo","Hockey","Lacrosse")
q2Factor<-as.factor(q2)
q2Factor

#Levels are the unique components of the vector - can also order the level

factor(x=c("High School","College","Masters","Doctorate"),levels=c("High School","College","Masters","Doctorate"),ordered=TRUE)

# Help on functions
?`+`
?mean

# If need of help on start of function name
apropos("mea")

# Missing data - NA
z<-c(1,2,3,NA,5,6)
is.na(z)

# NULL - absence of anything - nothingness - CANNOT exist within a vector
c(1,NULL,2)

is.null(NULL)

# data.frames
# Each column is a variable (vector - rows), each row is an observation

x<- 10:1
y<- -4:5
q<- c("one","two","three","four","five","six","seven","eight","nine","ten")
theDF<-data.frame(x,y,q)
theDF

nrow(theDF)
ncol(theDF)
dim(theDF)

names(theDF)<-c("First","Second","names")
names(theDF)

# Printing a few lines - head, tail
head(theDF,4)
tail(theDF,3)

theDF[3]
theDF$names
theDF[3,2] #3rd row, 2nd column
theDF[3,1:3]
theDF[2:5,1:3]
theDF[c(3,6),1:3]
theDF[,2] # all in column 2
theDF[3,] # row 3 for all columns
theDF[["names"]] #returning the factor for relevant column
