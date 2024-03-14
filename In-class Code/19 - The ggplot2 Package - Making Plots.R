
################################################################################
########################## Making Plots using ggplot2 ##########################
################################################################################

# we'll use the ggplot2 package for advanced plotting
# gg = grammar of graphics

# see slides 1-12 for an intro


install.packages("ggplot2")
library(ggplot2)


# use ggplot() to initialize the plot

# axes plotted, but no geometric object plotted since no geom specified
ggplot(data = mtcars, mapping = aes(x = am))



##### plotting one categorical variable
###############################################

##### categorical data

### geom_bar() makes a bar chart (y-axis defaults to counts/frequencies)
ggplot(data = mtcars, mapping = aes(x = am)) + 
  geom_bar()

# use aes(y = after_stat(count) to plot proportions on y-axis
ggplot(data = mtcars, mapping = aes(x = as.factor(am))) + 
  geom_bar(aes(y = after_stat(count)/sum(after_stat(count))))

# use aes(y = after_stat(count)/sum(after_stat(count)*100) to plot %'s on y-axis
ggplot(data = mtcars, mapping = aes(x = as.factor(am))) + 
  geom_bar(aes(y = after_stat(count)/sum(after_stat(count))*100))



# coord_polar() helps make a pie chart, but we won't cover this
# pie charts aren't great, and it's not very easy to make them w/ ggplot




##### plotting one quantitative variable
###############################################

### geom_histogram() makes a histogram
#######################################
ggplot(data = mtcars, mapping = aes(x = mpg)) + 
  geom_histogram()


# use bins argument to change number of bins
ggplot(data = mtcars, mapping = aes(x = mpg)) + 
  geom_histogram(bins = 15)


### geom_boxplot() makes a boxplot
#######################################
ggplot(data = mtcars, mapping = aes(x = "", y = mpg)) + 
  geom_boxplot()


# can orient the boxplot horizontally
ggplot(data = mtcars, mapping = aes(x = mpg, y = "")) + 
  geom_boxplot()

  
# or can use coord_flip() to orient the boxplot horizontally
ggplot(data = mtcars, mapping = aes(x = "", y = mpg)) + 
  geom_boxplot() + 
  coord_flip()
  


### geom_density() makes a density plot
#######################################
ggplot(data = mtcars, mapping = aes(x = mpg)) + 
  geom_density()




##### plotting two variables: both quantitative
##################################################

### geom_point() makes a scatterplot
#######################################
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_point()


# use size to change the size, but be careful where you include it
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg, size = 3.5)) + 
  geom_point()  # not what we want -> size shouldn't be an aesthetic

ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_point(size = 3.5)  # better -> size no longer an aesthetic


# use color to change the color, but be careful where you include it
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg, color = "blue")) + 
  geom_point()  # not what we want -> color shouldn't be an aesthetic

ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_point(color = "blue")  # better -> color no longer an aesthetic



### geom_bin2d() makes a 2d histogram
#######################################
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_bin2d()

# another 2d histogram example using the diamonds dataset, 
#  which comes w/ ggplot2
?diamonds

ggplot(data = diamonds, mapping = aes(carat, price)) + 
  geom_point()

ggplot(data = diamonds, mapping = aes(carat, price)) + 
  geom_bin2d()



### geom_density2d() makes a contour plot
###########################################
ggplot(data = diamonds, mapping = aes(carat, price)) + 
  geom_density2d()




##### plotting two variables: one quantitative and one categorical
#####################################################################

### geom_boxplot() can make side-by-side boxplots
###################################################
ggplot(data = mtcars, mapping = aes(x = cyl, y = mpg)) + 
  geom_boxplot(aes(group = cyl))  # need to specify aes(group = cyl)


# can still use coord_flip()
ggplot(data = mtcars, mapping = aes(x = cyl, y = mpg)) + 
  geom_boxplot(aes(group = cyl)) +
  coord_flip()



### geom_violin() can make side-by-side violin plots
#######################################################
ggplot(data = mtcars, mapping = aes(x = cyl, y = mpg)) + 
  geom_violin(aes(group = cyl))


# another example of violin plots, now using the diamonds dataset
ggplot(data = diamonds, mapping = aes(x = clarity, y = price)) +
  geom_violin(aes(group = clarity))



### for "side-by-side" histograms, wait until we 
###  talk about faceting
###################################################




##### plotting two variables: both categorical
######################################################

### geom_bar() can make stacked bar charts
#############################################

# doesn't work as we want b/c am isn't a factor
ggplot(data = mtcars, mapping = aes(x = cyl)) + 
  geom_bar(aes(fill = am))

# works now that am is a factor
ggplot(data = mtcars, mapping = aes(x = cyl)) + 
  geom_bar(aes(fill = as.factor(am)))

# fixes issue where x-axis values don't make sense
ggplot(data = mtcars, mapping = aes(x = as.factor(cyl))) + 
  geom_bar(aes(fill = as.factor(am)))


# geom_bar() can make clustered bar charts; need position = "dodge"
ggplot(data = mtcars, mapping = aes(x = as.factor(cyl))) + 
  geom_bar(aes(fill = as.factor(am)), position = "dodge")




##### time plots
###################################

library(dplyr)
library(Lahman)

# find max number of HRs by year
tibble(Batting)

hr_df <- Batting %>%
  group_by(yearID) %>%
  summarize(max_hr = max(HR))

str(hr_df)


### geom_line() makes a "line" plot (good for time plots)
###########################################################
ggplot(data = hr_df, mapping = aes(x = yearID, y = max_hr)) + 
  geom_line()


##### other useful geoms -- see the slides
###################################################




##### layering
##############################

### the order of your ggplot2 code matters!!

# dots hard to see
ggplot(data = hr_df, mapping = aes(x = yearID, y = max_hr)) + 
  geom_point(col = "red", size = 1.2) +
  geom_line()

# dots easier to see; note the change in order
ggplot(data = hr_df, mapping = aes(x = yearID, y = max_hr)) + 
  geom_line() +
  geom_point(col = "red", size = 1.2)



# another example; density curve somewhat hidden b/c on bottom
ggplot(data = mtcars, mapping = aes(x = mpg)) + 
  geom_density(col = "red", lwd = 2) +
  geom_histogram(bins = 15,
    aes(y = after_stat(count)/sum(after_stat(count)))
  )

# density curve clearer b/c now on top
ggplot(data = mtcars, mapping = aes(x = mpg)) + 
  geom_histogram(bins = 15, 
    aes(y = after_stat(count)/sum(after_stat(count)))
  ) +
  geom_density(col = "red", lwd = 2)



### mpg is another dataset about cars
mpg

# points hidden underneath curve
ggplot(data = mpg, mapping  = aes(x = displ, y = hwy)) +
  geom_point() +     # overplotting issues you might not have noticed
  geom_smooth()

# jittering = one fix for overplotting, but not in our course
ggplot(data = mpg, mapping  = aes(x = displ, y = hwy)) +
  geom_jitter() +
  geom_smooth()

# points no longer hidden
ggplot(data = mpg, mapping  = aes(x = displ, y = hwy)) +
  geom_smooth() +
  geom_point()



### simple linear regression example
plot(mpg$cty, mpg$hwy)    # simple linear regression ok based on plot
lm(hwy ~ cty, data = mpg)


ggplot(data = mpg, aes(x = cty, y = hwy)) + 
  geom_abline(intercept = 0.892, slope = 1.337) +
  geom_point()


ggplot(data = mpg, aes(x = cty, y = hwy)) + 
  geom_abline(intercept = 0.892, slope = 1.337, color = "blue", lwd = 1.5) +
  geom_point(size = 2.5)



# another example -- randomly sample 100 observations from normal dist. 
#  w/ mean = 0 and SD = 1
set.seed(1)
norm_samples <- data.frame(x = rnorm(100))  # must supply a df to ggplot()

ggplot(norm_samples, aes(x = x)) + 
  geom_histogram(aes(y = ..density..)) +
  geom_density(color = "red", lwd = 2) +
  geom_text(label = "Our Density Curve", x = -1.7, y = 0.3, 
    size = 5, col = "red"
  )



### alpha can help w/ overplotting by controlling opacity
ggplot(mpg, aes(hwy, cty)) + 
  geom_point()

ggplot(mpg, aes(hwy, cty)) + 
  geom_point(alpha = 0.5)

ggplot(mpg, aes(hwy, cty)) + 
  geom_point(alpha = 0.2)

ggplot(mpg, aes(hwy, cty)) + 
  geom_point(alpha = 0.1)



# using the diamonds dataset now -- will take a few seconds b/c lots of data
ggplot(diamonds, aes(carat, price)) + 
  geom_point()

ggplot(diamonds, aes(carat, price)) + 
  geom_point(alpha = 0.4)

ggplot(diamonds, aes(carat, price)) + 
  geom_point(alpha = 0.2)

ggplot(diamonds, aes(carat, price)) + 
  geom_point(alpha = 0.05)




##### saving plots
######################################

### can use ggsave() to save plots, but don't use when using R Markdown

# pdf; width and height are both in inches by default
ggsave(filename = "myplot.pdf", path = "C:/Users/ccasement/Desktop", 
  width = 12, height = 8
)


# png
ggsave(filename = "myplot.png", path = "C:/Users/ccasement/Desktop", 
  width = 12, height = 8
)

# jpg
ggsave(filename = "myplot.jpg", path = "C:/Users/ccasement/Desktop", 
  width = 12, height = 8
)



