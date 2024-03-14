
################################################################################
############################# Writing Functions ################################
################################################################################

# functions allow you to reuse a chunk of code w/o having to copy and paste it 
#   over and over
# use the function() command to define a function

# Example 1 -- function basics: storing, arguments, and the function body
my_fxn <- function(arg) {
  # this is the function (fxn) body -- run this code whenever the fxn is called
  arg + 2
}  # notice how my_fxn() is now in the global env

my_fxn(arg = 6)
my_fxn(6)        # no surprise



# Example 2 -- basic example; note: use descriptive fxn name
add_2 <- function(x) {
  x + 2
}

add_2(1)
add_2(2)
add_2(500)

add_2(x = 500)
add_2(y = 500)    # no y input AND no y in global env.



# Example 3 -- shorter fxns can go on one line w/o { }, but doesn't come up 
#  that often
add_3 <- function(x) x + 3

add_3(20)



# Example 4 -- your fxn doesn't always need arguments (but usually it does)
x <- 5

my_fxn2 <- function() {
  x + 2
}  

my_fxn2()     # x from global env used
my_fxn2(x)    # can't supply an argument b/c the fxn doesn't have any
my_fxn2(6)    # can't supply an argument b/c the fxn doesn't have any



my_fxn3 <- function(x) {
  x + 2
}

my_fxn3(x)  # the fxn wants an arg, but nothing is input, so R looks in the 
            #   global env and uses the x there
            # R reads this as: my_fxn3(x = x)

my_fxn3(y)  # no value input, so R looks in global env., but no y there



# Example 5 -- functions can have multiple arguments
sum_plus_3 <- function(arg1, arg2) {
  arg1 + arg2 + 3
}

sum_plus_3(arg1 = 5, arg2 = 2)

sum_plus_3(arg1, arg2 = 2)  # no input to arg1

arg1 <- 6
sum_plus_3(arg1, arg2 = 2)  # arg1 from global env used b/c arg1 = arg1



# Example 6 -- another example w/ multiple arguments, which are defaulted now
sum_plus_3_new <- function(arg1 = 10, arg2 = 4) {
  arg1 + arg2 + 3
}

sum_plus_3_new()          # the fxn uses the 2 default arguments
sum_plus_3_new(arg2 = 2)  # the fxn uses default for arg1 and value input for arg2



# Example 7 -- if want a function to print something, need to tell R to print it
add_4 <- function(x) {
  x + 4
}

add_4(x = 8)



add_4 <- function(x) {
  z <- x + 4
}

add_4(x = 8)    # nothing printed; all the function does is add 4 and store



add_4 <- function(x) {
  z <- x + 4
  z
}  # the LAST line run is what will be printed (if not storing on that line)

add_4(x = 8)  # now the result is printed



# Example 8 -- recall: the LAST line run is what will be printed
weird_fxn <- function(x) {
  y <- x + 2
  y
  
  z <- y + 3
  z
}

weird_fxn(x = 1)  # notice what is printed and what isn't printed



# Example 9 -- calculate and print multiple values -- here, the mean, median, 
#  and sd of a vector of values
find_summaries <- function(x) {
  mean(x)
  median(x)
  sd(x)
}

find_summaries(x = c(20, 22, 21, 18, 19))    # prints only the sd



find_summaries2 <- function(x) {
  mean <- mean(x)
  median <- median(x)
  sd <- sd(x)
  
  mean
}

find_summaries2(x = c(20, 22, 21, 18, 19))    # prints only the mean



# all summaries can be printed in a single vector (here a NAMED vector)
find_summaries3 <- function(x) {
  c(Mean = mean(x), Median = median(x), SD = sd(x))
}

find_summaries3(x = c(20, 22, 21, 18, 19))




### lazy evaluation
#################################
# arguments are accessed and used ONLY when they appear in the fxn body

# Example 10 -- lazy evaluation (note: focus on z)
x <- 0
y <- 1
z <- 2

my_fxn2 <- function(x, y, z) {
  if (x + y < 5) {
    1
  } else {
    z + 10
  }
}

my_fxn2()      # arguments x, y, z different than objects x, y, z in global env

my_fxn2(x = 2, y = 2)  # example of lazy evaluation -- this runs b/c z never needed!

my_fxn2(x = 2, y = 3)  # R wants to use z, but no value supplied and no default value

my_fxn2(2, 3, 4)

my_fxn2(x, y, z)  # R reads this as: my_fxn2(x = x, y = y, z = z)




### setting argument defaults
#####################################
# very useful for some arguments, but not always necessary

# Example 11 -- plot() requires an input for x at the very least
plot()



# Example 12 -- seq() has defaults
seq(from = 2, to = 10)
?seq    # notice default used when generating previous sequence



# Example 13 -- setting defaults for your functions
my_fxn3 <- function(x = 1, y = 2, z = 3) {
  if (x + y < 5) {
    1
  } else {
    z + 10
  }
}

my_fxn3()          # defaults used
my_fxn3(x = 2, y = 2)
my_fxn3(2, 3)      # works now (while it didn't earlier) b/c z has a default
my_fxn3(2, 3, 4)



# Example 14 -- defaults can be in terms of other arguments
my_fxn4 <- function(x = 1, y = x + 2) {
  x + y
}

my_fxn4()       # defaults used
my_fxn4(x = 3)      # x = 3 now -> y = 5
my_fxn4(y = 6)  # x = 1 and y = 6
my_fxn4(x)      # x from global env (0) used -- R reads this as: 
                #  my_fxn8(x = x, y = x + 2) 
my_fxn4(x, y)   # x and y from global env (0 and 1) used -- R reads this as: 
                #  my_fxn8(x = x, y = y)




### dealing with ellipses
######################################
# you can pass in extra arguments to the fxn w/o having to define them in the 
#  argument list
# ellipses are typically (but not always) placed in the last argument position

# Example 15 -- if you allow ... as a fxn argument, then you should have ... in 
#  the fxn body as well
plot_x_transformed <- function(x, y, ...) {
  if (any(x > 2)) {
    x <- 5*x
  } else {
    x <- 2*x
  }
  
  plot(x, y)
}

# the code below kind of works - the fxn doesn't know where to use main, but 
#  there isn't an error
plot_x_transformed(1:5, 1:5, main = "My Plot")



# R now knows where to pass any extra ... args that plot() accepts
plot_x_transformed2 <- function(x, y, ...) {
  if(any(x > 2)) {
    x <- 5*x
  } else {
    x <- 2*x
  }
  
  plot(x, y, ...)    # ... added here
}

plot_x_transformed2(1:5, 1:5, main = "My Plot")
plot_x_transformed2(1:15, 11:25, main = "My Other Plot")



