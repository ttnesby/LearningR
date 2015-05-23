# if - else if - else ----

as.numeric(c(TRUE,FALSE))  # Remember TRUE and FALSE to 1 and 0

numbers  <- runif(5, 0.0, 7.7)  # 5 Random numbers between 0 and 7.7

3.5 == numbers  # logical tests
3.5 < numbers
3.5 <= numbers
3.5 > numbers
3.5 >= numbers
3.5 != numbers

if (3 > numbers)     # if-clause IS NOT VECTORIZED - ONLY 1st element
{
  print("true")
} else
{
  print("false")
}

if (3 < numbers)
{
  NULL
} else if (2 > numbers)
{
  NULL
} else
{
  NULL
}

# switch ----

x <- letters[sample(1:26, 1)] 
switch(x,                          # if-clause IS NOT VECTORIZED - ONLY 1st element
       "a" = "alfa", 
       "b" = "bravo", 
       "c" = "charlie", 
       "d" = "delta",
       "e" = "echo",
       "f" = "foxtrot",
       "golf")

# ifelse ----

ifelse(3 < numbers, "> 3", "<=3")  # ifelse-clause IS VECTORIZED :-)

ifelse(3 < numbers, numbers*2, "<=3")

# Compound tests ----

# if     - use of && or ||
# ifelse - use of & or | - if misuse of && or || - single element...

# for Loops ----

for(i in 1:10)
{
  print(i)
}

fruits <- c("apple", "banana", "grape", "orange", "something")
for (fruit in fruits)
{
  if (fruit == "apple"){next}  # skipping versus break to stop
  print(fruit)
}

# while Loops ----

# Not used frequently in R

x <- 1
while (x <= 5)
{
  print(x)
  x <- x + 1
}
