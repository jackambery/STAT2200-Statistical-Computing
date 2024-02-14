
################################################################################
################################# Data Frames ##################################
################################################################################

# all variables/columns must be of the same length, but the different
#  variable/columns can be of different data types (e.g., character vectors, 
#  numeric vectors, factors, etc.)


##### creating a data frame
######################################

# use data.frame() to create a data frame (df)
exams <- data.frame(exam1 = c(85, 90, 72), exam2 = c(87, 96, 79))
exams


# another example - try to use informative names for data frames and 
#  variables that make up the data frames
work <- data.frame(
  person = c("Bill", "Joe", "Emma", "Andy", "Diane", "Chris", "Anna"),
  age = c(35, 64, 25, 20, 47, 38, 51),
  sex = c("M", "M", "F", "M", "F", "M", "F")
)
work



# reminder: all variables must be the same length
data.frame(
  age = c(20, 22, 19, 18, 22),
  sex = c("M", "M", "F")
)




##### some useful functions
####################################

# use View() w/ a capital "v" to view a df
View(work)

# use str() to examine the structure of a df
str(work)


# use head() to print only the FIRST few observations/rows
# useful since you often don't want to print entire data frames
work

head(work)           # head print 6 rows by default
head(work, n = 4)    # n = number of rows to print


# use tail() to print only the LAST few observations/rows
work

tail(work)          # tail prints 6 rows by default
tail(work, n = 3)


# can click on variable name in environment pane to view df in new tab
# try it out for the work df!


### some useful functions to find the dimensions of a df:
### nrow(), ncol(), dim(), and str()
work

nrow(work)
ncol(work)
dim(work)    # number of rows, then number of columns
str(work)    # also displayed here, but worth knowing the other functions!



### subsetting individual entries: 
###  use [] w/ row #, column # inside
############################################
work
work[1, 1]   # subset value for 1st obs, 1st var
work[1,1]    # same thing -- don't need space

work
work[2, 3]   # subset value for 2nd obs, 3rd var
work[4, c(1, 3)]
work[4:6, 2:3]


# leave row spot blank if want entire columnn
work
work[ , 2]         # subset entire 2nd column

# leave column spot blank if want entire row
work[4, ]         # subset entire 4th row



##### selecting variables
################################################

### how to select one variable/column

# using variable name: use $ w/ variable name - very common
work
work$person
work$age
work$sex


# using index/indices: use [ ] w/ column number(s)
work
work[, 1]
work[, 2]
work[, 3]



### how to select 2+ variables/columns

# using indices: use the indices in the column spot
work[, 2:3]
work[, c(1, 3)]


# using variable names: use the names in the column spot
work
work[, c("person", "age")]
work[, c("sex", "age")]


# partial matching works to select variable(s), but be careful -
#  this is *not* recommended
work
work$person
work$per     # can use partial words
work$p       # only one variable name that starts with "p"


# add new variable to data frame to see why partial matching can be bad
work$age_new <- work$age + 3
work

work$age    # works as expected
work$a      # 2 variable names start w/ "a"




##### deleting variables
#######################################

# use [ ] w/ negative column index
work
work[ , -2]
work

work2 <- work[, -2]    
work2



##### filtering data frames
#########################################
work[work$sex == "M", ]      # filter all data for all of the males

work[sex == "M", ]      # doesn't work


work
work[work$age >= 30, ]     # filter data for all people age 30+


# use rownames() to determine observation numbers
atleast30 <- work[work$age >= 30, ]
atleast30

rownames(atleast30)
nrow(atleast30)    # 5 people at least 30



### filtering using logical operators (& and |)

# filter data for all people between 30 and 50 years old, inclusive
work

work[work$age >= 30 & work$age <= 50, ]


# filter data for all people over 70 years old
work
work[work$age > 70, ]    # not an error; nobody is over 70


# filter data for all people below 30 or over 60
work
work[work$age < 30 | work$age > 60, ]



# what do you think the code below will print?
work
work[work$sex == "F", c("person", "age")]




##### Practice problems
#######################################

# first install the Lahman package:  install.packages("Lahman")
# next load the Lahman package:      library(Lahman)

# Lahman package - contains baseball datasets, including the Salaries dataset

### The answers can be found below the questions.

# 1) Examine the dataset.
View(Salaries)

# 2) Determine what type of data structure the dataset is stored in.
str(Salaries)

# 3) Determine how many rows and columns the dataset has.
nrow(Salaries)
ncol(Salaries)

# 4) Print the first 5 rows of the dataset.
head(Salaries, n = 5)

# 5) Select the salary variable and print all of the salaries in the dataset.
Salaries$salary

# 6) My favorite player was David Ortiz. Print all of his data only. Note that 
#    his player ID is: ortizda01
Salaries[Salaries$playerID == 'ortizda01' , ]

# 7) Print all of the data for every player who made at least $25 million in a 
#    season.
Salaries[Salaries$salary >= 25000000 , ]

# 8) Determine how many players have made at least $25 million in a season.
nrow(Salaries[Salaries$salary >= 25000000 , ])

# 9) Print all of the data for every player who made at least $25 million in a 
#    season and played for the New York Yankees.
Salaries[(Salaries$salary >= 25000000) & (Salaries$teamID == "NYA"), ]

# 10) Print all of the data for every player who made either less than one 
#     hundred thousand dollars or more than $30 million in a season.
pay <- data.frame(Salaries[Salaries$salary > 30000000 | Salaries$salary < 100000 , ])
View(pay)

### Answers:

# 1) Examine the dataset.
View(Salaries)


# 2) Determine what type of data structure the dataset is stored in.
str(Salaries)


# 3) Determine how many rows and columns the dataset has.
nrow(Salaries)
ncol(Salaries)
dim(Salaries)      # another option

# 4) Print the first 5 rows of the dataset.
head(Salaries, n = 5)
Salaries[1:5, ]    # another option


# 5) Select the salary variable and print all of the salaries in the dataset.
Salaries$salary
Salaries[, "salary"]    # another option, but first way is preferred


# 6) My favorite player was David Ortiz.  Print all of his data only.
str(Salaries)

Salaries[Salaries$playerID == "ortizda01", ]


# 7) Print all of the data for every player who made at least $25 million in a 
#    season.

atleast25mil <- Salaries[Salaries$salary >= 25000000, ]


# 8) Determine how many players have made at least $25 million in a season.

nrow(atleast25mil)


# 9) Print all of the data for every player who made at least $25 million in a 
#    season and played for the New York Yankees.

Salaries[Salaries$salary >= 25000000 & Salaries$teamID == "NYA", ]



# 10) Print all of the data for every player who made either less than one 
#     hundred thousand dollars or more than $30 million in a season.

Salaries[Salaries$salary < 100000 | Salaries$salary > 30000000, ]




##### adding variables and combining df's
################################################

work <- data.frame(
  person = c("Bill", "Joe", "Emma", "Andy", "Diane", "Chris", "Anna"),
  age = c(35, 64, 25, 20, 47, 38, 51),
  sex = c("M", "M", "F", "M", "F", "M", "F")
)

work2 <- data.frame(
  person = c("Zoe", "Tim"),
  age = c(29, 40)
)


# can use rbind() to combine df's by row
work
work2
rbind(work, work2)      # error - make sure all variables are the same!


work2_new <- data.frame(
  person = c("Zoe", "Tim"),
  age = c(29, 40),
  sex = c("F", "M")
)

work
work2_new


work_combo <- rbind(work, work2_new)
work_combo


# can use cbind() to combine objects by column
# adding new variable to work_combo here
height <- c(68, 70, 63, 71, 67, 72, 70, 66, 70)
cbind(work_combo, height)    # careful - nothing has been stored!


# can also use $ w/ new variable name to add new variable to df
# this is the way I prefer
work_combo
work_combo$height <- c(68, 70, 63, 71, 67, 72, 70, 66, 70)
work_combo


# can create a new variable from an existing one
work_combo$height_ft <- work_combo$height/12
work_combo




##### built-in datasets
####################################

# use data() to view a list of available datasets
data()

# examples
cars          # console isn't a good place to view datasets in general
View(cars)    # much easier for viewing datasets in a tab than in the console
str(cars)
?cars         # good to examine the help documentation


View(faithful)
str(faithful)
?faithful


View(mtcars)
str(mtcars)


View(iris)
str(iris)



# some packages, such as plyr, come w/ datasets
install.packages("plyr")   # install the package - only run once
library(plyr)              # run every time want to access dplyr package

data()    # plyr datasets are at the end

View(baseball)
str(baseball)



# not all datasets are df's
View(Titanic)
Titanic
str(Titanic)



