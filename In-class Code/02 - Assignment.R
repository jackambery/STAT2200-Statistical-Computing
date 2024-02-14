
################################################################################
######################## Assigning Objects: The Basics #########################
################################################################################

### use <- to assign an object
#####################################

# 10 is now assigned to "a"
a <- 10

# print "a"
a


b <- 8
a + b      # R has values stored in "a" and "b"


a + b + c  # R doesn't have anything stored in "c"


# you can access other values and store in the same line
c <- a + b
c


# you can store and print at the same time!
(c <- a + b)


# you can overwrite variables, but be careful!
c <- c + 2
c


# some people use = instead of <- when assigning, which is ok
# however, = and <- are NOT always interchangeable!
d = 30
d




################################################################################
############################## Naming Variables ################################
################################################################################

# try to use a descriptive yet relatively short name
myvar <- 72
myvar      # what does this even mean?


myheight <- 72
myheight   # more helpful


# longer variable names are ok, but when there are multiple words, people
#  like to distinguish them somehow -- using, for ex., an uppercase letter, a
#  period, or an underscore

# R is case-sensitive!
myHeight <- 72


# periods and underscores are ok, but not as the first character
my.height <- 72
my_height <- 72


# you can't start a name w/ a number or symbol
_my_height <- 72   # error
&my_height <- 72   # error
2myheight <- 72



