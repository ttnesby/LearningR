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
