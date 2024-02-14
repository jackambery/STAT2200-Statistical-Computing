
################################################################################
##################### Special Values, Classes, and Coercion ####################
################################################################################

##### special values
##############################

# special values: Inf, -Inf, NaN, NA, and NULL


### Inf = infinity
##############################
Inf
inf    # case-sensitive!

1e500
27/0    # any nonzero value divided by 0 gives infinity or -infinity
-27/0


5*Inf    # Inf is a numeric "value," so can still perform operations
Inf + Inf
10/Inf


# can store Inf (might happen to you when performing calculations)
x <- Inf
x
c(3, Inf, 218)


# -Inf = negative infinity
-1e500
10/-Inf


-Inf < Inf    # relational operators work w/ Inf and -Inf
5 < Inf
5 > Inf




### NaN = Not a Number
##############################
# typically seen when attempting calculations that are impossible

0/0
Inf/Inf
Inf - Inf
NaN + 1    # NaN is a numeric "value"



### NA = Not Available
##############################
# used to represent missing values

# NAs can occur for any type of value, not just numerics
x1 <- c(1, 3, 8, NA, 4)
x1
x1[4]


x2 <- factor(c("M", "F", NA, "M", "M", "M", "F", NA))
x2    # NA is in the factor vector, but it doesn't get its own level -- good!
x2[3]


# use is.na() to determine if element(s) are NAs or not
x2
is.na(x2)


# determine which elements are NAs (by index)
x2
which(is.na(x2))


x3 <- c(20, 25, 19, 18, 23, NA, 22)
mean(x3)    # doesn't work (as we would expect)


# find mean of non-NA terms
x4 <- na.omit(x3)    # get rid of NA terms (one way)
x4
mean(x4)


# if performing simple operations, some functions have arguments that
#  allow you to ignore NAs
x3
mean(x3)
mean(x3, na.rm = TRUE)    # more common way of ignoring NAs


# arithmetic operations involving NA result in NA
NA + 4

x3
2*x3 + 50


# comparisons involving NA result in NA
NA > 0
NA > NaN




### NULL
##############################
# used to define an empty entity -- different from NA!

x5 <- NULL
x5    # nothing there

x6 <- NA
x6    # vector of length 1


c(3, 10, NULL, 5)    # nothing in NULL spot
c(3, 10, NA, 5)      # NA in NA spot


# nature of operation determines type of result
NULL + 3
NULL > 0


str(mtcars)
mtcars$mpg
mtcars$size    # no size variable in mtcars --> NULL


# NULL is used to check whether or not objects have been defined
# -- often occurs when calling functions (especially w/ optional arguments)
# -- will come up soon
?paste    # NULL is default for the collapse argument




##### object classes
##############################
# every object has at least one class

# look at each of the objects below in the environment pane
int_vec <- 1:4
num_vec <- seq(1, 4, length.out = 8)
char_vec <- c("a", "b", "c", "d")
logic_vec <- c(T, F, F, F)
fac_vec <- factor(c(0, 1, 1, 1, 0, 1))


# class() prints the object's class
# for vectors, it prints the type of data in the vector
class(int_vec)

num_vec
class(num_vec)      # numerics: think numbers w/ decimals
class(char_vec)
class(logic_vec)
class(fac_vec)


# class() sometimes prints the kind of data structure, not the type of data 
# in it -- true for data frames
my_df <- data.frame(
  x = 1:5,
  y = 6:10
)
class(my_df)


### multiple classes
fac_vec_ordered <- factor(c("S", "M", "L", "S", "L"), levels = c("S", "M", "L"),
  ordered = TRUE
)
fac_vec_ordered
class(fac_vec_ordered)    # has 2 classes




### is-dot object-checking functions
##########################################
# used to check whether an object is a specific class or data type
# -- always get either TRUE or FALSE

### is.integer(), is.numeric(), is.character(), and is.logical() check the 
###  kind of data stored in an object
int_vec
is.integer(int_vec)
is.numeric(int_vec)    # integer is numeric, but numeric isn't integer

num_vec
is.numeric(num_vec)
is.integer(num_vec)

char_vec
is.numeric(char_vec)
is.character(char_vec)

logic_vec
is.logical(logic_vec)


### is.vector() and is.data.frame() check the structure of an object
num_vec
is.vector(num_vec)
is.data.frame(num_vec)


my_df
is.vector(my_df)
is.data.frame(my_df)




##### coercion
###################################
# coercion = converting from either one object to another or one data type 
#  to another
# coercion can be implicit or explicit

# 6 data types: character, numeric, integer, logical, complex, and raw
# order/hierarchy: character > numeric (double) > integer > logical
# (we'll skip raw and complex)

### implicit coercion
##############################
2 + TRUE    # TRUE 1st converted to 1, then sum is computed


# a vector must contain the same type of data
a <- c(5, TRUE, FALSE)    # numeric vector
a



c <- c(2.5, 4)    # numeric vector
c

d <- c(2, "chris")    # character vector
d


3 + "a"    # still not allowed -- no surprise

a

paste("my favorite number is", a[1])    # character vector




### explicit coercion - using as-dot functions
##################################################

# as.numeric() and as.character() change the data type
a <- c("2.5", "3", "10")
a

5 + a

a2 <- as.numeric(a)
a2

5 + a2


(a3 <- as.character(a2))



# be careful coercing factors
d <- factor(c("S", "M", "L", "L", "S"))
d
as.numeric(d)    # levels ordered alphabetically and changed to 1,2,...


e <- factor(c(2, 4, 3, 3, 2))
e
as.numeric(e)    # levels ordered in increasing order and changed to 1,2,...



# as.vector(), as.factor(), and as.data.frame() change the structure 
#  of an object

char_vec <- c("a", "b", "c")
char_vec
as.factor(char_vec)

# or just use factor()
factor(char_vec)



