
################################################################################
########################## Creating Vectors using c() ##########################
################################################################################

# one way to create a vector: use the combine function, c()
height <- c(73, 62, 60, 68)
height


your_height <- 65
# can combine vectors and scalars (i.e., single numbers)
height2 <- c(height, your_height)
height2


# order matters
height3 <- c(your_height, height)
height3


# printing shortcut works for vectors
(height4 <- c(your_height, height))


# can combine vectors
height5 <- c(76, 70, 59)
height5

height4

height6 <- c(height4, height5)
height6




################################################################################
################# Sequences, Repetition, Sorting, and Lengths ##################
################################################################################

##### sequences
###################################################

# create sequence w/ increments of 1 using a colon
1:10


# descending order works
10:1


# can use negative numbers
-3:5


# the numbers don't have to be integers, but increments of 1 still used
1.5:6.5
1.5:6.8    # careful


# can store like any vector
x <- 1:20
x




# use seq() to create sequences w/ increments other than 1 (but still 
#  evenly spaced)
seq(from = 1, to = 15, by = 2)


# use ?[function name] to view help documentation
# helpful for things such as the possible inputs to a function
?seq


seq(from = 1, to = 27, length.out = 10)


# descending order works again
seq(from = 15, to = 1, by = 2)  # careful w/ positives vs. negatives
seq(from = 15, to = 1, by = -2)





##### repetition
###################################################

# use rep() to repeat a single value or an entire vector of values
rep(1, times = 5)


ones <- rep(1, times = 1e3)
ones



# repeat an entire vector
rep(c(2, 3, 5), times = 3)
rep(c(2, 3, 5), 3)      # reminder: look at help documentation for inputs


rep(c(2, 3, 4), each = 3)
rep(c(2, 3, 4), times = 2, each = 3)


# can combine c(), rep(), and seq() results
c(1, rep(2, times = 3))

c(1, rep(2, times = 3), seq(from = 4, to = 10, by = 0.5))


# can use previously-stored value
z <- 5
rep(z, times = 3)


z1 <- c(10, 8, 15)
rep(z1, times = 6)




##### sorting
###################################################

# use sort() to sort a vector
# note: TRUE and FALSE are logical values
age <- c(20, 25, 36, 29)
age

sort(age)                      # default is increasing order

sort(age, decreasing = FALSE)    # same (again, default is increasing order)
sort(age, decreasing = TRUE)     # can change to decreasing order


# another example of sorting
age2 <- c(50, 66, 23, 57, 49)
c(age, age2)
sort(c(age, age2))      # function within a function; inner one evaluated first




##### lengths
###################################################

# find the length of (i.e., the number of elements in) a vector
age2
length(age2)

length(1:10)

length(18:1005)


# a combo of sequence and length will be useful later on in the course
1:length(age2)




################################################################################
###################### Subsetting and Element Extraction #######################
################################################################################

##### subsetting
##############################################

# use [] to subset vectors based on index (think: location)
temp <- c(99, 1.2, 37, 52.6, 108)
temp

temp[0]
temp[1]
temp[3]
temp[6]  # no 6th element in myvec



# can use assignment w/ vectors
temp_sunday <- temp[3]
temp_sunday


# function within a function -- inner evaluated 1st
temp[length(temp)]    # same as next line
temp[5]


# can subset using vectors of indices
temp
temp[1:2]
temp[c(1, 3)]


# delete/remove elements using [] with negative indices
temp[-1]
temp     # careful -- nothing actually got deleted/removed


# 1st element deleted and new vector stored
temp2 <- temp[-1]  
temp2


# can delete multiple values
temp[-1:2]    # error - careful w/ parentheses
temp[-(1:2)]

temp
temp[-c(1, 3)]


# can overwrite elements
temp
temp[1] <- 8
temp


# can overwrite multiple elements
temp[c(3, 1)] <- c(36, 55.8)
temp


# can replace multiple elements w/ single value
temp[1:2] <- 10
temp




################################################################################
########################### Vector-oriented Behavior ###########################
################################################################################

part1_score <- c(45, 49, 33, 50, 40, 39)
part2_score <- c(42, 47, 36, 26, 0, 46)


# operations are performed element-wise
part1_score + part2_score    # total exam score
part1_score - part2_score
part1_score * part2_score    # silly here
part1_score / part2_score    # Inf = infinity and -Inf = -Infinity


# R recycles values
zero_one <- c(0, 1)
zero_one


part1_score - zero_one    # works b/c length(myvec11) divides nicely into length(myvec11)


new_score <- c(30, 45, 49)

new_score - zero_one    # errors bc length(zero_one) doesn't divide 
                        # nicely into length(new_score)


part1_score
part1_score + 2    # recall: scalar = vector of length 1, which is recycled here



# can overwrite multiple elements w/ recycling, but can be dangerous!
part1_score
part1_score[1:4] <- c(20, 25)
part1_score



### some useful functions -- much easier than iterating through a vector one
###  element at a time
########################################################################

### the sum(), prod(), and mean() functions
part1_score
sum(part1_score)
prod(part1_score)
mean(part1_score)



