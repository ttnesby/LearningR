#This is a comment

#Some basic math operations
10*10 #This is a another comment
sqrt(4)
3*7*2
4/3
# Assignment
x<-2
x
y=5
y
3 -> z
z
# Multiple assignments
a <- b <- 7
a
b
# Assignment, required once a while?
assign("j",4)
j
# Remove (memory clear) of a variable
rm(j)
j
# Data type
is.numeric(x)
# Integer type
i <- 5L
is.integer(i)
# Returning the data type
class(i)

# Normal string versus vector
x<-"Hello World!"
x
y<-factor("Hello World")
y

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
TRUE*5
FALSE*10

# Comparison, ==, !=, >, <, >=, <= 
2==3
2!=3
"text" < "text2"

# Vectors, c(combine) function, use of :
c(1,2,3)
x<-c(1,2,3,4)

c("hello","world","this","a","test")

# !! cannot mix data types in vector - NOT column/row vector
# AUTOMATIC operations on each element in vector

x*4
x+2
x^2
sqrt(x)

y<--5:5
length(y)
z<-1:11
y*z

# OBS - vectors of different length => warning!
x*y

x <= 3

# check if all are true
all(x <= 3)

# check if any is true
any(x <= 3)

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
