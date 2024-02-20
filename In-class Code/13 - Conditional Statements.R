
################################################################################
############################ Conditional Statements ############################
################################################################################

# conditional statements: if, else, and else if statements
# related functions: ifelse() and switch()


##### if statements
#################################

### a block of code is run only if a certain condition (or conditions) is true

# Example 1
a <- 5

if (a > 0) {    # think: *if* a > 0, *then* b <- 1
  b <- 1
}

b    # if statement resulted in TRUE, so inner code evaluated


if (a < 0) {
  d <- 1
}

d    # if statement resulted in FALSE, so inner code not evaluated



# Example 2
x <- 2
y <- 3
z <- 4

if (x <= y) {
  w <- x^2
}

w


if (x >= y) {
  w2 <- x^2
}

w2



# Example 3
if (x <= y) {
  x <- x^2
}

x    # careful w/ something like this!


# again!
if (x <= y) {
  x <- x^2
}

x  # note that x wasn't squared again since condition not satisfied this time



### can put if statements on one line without { }

# Example 4
y
z

if (y <= z) w2 <- y^2

w2



# Example 5
myvec <- c(1, 5, 3, 7, 8, 10)

if (any(myvec > 4)) {
  myvec2 <- myvec + 2
  myvec2    # can have more than one line of code inside of an if statement
}



### need to be careful using if statements w/ vectors

# Example 6
if (myvec < 6) {
  a <- 10
}

a    # first comparison resulted in TRUE, so inner code evaluated



# Example 7
myvec

if (myvec[4] < 8 & myvec[5] > 7) {
  a <- myvec[6]^2
}

a  # if statement resulted in TRUE, so inner code evaluated



# Example 8
myvec

if (myvec[4] > 2 & myvec[4] < 6) {
  d <- myvec[6]^2
}

d  # if statement resulted in FALSE, so inner code not evaluated




##### if-else statements
#################################

# can specify what happens if condition is FALSE
# pair an if statement w/ an else statement

# Example 8
myvec

if (myvec[4] < 5) {    # look at placement/matching of curly braces
  a <- 10
} else {
  a <- 20
}

a    # condition is FALSE, so if statement code is not run, but else 
     #  statement code is run



### if statements check the condition of only a single logical value
### if you have a vector of logicals for the condition, then the if statement 
###  will only check the first element -- use the ifelse() function instead 
###  of if and else statements to check vectors element-wise

# Example 9
myvec

if (myvec > 0) {
  c <- 5
}

c  # only first element checked... myvec[1] > 0 = TRUE, so c <- 5


if (myvec > 2) {
  d <- 5
}

d  # only first element checked... myvec[1] > 2 = FALSE, so inner code not run


if (myvec > 2) {
  e <- 5
} else {
  e <- 8
}  # still only looking at first element!

e



### the ifelse() function performs element-wise checks for entire vectors

# Example 10
myvec

# inputs to ifelse(): (1) condition, (2) what happens if condition is true, 
#  and (3) what happens if condition is false
ifelse(myvec > 2, 1, 0)  


mynewvec <- ifelse(myvec > 2, 1, 0)    # can store the new vector
mynewvec




##### nesting and stacking if and else statements
#####################################################

# Example 11
x <- 5
y <- 3

if (x > y) {   # notice the formatting used
  x <- 1
  
  if (x <= 4) {
    z <- 50
  } else {
    z <- 0
  }
}

c(x, y, z)



# Example 12
x <- 5
y <- 3

if (x > 2*y) {
  x <- 1
  
  if (y >= 4) {
    z <- 50
  } else {
    z <- 0
  }
} else {
  z <- 25
}

c(x, y, z)




### if, else if, and else statements
###########################################

# else if allows for more than 2 options to be specified (i.e., more than just 
#  if and else)

# Example 13
x <- 1
y <- 2

if (x < 4 & y > 3) {
  z <- 1
} else if (x >= 4 & y <= 3) {
  z <- 2
} else {
  z <- 3
}

z



# Example 14
if (x < 4 & y > 3) {
  z <- 1
} else if (x <= 4 & y <= 3) {
  z <- 2
} else {
  z <- 3
}

z



### can use else if statements multiple times

# Example 15
x <- 5
y <- 10
z <- 8

if (x < y & y < z) {
  w <- 1
} else if (x < y & y > z) {
  w <- 2
} else if (x > y & y < z) {
  w <- 3
} else {
  w <- 4
}

w




##### the switch() function
#######################################
# switch() can save you from typing a series of if, else if, and else statements 
#  involving '==' if the code is run based on the value of a single object

# Example 16
person <- "Andrew"

if (person == "Joe"){
  t <- 1
} else if (person == "Chris") {
  t <- 2
} else if (person == "Trish") {
  t <- 3
} else {
  t <- 4
}

t    # works, but we can shorten the code


t <- switch(person, Joe = 1, Chris = 2, Trish = 3, 4)
t    # same as above, but much shorter and more efficient


person <- "Chris"
t <- switch(person, Joe = 1, Chris = 2, Trish = 3, 4)
t



