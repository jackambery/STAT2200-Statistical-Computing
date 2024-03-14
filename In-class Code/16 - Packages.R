
################################################################################
################################### Packages ###################################
################################################################################

# packages contain functions and data sets that are not available unless 
#  they're installed and loaded
# the functions perform specialized tasks

# 3 "types" of packages exist: base, recommended, and contributed

# (1) the base R packages: provide essential commands and built-in datasets
#  and are available every time you start R -- important in our course
# examples: base, parallel, datasets, stats, graphics, methods, etc.


# (2) recommended packages: come w/ R but need to be loaded when you want to 
#  access them -- nothing too important in our course, but good to know
# examples: MASS, spatial, survival, etc.


# (3) contributed packages: do not come w/ R and need to be installed (*and 
#  loaded when you want to access them*)
# use install.packages("[package name]"), but without the brackets, to install 
#  a package


# tidyverse = a collection of R packages: dplyr, tidyr, ggplot2, etc.
# we'll use dplyr and ggplot2 soon, which are both a part of the tidyverse


# use library([package name]), without the brackets, to load a package
# quotes are not required with library()
# typically you write the library() code at the very beginning of an R script
#  or R Markdown file (inside of an R code chunk since it's R code!)


# how to update packages (one way): click the 'Tools' tab, then 
#  'Check for Package Updates...'


# CRAN: what is it? -- the Comprehensive R Archive Network -- a network of 
#  servers worldwide that store up-to-date code and the corresponding help 
#  documentation

# for help documentation, it's easiest just to Google the package name and 
#  click on the PDF availble from CRAN


# Masking: what is it? -- if you have 2+ fxns (or objects) w/ the same name, 
#  which one will be used? -> whichever R finds 1st in the search path, 
#  meaning the one that comes later in the search path is masked

# use search() to see the search path
search()


# create a crazy "sum" fxn that clearly doesn't find the sum
sum <- function(x){
  result <- 0
  for(i in 1:length(x)) result <- result + x[i]^2
  result
}

search()  # sum is in the global env, which comes before the base package


sum(c(1, 3))  # obviously not correctly!


# you can still access a fxn from another package using 
#  [package name]::[fxn name], without the brackets; notice the 2 colons, not 1
base::sum(c(1, 3))



# if you've loaded 2 packages w/ the same fxn, the fxn in the package loaded 
#  more recently is the one that will be used, and the fxn from the package 
#  loaded earlier is masked
library(dplyr)
# filter() is masked from the 'stats' package, so if you use filter(), the one 
#  from the 'dplyr' package will be used
# if you want to use filter() from 'stats,' use stats::filter()



