
################################################################################
############################## Basic Arithmetic ################################
################################################################################

# use the pound symbol to write a comment; anything after it (on the same line) 
#  is printed but not evaluated by R

2 + 1    # 2 + 1 is evaluated by R, but nothing after the # is evaluated


2 + 1    # use + for addition
2 - 1    # use - for subtraction
7 * 4    # use * for multiplication
7 / 4    # use / for division


# spaces aren't necessary
1+2
8/4


# order of operations -- PEMDAS applies
15/3 + 2
15 / (3 + 2)


# use ^ for exponents
10^2
10^2 + 3


# use the sqrt() function to take the square root of a number
sqrt(9)

# R is case-sensitive!
Sqrt(9)


16^(1/2) # another option for square root
16^0.5   # another option for square root




################################################################################
######################### Logarithms and Exponentials ##########################
################################################################################

# log defaults to ln
log(10)    # ln(10)

# can change the base of the log function
log(64, base = 2)
log(100, base = 10)


# exponential function: e^x
e^3       # doesn't work, because you haven't stored anything named "e"
exp(3)    # good -- same as e^3




################################################################################
############################# Scientific Notation ##############################
################################################################################

# not all digits are printed, but more are stored
12345678901234

12345678901234 - 12345678901231


# use "e" for 10^
1e2
2e3
2.5e4
2e-3



