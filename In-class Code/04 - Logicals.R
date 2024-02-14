
################################################################################
################################### Logicals ###################################
################################################################################

### logicals: can be either TRUE or FALSE 
###################################################

# often used for 1 of 2 purposes:
# 1) signal whether a condition has been satisfied
# 2) signal whether a parameter should be switched on or off


# we saw TRUE and FALSE used in the sort() function
sort(c(1, 6, 4, 2, 5), decreasing = TRUE)
sort(c(1, 6, 4, 2, 5), decreasing = FALSE)


# TRUE = T, FALSE = F, but safest to type them both out fully
FALSE
TRUE
F
T


# all letters must be capitalized
False
True
f


# can have vector of logicals
logicals <- c(TRUE, FALSE, TRUE, FALSE, FALSE)
logicals


# can use logicals to check relationships between numeric values
# new operators: >, <, >=, <=, ==, !=
1 < 2
1 > 2
5 > 5
5 >= 5
1 == 1
1 == 2
1 = 2     # need double equal sign when checking relationships
1 != 2    # != means 'not equal to'
1 != 1



# can look at relationships between vectors element-wise
vec1 <- c(2, 5, 3, 4, 1)
vec2 <- c(8, 4, 2, 5, 1)
vec1
vec2

vec1 > vec2
vec1 < vec2
vec1 >= vec2
vec1 <= vec2
vec1 == vec2
vec1 != vec2


# R recycles (when able) when making comparisons
vec3 <- 1:2
vec4 <- 1:4
vec3
vec4

vec3 < vec4    # really, 1 2 1 2 < 1 2 3 4 when recycling


# can compare vector to numeric value
vec1
vec1 > 2    # think: recycling


# any() returns TRUE if *any* logicals in vector are TRUE
vec1
any(vec1 > 3)


# all() returns TRUE only if *all* logicals in vector are TRUE
vec1
all(vec1 > 3)


# another example
vec3 <- rep(10, 5)
vec3

vec2

all(vec2 < vec3)



# logicals can be used to examine whether multiple conditions satisfied
# new operators: & and |

# & only returns TRUE if both logicals are true
TRUE & TRUE
TRUE & FALSE
FALSE & FALSE


# | returns TRUE if at least one logical is true
TRUE | TRUE
TRUE | FALSE
FALSE | FALSE



# order of importance for logical operations in R:
# AND statements have higher precedence over OR statements
# so use parentheses when necessary!
FALSE | ((T & TRUE) | FALSE)
(T & (TRUE | F)) & FALSE
(6 < 4) | (3 != 1)



# can do element-wise comparisons using & and |
vec4 <- c(TRUE, TRUE, TRUE, FALSE, FALSE)
vec5 <- c(FALSE, FALSE, TRUE, TRUE, FALSE)
vec4
vec5

vec4 & vec5
vec4 | vec5



# goal: identify whether elements of vec7 are >= 3 or = 6
vec7 <- c(8, 2, 1, 5, 5, 7, 4)
vec7

(vec7 >= 3) | (vec7 == 6)



# logicals are numbers: TRUE = 1, FALSE = 0
TRUE + TRUE
TRUE + FALSE
5 + TRUE



# can use logicals to subset or extract -- helpful in the future
vec7
vec7[c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE)]



# below VERY useful w/ large datasets since don't need to know indices
# we'll work w/ something similar when we get to data frames
vec7[vec7 > 5]    # extract all elements > 5



# can use logicals to overwrite elements
vec7
vec7[vec7 == 5] <- 10
vec7


# use which() to determine indices of elements flagged TRUE
vec7
which(vec7 > 5)



