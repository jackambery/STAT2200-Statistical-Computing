
################################################################################
#################################### tidyr #####################################
################################################################################

# we'll use tidyr to reshape data
# tidyr cheatsheet -- see Blackboard


# install the tidyr package
install.packages("tidyr")

# load tidyr into the current R session
library(tidyr)


### in tidyr, pivot_longer() and pivot_wider() are 2 fnxs to get to know


# pivot_longer() takes several columns and collapses them into 2 columns
# used when you have columns that are not variables

# dataset w/ variables: person, treatment (a, b, or c), and heart rate
messy_df <- data.frame(
  person = c("Joe", "Bill", "Mary"),
  a = c(60, 70, 68),
  b = c(80, 72, 67),
  c = c(55, 77, 80)
)
messy_df    # is it tidy?


pivot_longer(messy_df, cols = 2:4, names_to = "treatment", 
  values_to = "heartRate"
)    # is it tidy?




# pivot_wider() is the inverse of pivot_longer()
table2      # comes w/ the tidyr package. Is it tidy?

pivot_wider(table2, names_from = "type", 
  values_from = "count"
)    # is it tidy?



