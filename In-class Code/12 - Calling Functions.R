
################################################################################
############################## Calling Functions ###############################
################################################################################

##### environments
###############################

# environments = separate compartments where data structures and functions
#                are saved
#
# 3 types: (1) the global environment, (2) package environments, and
#          (3) local environments


### (1) the global environment
####################################

# global environment -> where user-defined objects are saved

# ls() lists the names of everything in the current global environment
ls()    # nothing in it at the moment; can see this in upper right pane!

a <- 5
b <- rep(0, 6)

ls()    # objects named a and b are in the global environment now




### (2) package environments
####################################

# package environments -> where ready-to-use functions and objects are saved, 
#  as well as those from any loaded packages


# ls("package:[package name]") lists the names of items in a specific package
#  environment

ls("package:graphics")   # the graphics package comes w/ base R
ls("package:datasets")   # the datasets package also comes w/ base R


# to install the dplyr package, run: install.packages("dplyr")
ls("package:dplyr")    # note: we haven't loaded dplyr yet

library(dplyr)         # loads the dplyr package
ls("package:dplyr")




### (3) local environments
####################################

# local env's -> each time a function is called, a new local environment is
#  created that contains all objects and variables created in and visible to 
#  *that* function, including any arguments you've supplied to the function 
#  upon execution -- this is why you can have argument names that are the 
#  same as object names in a workspace

x <- 5
y <- 11

add_2 <- function(x) {
  y <- x + 2
  y
}

add_2()     # can't find x

add_2(x = x)    # x = 5 -- R first looks in local env., but doesn't find a value 
            #  for x, so it then looks in the global env.

add_2(x = 10)    # x = 10 inside the function (in a local env), even though 
                 #  x = 5 outside the function (in the global env)

add_2(10)    # same as previous line

add_2(x = y)     # R first looks in local env., but doesn't find y, so then it looks 
             #  in the global env. and uses that y value

add_2(x = z)     # no z in local or global env.




### reserved and protected names
#########################################

# reserved names: if, else, for, while, in, function, repeat, break, next, TRUE, 
#                 FALSE, Inf, -Inf, NA, NaN, NULL

# error if try to assign a value to any of these reserved names
NA <- 5
nA <- 5  # works b/c R is case-sensitive, but don't do this -- it's confusing


TRUE <- 5    # error
T <- 5       # works -- careful!
sort(1:5, decreasing = T)        # error: T not the same as TRUE here
sort(1:5, decreasing = TRUE)




### ways to remove objects from the global env.
####################################################

# method 1: click the broom icon in the global environment pane in RStudio
# method 2: run rm(list = ls())

rm(list = ls())
ls()    # everything in the global environment is gone

ls("package:dplyr")    # package environments are unaffected by rm(list = ls())




##### argument matching
###################################

# argument matching -> how you can provide arguments to functions
# 4 styles of argument matching: (1) exact, (2) partial, (3) positional, and 
#                                (4) mixed

### (1) exact matching
###########################

# exact -> type full argument names

?seq  # look at the help documentation to examine seq() arguments

my_seq <- seq(from = 10, to = 90, by = 2)
my_seq


# argument order doesn't matter since argument names specified
# note: this is an extreme example; usually you (somewhat) preserve order
my_seq2 <- seq(by = 2, to = 90, from = 10)
my_seq2



### (2) partial matching
###########################

# partial -> you type abbreviated argument names
# there's really no need to use this!

my_seq3 <- seq(fr = 10, t = 90, b = 2)
my_seq3

my_seq4 <- seq(t = 90, fr = 10, b = 2)
my_seq4    # argument order still doesn't matter



?matrix

my_mat <- matrix(data = 1:12, nrow = 4)
my_mat

my_mat2 <- matrix(data = 1:12, n = 4)    # error b/c 2 arguments start with "n": 
                                         #  nrow and ncol



### (3) positional matching
##############################

# positional -> you don't type any argument names, but the order matters

?seq

my_seq4 <- seq(10, 90, 2)
my_seq4

my_seq5 <- seq(90, 10, 2)    # would need 2 to be -2 to not error, but still 
                             #  different from my_seq6


plot(1:5, 6:10)
plot(6:10, 1:5)



### (4) mixed matching
###############################

# mixed -> combo of exact, partial, and positional
# very common and we already do this a fair amount!

?rep

my_vec <- rep(5, times = 20)
my_vec



?plot

plot(1:5, 6:10, type = "l", col = "red")

plot(type = "l", col = "red", 1:5, 6:10)    # please do not do this




##### dot-dot-dot: use of ellipses: ...
############################################
# 2 uses: (1) ellipses sometimes represent the main part of a function call, and
#         (2) ellipses allow for supplemental optional arguments to a function

# (2) is common when the function of interest calls other functions within it; 
#  the arguments of the other functions are passed into the functions of 
#   interest


# example of (1)
# the data are placed where the ... is; recall there is no set number of 
#                                       variables to specify
?data.frame

my_df <- data.frame(
  person = c("Jill", "Dan"),
  school = c("Fairfield", "Quinnipiac")
)
my_df



# example of (2)
# x and y are required arguments in plot(), but there are many additional 
#  optional arguments that can be supplied that come from other functions --
#  for ex., from plot.default()
?plot

plot(1:5, 6:10)
plot(1:5, 6:10, type = "l")
plot(1:5, 6:10, col = "red")
plot(1:5, 6:10, type = "l", col = "red")



