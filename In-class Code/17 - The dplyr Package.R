
################################################################################
############################## The dplyr package ###############################
################################################################################

# dplyr is a very useful package for manipulating and transforming data
# it contains fxns for: looking at data, subsetting observations, subsetting 
#   variables, summarizing variables, making new variables, and reordering
#   datasets

# a data wrangling cheat sheet for dplyr is on Blackboard
# important: dplyr fxns expect 'tidy' data = each observation (or case) is in 
#  its own row AND each variable is in its own column


# install the dplyr package
install.packages("dplyr")


# load dplyr into the current R session
library(dplyr)


# note that this package undergoes a decent number of changes; we're using the
#  most up-to-date fxns that I think will be most helpful in this course
?top_n  # look at the "superseded" lifecycle under the Description as an example



# the Lahman package provides tables from a baseball database as a set of df's
install.packages("Lahman")
library(Lahman)


str(Batting)     # Batting comes w/ the Lahman package
battingLabels    # battingLabels specifies what each variable measures


### the 1st fxn we're covering that comes w/ dplyr is tibble()
###  tibble() makes a tibble (a table data frame) = a new type of data structure
batting <- tibble(Batting)
batting    # no issues w/ overflowing the console when printing the object




#################################################
########## The pipe operator:  %>%
#################################################

# becoming more and more popular
# makes chaining operations easy, especially long, sequential operations across
#   multiple lines

# x %>% f is the same as f(x)
f <- function(x) 2*x
f(3)
3 %>% f   # for illustrative purposes; not that helpful here


exam <- c(80, 90, 96, 83, 78)
exam %>% mean    # same as mean(exam), though usually use %>% when have 2+ fxns


?sort
# x %>% f(y) is the same as f(x, y)
exam %>% sort(dec = TRUE)    # same as sort(exam, dec = TRUE)


# x %>% f %>% g is the same as g(f(x))
exam %>% mean %>% round    # round(mean(exam))



# x %>% f %>% g %>% h is the same as h(g(f(x)))
# x %>% f(y, z = .) is the same as f(y, z = x) -> x gets piped where the "." 
#  is if you use a period




###########################################################
########## Manipulating observations/cases/rows
###########################################################


### extracting observations/cases/rows
##########################################################
# fxns: filter(), distinct(), slice(), slice_sample(), 
#       slice_max(), slice_min(), slice_head(), and 
#       slice_tail()

df <- data.frame(
  color = c("blue", "black", "blue", "blue", "black"),
  value = 1:5
)
df


##### subsetting rows based on some condition(s)

# "old" way using [ ]
df[df$color == "blue", ]  # subset all observations whose color is blue


### another way, now using filter()
filter(df, color == "blue")


filter(df, color == "blue" & value > 2)    # don't use &&
filter(df, color == "blue", value > 2)     # can use comma instead of &



### distinct() returns unique rows
df2 <- data.frame(
  color = c("blue", "black", "blue", "blue", "black"),
  value = c(1, 2, 3, 1, 2)
)
df2

distinct(df2)



### slice() returns rows based on row numbers
slice(batting, 1)             # return first row
slice(batting, 2:5)           # return rows 2-5
slice(batting, c(3, 5, 9))    # return rows 3, 5, and 9



### slice_sample() returns randomly-selected rows
# you specify either the number/count to return (using the 'n' argument) OR 
#   what proportion to return (using the 'prop' argument)
slice_sample(batting, n = 8)
slice_sample(batting, prop = 0.01)    # 1% of data randomly sampled
slice_sample(batting, prop = 0.2)     # 20% of data randomly sampled


# careful -- **set a seed whenever you want reproducible results** -> 
#  the same data will be randomly sampled regardless of the computer used
set.seed(1)


# careful if you rerun the code multiple times -- will need to reset the seed
#  for reproducibility
slice_sample(batting, prop = 0.01)
slice_sample(batting, prop = 0.01)

set.seed(1)
slice_sample(batting, prop = 0.01)    # same as original sample


# use replace = TRUE in slice_sample() to sample WITH replacement
slice_sample(batting, prop = 0.01, replace = TRUE)



### slice_max() returns the rows w/ the largest values of a variable
slice_max(batting, H, n = 5)
slice_max(batting, HR, n = 10)




### slice_min() returns the rows w/ the smallest values of a variable
slice_min(batting, G, n = 8)    # careful -- more than 8



### slice_head() returns the first number ('n') OR proportion ('prop') of rows
###  in the data frame or tibble
slice_head(batting, n = 5)          # first 5
slice_head(batting, prop = 0.01)    # first 1%



### slice_tail() returns the last number ('n') OR proportion ('prop') of rows
###  in the data frame or tibble
slice_tail(batting, n = 10)
slice_tail(batting, prop = 0.01)




### reordering/arranging observations/cases/rows
#######################################################
# fxn: arrange()

grades <- data.frame(
  hw1 = c(90, 85, 80, 92),
  hw2 = c(93, 88, 79, 85),
  hw3 = c(87, 92, 78, 90)
)
grades


# arrange() sorts observations by a variable (increasing or decreasing)
arrange(grades, hw3)     # data sorted by hw3 grades in increasing order

# use desc([variable name]) inside arrange() to sort a var in descending order
arrange(grades, desc(hw3))    # data sorted by hw3 grades in descending order




###########################################################
########## Manipulating variables/columns
###########################################################

### extracting variables/columns
############################################
# fxns: select() and relocate()

str(mtcars)


##### extracting column(s)

# "old" way using [ ]
mtcars[, c("mpg", "cyl", "hp")]      # subset mpg, cyl, and hp variables


### new way, using select()
select(mtcars, mpg, cyl, hp)
select(mtcars, c("mpg", "cyl", "hp"))    # works, but c() unnecessary here



# can stack %>%
mtcars %>% filter(mpg >= 20) %>% select(mpg, cyl, hp)

# you should use multiple lines when code gets long!!
mtcars %>% 
  filter(mpg >= 20) %>% 
  select(mpg, cyl, hp)


# use select() w/ minus sign to select all variables except the one(s) w/ 
#  minus sign
select(mtcars, -am)          # subset all variables except am
select(mtcars, -am, -cyl)    # subset all variables except am and cyl



### relocate() moves columns; use .after or .before arguments
relocate(mtcars, mpg, .after = hp)
relocate(mtcars, wt, .before = disp)
mtcars    # careful -- nothing has moved! would need to store result


relocate(mtcars, mpg, cyl, .after = wt)    # can move multiple columns at once




### making new variables/columns
###########################################
# fxn: mutate() and rename()

### mutate() creates a new variable and adds it to the data frame
grades <- data.frame(
  hw1 = c(90, 85, 80, 92),
  hw2 = c(93, 88, 79, 85),
  hw3 = c(87, 92, 78, 90)
)
grades

grades <- mutate(grades, hw_avg = (hw1 + hw2 + hw3)/3)
grades


grades <- grades %>% mutate(hw_avg = (hw1 + hw2 + hw3)/3)
grades


# can use mutate() to drop variable(s) by setting the var(s) = NULL
grades2 <- mutate(grades, hw3 = NULL)
grades2



### rename() allows you to rename individual variables
rename(grades, HW1 = hw1)    # new name 1st, old name 2nd

grades    # careful -- df not overwritten


# can rename multiple vars at once
grades <- grades %>% rename(
  HW1 = hw1, HW2 = hw2, HW3 = hw3, 
  HW.Avg = hw_avg
)
grades    # df overwritten w/ new variable names




#################################################
########## Summarizing data
#################################################

# fxns: summarize() and count()
# note: can use summarise() or summarize()


### summarize() returns summaries of a variable
mean(mtcars$mpg)
summarize(mtcars, mean(mpg))      # find mean mpg

# can calculate multiple summaries
summarize(mtcars, mean(mpg), sd(mpg))  # find mean and sd of mpg
summarize(mtcars, mean(mpg), median(mpg), sd(mpg))  # find mean, median, and sd of mpg



# use across() inside summarize() to return the same summaries of multiple 
#  variables; careful w/ formatting of across()!
summarize(mtcars, across(c(mpg, hp, wt), mean))


# if want multiple summaries of multiple variables, ideal to use a *named* vector
summarize(mtcars, across(c(mpg, hp, wt), c(mean, sd)))    # results are unclear
summarize(mtcars, 
  across(c(mpg, hp, wt), c(Mean = mean, SD = sd))
)    # clearer



### count() counts how many times something occurs
count(mtcars, cyl)


# another example using the Batting dataset
head(Batting, 10)  # just to examine the dataset

count(Batting, playerID)  # count how many years each player played; CAREFUL!!


# can store when filtering, just like before
hank <- filter(Batting, playerID == "aaronha01")  # filter data for Hank Aaron

hank
str(hank)
View(hank)



# careful: mark teixeira didn't play 16 years! -- common for sports data
count(Batting, playerID == "teixema01")

data.frame(filter(Batting, playerID == "teixema01"))

# clearer way of writing code above; also, look at 2007 and 2008
Batting %>% 
  filter(playerID == "teixema01") %>% 
  data.frame




#####################################################
########## Grouping observations/rows/cases
#####################################################

# fxn: group_by()

# group_by() groups observations based on specified variable(s)
cyl_grouped <- mtcars %>% group_by(cyl)    # group cars by number of cylinders
cyl_grouped    # appearance of tibble doesn't change, but Groups (at top) is new


# find mean hp and mean wt based on number of cylinders
summarise(cyl_grouped, mean_hp = mean(hp), mean_wt = mean(wt))


# recall: common to chain functions using %>%
mtcars %>%
  group_by(cyl) %>%
  summarise(mean_hp = mean(hp), mean_wt = mean(wt))



### can group based on multiple variables

# group cars by number of cylinders (cyl) and automatic vs. manual (am)
cyl_grouped2 <- mtcars %>% group_by(cyl, am)
cyl_grouped2

# find mean hp and mean wt based on cylinders and automatic/manual
summarise(cyl_grouped2, mean_hp = mean(hp), mean_wt = mean(wt))


# recall: clearer if you chain functions using %>%
mtcars %>% 
  group_by(cyl, am) %>%
  summarise(mean_hp = mean(hp), mean_wt = mean(wt))



### another example
grades_combined <- data.frame(
  exam1 = c(90, 45, 80, 92, 85, 89, 75, 95),
  exam2 = c(93, 58, 79, 85, 88, 97, 99, 78),
  exam3 = c(87, 42, 78, 90, 91, 88, 96, 78),
  class = c(rep(1, 4), rep(2, 4))
)
grades_combined

# find exam averages for each class; easy to read code? (probably not)
summarise(group_by(grades_combined, class), 
  mean1 = mean(exam1), mean2 = mean(exam2), mean3 = mean(exam3)
)


# much easier to read
grades_combined %>%
  group_by(class) %>%
  summarise(
    mean_exam1 = mean(exam1), 
    mean_exam2 = mean(exam2), 
    mean_exam3 = mean(exam3)
  )



# find exam averages for each class and only for students w/ exam 1 score >= 60
#  and then round to 2 digits
grades_combined %>%
  filter(exam1 >= 60) %>%
  group_by(class) %>%
  summarise(mean1 = mean(exam1), mean2 = mean(exam2), mean3 = mean(exam3)) %>%
  round(2)



