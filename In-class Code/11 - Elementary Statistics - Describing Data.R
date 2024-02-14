
################################################################################
################### Elementary Statistics - Describing Data ####################
################################################################################

##### 1 variable - quantitative
######################################

# measures of central tendency
################################

# measures: mean, median, and mode
# use mean(), median(), and table()

str(mtcars)  # hp is one of the quantitative variables

mean(mtcars$hp)
median(mtcars$hp)
table(mtcars$hp)  # easy to see mode in small dataset


# find mode for larger datasets
mtcars_tab <- table(mtcars$hp)
mtcars_tab[mtcars_tab == max(mtcars_tab)]



# measures of spread
###############################

# measures: standard deviation, variance, interquartile range, and range
# use sd(), var(), and IQR(), and max() - min()

sd(mtcars$hp)     # sample sd
var(mtcars$hp)    # sample variance = (sample sd)^2
IQR(mtcars$hp)


# use max() - min() for the range()
range(mtcars$hp)      # returns the min and max, not the actual range
max(mtcars$hp)
min(mtcars$hp)
max(mtcars$hp) - min(mtcars$hp)    # returns the actual range



# percentiles/quantiles
##############################

# use quantile() with the percentage input as a proportion
quantile(mtcars$hp, 0.05)            # returns the 5th percentile
quantile(mtcars$hp, 0.99)            # returns the 99th percentile
quantile(mtcars$hp, c(0.05, 0.95))   # returns the 5th and 95th percentiles



# the 5-number summary
##############################

# consists of: min, first quartile, median, third quartile, and max
# use summary()
summary(mtcars$hp)  # returns the 5-number summary AND the mean



# calculating summary statistics when the vector has an NA
##############################################################

# use na.rm = TRUE -> works w/ basically any function that calculates 
#  a statistic
height <- c(60, 70, NA, 66)

# these don't work b/c of the NA
mean(height)
median(height)
sd(height)
quantile(height, 0.1)


# these work now that the NA has been "removed"
#  (really, ignored when calculating)
mean(height, na.rm = TRUE)
median(height, na.rm = TRUE)
sd(height, na.rm = TRUE)
quantile(height, 0.1, na.rm = TRUE)



# rounding
#################################

# use round()
round(mean(height, na.rm = TRUE))
round(mean(height, na.rm = TRUE), digits = 3)    # 3 decimal places
round(mean(height, na.rm = TRUE), 2)    # 2 decimal places
round(mean(height, na.rm = TRUE))       # no decimal places -> nearest integer



# plots
########################################

# recall: histograms and boxplots
# use hist() and boxplot()
hist(mtcars$hp)
boxplot(mtcars$hp)



##### 1 variable - categorical
##################################################

# statistics
########################################

# counts/frequencies, proportions, and percentages
# use table() and combo of table() w/ nrow()

str(mtcars)  # cyl is one of the categorical variables
mtcars$cyl


# calculate counts/frequencies, proportions, and percentages
table(mtcars$am)                      # frequencies
table(mtcars$am)/nrow(mtcars)         # proportions; careful if any NAs!
table(mtcars$am)/nrow(mtcars)*100     # percentages; careful if any NAs!



# plots
########################################

# recall: bar plots and pie charts
# use barplot() and pie(), each after using table()
barplot(table(mtcars$am))
pie(table(mtcars$am))




### 2 variables - both quantitative
########################################################

nels <- read.csv(
  "C:/Users/ccasement/Dropbox (Fairfield University)/STAT 2200/Data/NELS.csv"
)

str(nels)


# plot
############################

# scatterplot -> use plot()
plot(x = nels$achmat10, y = nels$achmat12)


# statistics
############################

## correlation coefficient and simple linear regression coefficients 
##  (y-int and slope)

# use cor() to find the correlation coefficient
cor(nels$achmat10, nels$achmat12)


# what if there's a missing value for at least 1 of the 2 variables 
#  of interest?
cor(nels$ses, nels$apoffer)    # NA


# use anyNA() to determine if there are any NAs in a vector or data frame
anyNA(nels)    # careful -- can't tell which variables(s) have NAs!

anyNA(nels$ses)
anyNA(nels$apoffer)


# can see the NAs when print the values for apoffer (not always easy to do)
nels$apoffer


# use: use = "complete.obs" in cor() to only use complete observations
# i.e., ignore all observations (rows) that contain an NA for at least
#  1 of the 2 variables of interest
cor(nels$ses, nels$apoffer, use = "complete.obs")



# for regression, use lm()
# the first input is: response variable ~ explanatory variable
# lm() automatically ignores observations that include any NAs
lm(achmat12 ~ achmat10, data = nels)  # y-int then slope printed
                                      # regression equation: y-hat = 5.7647 + 0.8974x



