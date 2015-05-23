# Apply family ----

# apply, tapply, lapply, mapply

# apply - only for matrix

aMatrix  <- matrix(1:9, nrow = 3)
apply(aMatrix, 1, sum) # sum the rows
apply(aMatrix, 2, sum) # sum the columns

aMatrix[2, 1] <- NA
apply(aMatrix, 1, sum)                # sum rows, giving NA for the row with at any NA
apply(aMatrix, 1, sum, na.rm = TRUE)  # sum rows, removing NA cases 

rowSums(aMatrix)                      # ya function doing the same
rowSums(aMatrix, na.rm = TRUE)

# lapply - only for list

aList  <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
lapply(aList, sum) # sum each element in list - returning a list - cumbersome
sapply(aList, sum) # same as lapply - returning a vector instead

# mapply - for multiple lists

firstList  <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5)
secondList  <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1)

mapply(identical, firstList, secondList)

# Length of each list element for 2 lists
ttn.length2Lists <- function(l1, l2)
{
  NROW(l1) + NROW(l2)
}

mapply(ttn.length2Lists, firstList, secondList)

# Balancing act between *apply functions and plyr package
# tapply, rapply, eapply, vapply, by - advantages over plyr

# aggregate ----

require(ggplot2)
data(diamonds)
head(diamonds)


aggregate(price ~ cut, diamonds, mean)          # mean of price, aggr by cut from data set diamonds 
aggregate(price ~ cut + color, diamonds, mean)  # as above, but sub aggr by color

# NB, can use na.rm = TRUE in aggr for NA management

aggregate(cbind(price, carat) ~ cut, diamonds, mean)          # as above, but adding mean for carat
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)  # as above, but but sub aggr by color

# plyr - strong extension to R ----

# strong addition for split-apply-combine tedious operations
# See chapter 11.3 for a long list of function

require(plyr)
data(baseball)
head(baseball)

# ddply - input data.frame - output - data.frame

