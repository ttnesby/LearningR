# http://adv-r.had.co.nz/Environments.html

# Environment basic ----

# "bag" of names pointing to objects elsewhere in memory
e <- new.env()
e$a <- FALSE
e$b <- "a"
e$c <- 2.3
e$d <- 1:3

rm("d", envir = e) # will result in garbage collecting of 1:3

# e has two components; 
# 1) the frame hosting the name-object binding
# 2) parent environment - no pointer back to child

# 4 special environment
# a) globalenv() - workspace - parent of global is the last loaded package (stack)
# b) baseenv() - environment of base package - parent is empty env
# c) emptyenv() - ultimate ancestor of all env - no parent
# d) environment() - current env

search() # lists all env of globalenv
as.environment("package.stats") # accessing an env
new.env() # creates a new env

ls(e) # list all names in env, all.names = TRUE for all names, prefixed .
e$.a <- 2L
ls(e)
ls(e, all.names = TRUE)

str(e)
ls.str(e, all.names = TRUE) # list all details in env

# accessing env names
e$a
e[["a"]]
get("a", e)

exists("a", envir = e) # check if name exists in env, following regular scoping rules

identical(globalenv(), environment()) # check for equal env

install.packages("pryr")
library(pryr)

where("x") # where is hosted in pryr package

# Function environment ----

# Function and enclosing environment - where function is defined
# Function and execution environment - when calling a function, storing local assignments
# Every execution environment is associated with calling env, where the func was called

# Lexical scoping using enclosing env - where function is defined
environment(<function_name>) # the enclosing env for function_name

# When you create a function inside another function, the enclosing environment of the child 
#function is the execution environment of the parent, and the execution environment is 
#no longer ephemeral.

# Quotes ----

#  <- creates name in current env
# <<- create/modify by walking the lexical scoping
# %<d-% delayed assignment - delayedAssign
# %<a-% active assignment, calc when accessed - makeActiveBinding

# Using Env as data structure ----

# NB parent should be emptyenv()

# good for reference semnatic, avoid copy of large data
# managing state within a package
# Efficient looking up values from names
