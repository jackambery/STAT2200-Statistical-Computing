
################################################################################
#################################### Loops #####################################
################################################################################

# loops allow you to repeat chunks of code
# 2 main types of loops in R: for loops and while loops


##### for loops
#############################
# repeat code as an index or counter is incremented

# Example 1 - print current index
for (i in 1:10) {
  print(i)    # need print() if want to print values in a loop
}



# Example 2 - add 2 to every value in a vector (long way)
x <- c(89, 92, 100, 75, 82)
y <- vector()      # creates an empty vector w/ unspecified length

for (i in 1:5) {
  y[i] <- x[i] + 2
  print(y[i])     # I'm printing just to demonstrate the process
}

y



# Example 3 - double every value in a vector (long way)
x2 <- 3:12
doubled_vals <- vector()

# better to use length(x2) instead of a number directly in case change contents 
#  of x2 later
for (i in 1:length(x2)) {
  doubled_vals[i] <- 2*x2[i]
}

doubled_vals



# Example 4 - create a sequence of numbers increasing in increments of 10
x3 <- vector()

for (i in 1:30) {
  x3[i+1] <- x3[i] + 10
}

x3    # careful - what's x3[1]?



x3 <- vector()
x3[1] <- 75    # need to set an initial value for code to run properly

for (i in 1:30) {
  x3[i+1] <- x3[i] + 10
}

x3




# %% gives the remainder when dividing the number before %% by the number 
#  after it; useful for determining if a number is even or odd

# Example 5 - count number of even values in a vector
x4 <- 1:27
even_counter <- 0

for (i in 1:length(x4)) {
  if (x4[i] %% 2 == 0) even_counter <- even_counter + 1
}                                             

even_counter



# Example 6 - find cumulative sums, one at a time
x5 <- 1:20
cum_sum <- vector()
cum_sum <- x5[1]   # we'll find cumulative sums here

for (i in 1:length(x5)) {
  cum_sum[i] <- x5[i] + cum_sum[i-1]
}

cum_sum    # doesn't work -- why?


# let's fix the issue
x5 <- 1:20
cum_sum <- vector()
cum_sum[1] <- x5[1]   # need this initial value!!

for (i in 1:length(x5)) {
  cum_sum[i+1] <- x5[i+1] + cum_sum[i]
}

cum_sum    # annoying NA at the end -- why is it there?



# no NA now
x5 <- 1:20
cum_sum <- vector()
cum_sum[1] <- x5[1]

for (i in 1:(length(x5)-1)) {    # look at the end of the sequence
  cum_sum[i+1] <- x5[i+1] + cum_sum[i]
}

cum_sum




# another way of doing it -- don't always need to start the index at 1
x5 <- 1:20
cum_sum <- vector()
cum_sum[1] <- x5[1]

for (i in 2:length(x5)) {    # look at the start of the sequence
  cum_sum[i] <- x5[i] + cum_sum[i-1]
}

cum_sum




### nesting for loops
######################################
# inner loop fully executed before outer loop incremented
# then inner loop executed again, outer loop incremented, etc.

# matrix = another type of data structure in R
# use matrix() to create a matrix; nrow = # of rows; ncol = # of columns


# Example 8 - add row and column indices for each cell
A <- matrix(0, nrow = 4, ncol = 5)
A

for (j in 1:ncol(A)) {
  for (i in 1:nrow(A)) {
    A[i, j] <- i + j    # i is index for rows and j for columns
  }
}

A



# Example 9 - what do you think will happen here?
for (j in 1:ncol(A)) {
  for (i in 1:nrow(A)) {
    if (A[i, j] %% 2 == 0) A[i,j] <- 25
  }
}

A



# Example 10 - store '+' if number positive and '-' if number negative
mydf <- data.frame(
  x = c(-1, -5, 0, -2, 3, 4, -6, 1),
  y = c(1, 2, 2, -1, 0, -2, 2, 1)
)

mydf


mydf2 <- data.frame()

for (j in 1:ncol(mydf)) {
  for (i in 1:nrow(mydf)) {
    if (mydf[i, j] > 0) {
      mydf2[i, j] <- "+"
    } else if (mydf[i, j] < 0) {
      mydf2[i, j] <- "-"
    }
  }
}

mydf2    # how about the NAs?


# what's the difference between this loop and the previous one?
mydf3 <- data.frame()

for (j in 1:ncol(mydf)) {
  for (i in 1:nrow(mydf)) {
    if (mydf[i, j] > 0) {
      mydf3[i, j] <- "+"
    } else if (mydf[i, j] < 0) {
      mydf3[i, j] <- "-"
    } else {
      mydf3[i, j] <- 0
    }
  }
}

mydf3




##### while loops
#############################
# repeat code while specified condition(s) satisfied
# stop running code once condition(s) no longer satisfied

# Example 11 - keep a counter running while the counter is under 15
# notice what's stored in the counter after complete the loop
counter <- 0

while (counter < 15) {
  print(counter)            # I'm printing just to illustrate what's happening
  counter <- counter + 1
}

counter



# Example 12
# count number of failures (0's) until first success (1)
succ_fail <- c(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1)
counter <- 1

while (succ_fail[counter] == 0) {    # need index since myvec is a vector
  counter <- counter + 1
}

counter    # NOT CORRECT -- 8 successes before first success, not 9


# count number of failures (0's) until first success (1)
succ_fail
counter <- 0

while (succ_fail[counter + 1] == 0) {
  counter <- counter + 1
}

counter    # correct this time




##### blackjack examples!! #####

# you need to set a seed when generating random numbers if you want your 
#  results to be reproducible - by either you or other people
set.seed(1)  # doesn't need to be 1

# 8 decks of cards, each w/ 52 cards = 4 suits x 13 cards of each suit
decks <- 8


# 2-6 = +1, 7-9 = 0, and 10-K and Ace = -1
hi_lo_values <- c(rep(1, 5*4*decks), rep(0, 3*4*decks), rep(-1, 5*4*decks))
hi_lo_values   # note: 416 cards w/ 8 decks

# use sample() to randomly sample values from a vector -- 
# here we are "shuffling" the decks
hi_lo_random <- sample(hi_lo_values, replace = FALSE)
hi_lo_random


# increase bet when count = 3
card_counter <- 0
hi_lo_count <- 0

while (hi_lo_count < 3) {
  hi_lo_count <- hi_lo_count + hi_lo_random[card_counter + 1]
  print(hi_lo_count)
  card_counter <- card_counter + 1
}

paste("Start betting larger on card:", card_counter)



# increase bet when count = 6
card_counter <- 0
hi_lo_count <- 0

hi_lo_random

while (hi_lo_count < 6) {
  hi_lo_count <- hi_lo_count + hi_lo_random[card_counter + 1]
  print(hi_lo_count)
  card_counter <- card_counter + 1
}    # the count never reaches 6 before the dealer shuffles here

paste("Start betting larger on card:", card_counter)  # CAREFUL -- let's discuss




# don't want to keep retyping all this code if we just want to change one 
#  number; note: we will cover functions next chapter
hi_count_cutoff <- 4     # can change only this number and the rest runs fine
card_counter <- 0
hi_lo_count <- 0
hi_lo_random

while (hi_lo_count < hi_count_cutoff) {  # important change
  print(hi_lo_count)
  hi_lo_count <- hi_lo_count + hi_lo_random[card_counter + 1]
  card_counter <- card_counter + 1
}

paste("Start betting larger on card:", card_counter)



