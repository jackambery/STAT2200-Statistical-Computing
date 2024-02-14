
################################################################################
########################### Reading/Importing Files ############################
################################################################################

### first make sure you know how to open a CSV file
# Windows users: just open the file on your computer using Excel
# Mac users: go to https://www.wikihow.com/Open-CSV-Files  (focus on Method 1)


# suggested: use Import Dataset -> From Text (base)...


# .csv, .xlsx, and .xls are common file types for working with data in Excel
# when working w/ spreadsheets in R, use .csv rather than .xls or .xlsx files

# note that in each example, your file path will be different than mine!


## Example 1: RestaurantTips.csv

# when knitting using R Markdown, your file path is the only thing that may run 
# off the page
tips <- read.csv(
  "C:/Users/ccasement/Dropbox (Fairfield University)/STAT 2200/Data/RestaurantTips.csv"
)

View(tips)



## Example 2: AllCountries.csv
countries <- read.csv(
  "C:/Users/ccasement/Dropbox (Fairfield University)/STAT 2200/Data/AllCountries.csv"
)

View(countries)    # missing values represented by NAs -- always want this



## Example 3: Auto.csv
autocsv <- read.csv(
  "C:/Users/ccasement/Dropbox (Fairfield University)/STAT 2200/Data/Auto.csv"
)

View(autocsv)  # good except for missing values (e.g., observation 33 has one 
               # of a few)

str(autocsv)   # one way of noticing missing data (sometimes) -- 
               # look at how horsepower is a character vector


# note the use of na.strings
autocsv2 <- read.csv(
  "C:/Users/ccasement/Dropbox (Fairfield University)/STAT 2200/Data/Auto.csv", 
  na.strings = "?"
)

View(autocsv2)  # good -- missing values now represented by NAs

str(autocsv2)



# more on missing data: if you have a CSV file where missing data cells are 
#  simply blank, leave the na.strings input blank


# other file formats: we won't cover reading datasets stored using other file 
#   formats, but the Import Dataset feature assists with some common ones



