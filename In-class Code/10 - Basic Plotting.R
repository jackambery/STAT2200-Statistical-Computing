
################################################################################
################################ Basic Plotting ################################
################################################################################

##### the (1) number of variables and (2) variable type(s) determine what type 
#####  of plot to consider using
################################################################################


##### one quantitative variable
###########################################

### hist() makes a histogram
##############################
scores <- c(89, 90, 82, 79, 87, 88, 92, 93)
hist(scores)

mtcars$mpg
hist(mtcars$mpg)

hist(mtcars$mpg, breaks = 10)  # use breaks to change the number of bins; 
                               # note: R doesn't always use that exact number


### boxplot() makes a boxplot
##############################
boxplot(scores)




##### one categorical variable
###########################################

### barplot() makes a bar graph 
#################################
year <- c("Fr", "So", "Fr", "Jr", "Fr", "So", "Sr")

# table() counts the frequency of each value
counts <- table(year)
counts

barplot(counts)    # easiest to supply a table w/ counts


### pie() makes a pie chart
#############################
pie(counts)    # easiest to supply a table like w/ a bar graph




##### two quantitative variables
###########################################

### plot() makes a scatterplot
################################
xvar <- c(2, 3, 8, 6, 4, 1, 5, 3, 6)
yvar <- c(6, 4, 8, 10, 7, 2, 6, 4, 4)

plot(x = xvar, y = yvar)   # safest to specify which variable is x vs. y
plot(xvar, yvar)           # first input is x variable, second is y variable


# using data from a data frame
mydf <- data.frame(
  x = c(2, 3, 8, 6, 4, 1, 5, 3, 6), 
  y = c(6, 4, 8, 10, 7, 2, 6, 4, 4)
)
mydf

plot(x = mydf$x, y = mydf$y)




##### one quantitative variable and one categorical variable
##############################################################

# plot() makes side-by-side boxplots if x variable is a factor and 
#  y variable is a numeric (or integer) vector
str(mtcars)
mtcars$cyl
mtcars$mpg

plot(x = as.factor(mtcars$cyl), y = mtcars$mpg)    # good
plot(y = as.factor(mtcars$cyl), x = mtcars$mpg)    # not what we want




##### graphical parameters
#######################################
# there are various additional arguments to plot(), but we won't cover
#  too many since we'll use the ggplot2 package for much nicer plotting!

# use xlab and ylab to add x-axis and y-axis labels, respectively
plot(xvar, yvar, xlab = "x-variable name", ylab = "y-variable name")




##### adding lines and text to an existing plot
########################################################

# use abline() to specify y-intercept and slope of line
plot(xvar, yvar)
abline(a = 3, b = 0.75)    # a = y-intercept, b = slope


plot(xvar, yvar)
abline(a = 6, b = 0)    # slope = 0 -> horizontal line



### use text() to add text
#################################
plot(xvar, yvar)

# specify coordinates of text based on values in plot
text(x = 2, y = 9, labels = "Data set values")


### use legend() to add a legend
####################################
plot(1:5, 1:5, col = "red", type = "l")
abline(a = 3, b = 0, col = "blue")
legend(x = 1, y = 5, legend = c("line 1", "line 2"), 
  col = c("red", "blue"), lty = 1
)  # note: there are a lot more arguments for legend()



##### use par(mfrow = c(, )) or par(mfcol = c(, )) to view multiple plots
#############################################################################

# plots next to one another
par(mfrow = c(2, 1))  # 2 rows, 1 column
plot(xvar, yvar)
plot(1:50, 1:50)

par(mfrow = c(1, 2))  # 1 row, 2 columns
plot(xvar, yvar)
plot(1:50, 1:50)


# par(mfrow = c(, )) fills rows first
par(mfrow = c(2, 2))  # 2 rows, 2 columns
plot(xvar, yvar)
plot(1:25, 76:100)
plot(1:10, 1:10)
plot(1:20, 1:20)


# par(mfcol = c(, )) fills columns first
par(mfcol = c(2, 2))  # still 2 rows, 2 columns
plot(xvar, yvar)
plot(1:25, 76:100)  # fills column first
plot(1:10, 1:10)
plot(1:20, 1:20)

plot(1:10, 1:10)  # all graphic spots already filled, so starts over


# use dev.off() to reset the graphics device
dev.off()
plot(xvar, yvar)  # back to only 1 plot in plotting window


z <- plot(1:10, 1:10)
z    # can't store plots made using base R




### use curve() to plot a curve
####################################
x <- 1:5
y <- c(1, 5, 7, 12, 24)
plot(x, y)  # looks like a quadratic would fit this

# curve() doesn't "stack" w/ plot() by default
curve(x^2, from = 0, to = 5)  

dev.off()


plot(x, y)
# add = TRUE -> only use w/ curve()
curve(x^2, from = 0, to = 5, add = TRUE)  

dev.off()

curve(x^2, from = 0, to = 5)

# points() stacks w/ curve(), as do some other functions (e.g., lines())
points(x, y)  



