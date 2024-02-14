
################################################################################
################################### Strings ####################################
################################################################################

##### creating strings and string basics
##########################################

# use quotes to create a string: either " " or ' '

# using double quotes
"hello world"


# R is looking for a variable named 'helloworld'
helloworld


# can store strings
(x <- "hello world")


# single quotes work too
'hello world'   # still printed w/ double quotes


# a string is a single entity
length(x)


# use nchar() to count the number of characters in a string
nchar(x)


# a number can be a string
x2 <- "2.5"
x2


# careful -- it's no longer a number!
x2 + 1


# can use most symbols in strings, but be careful with "\" - see below
x3 <- "&hello !wor@ld$_"
x3



##### concatenating (gluing together) strings
#####################################################

# 2 functions: cat() and paste()
# note: c() doesn't concatenate strings
x4 <- c("hello", "world")    # check environment pane
x4

length(x4)  # not a single string


# cat() prints directly to the console
cat("hello", "world")

x5 <- cat("hello", "world")
x5    # cat() technically doesn't return anything


# paste() prints to the console AND allows for storing
paste("hello", "world")    # notice the [1]... it's a vector

x5 <- paste("hello", "world")
x5


paste(c("hello", "world"))  # different than above and likely not what we want

paste(x5, "!!")  # note the space before "!!" which we probably don't want


# order matters
cat("world", "hello")
paste("world", "hello")


# can add a separator between strings
cat("hello", "world")
cat("hello", "world", sep = "--")
paste("hello", "world", sep = "-")


# can get rid of all spacing between strings
paste("hello", "world")
paste("hello", "world", sep = " ")    # note: single space between quotes
paste("hello", "world", sep = "")     # note: no space between quotes


# paste0() doesn't include spaces between separate strings
# when combining them
paste0("hello", "world", "!!")


# paste0() allows for appropriate spacing AND shows no need to 
#  separate every word
paste0("hello world", "!!")

paste(x5, "!!", sep = "")



# R coerces non-character strings into character strings
paste("planet", 1)   # don't need quotes around the "1"
paste("planet", 1+2)

a <- 1
b <- 2
c <- 3
paste("The sum of", a, "and", b, "is", c, ".")  # good, but period off


# problem solved w/ extra spacing in individual strings and sep = ""
paste("The sum of ", a, " and ", b, " is ", c, ".", sep = "")

# another way
paste0("The sum of ", a, " and ", b, " is ", c, ".")



##### escape sequences
######################################
# used w/ cat(), not paste()
# a backslash is the special character used to identify an escape sequence

# \n starts a new line
cat("hello\nworld")
cat("hello \n world")  # spacing matters


# \t = horizontal tab
cat("hello\tworld")


# \\ = single backslash
cat("hello world\\friends")  # usually would want a forward slash here; 
                             # just an example

# \" = double quote
cat("hello \"world\" ")



