
################################################################################
################################### Factors ####################################
################################################################################

# factor (in R) = a data structure sometimes used w/ categorical data
# generally created from a numeric vector or a character vector

### creating factors
####################################

# using numbers
disease_numbers <- c(0, 0, 0, 1, 1, 0)
disease_numbers


# use factor() to create a factor vector
disease_numbers_fac <- factor(disease_numbers)
disease_numbers_fac


# using strings
disease_letters_fac <- factor(c("no", "no", "no", "yes", "yes", "no"))
disease_letters_fac


# levels() extracts the levels (groups/categories) of a factor
levels(disease_numbers_fac)
levels(disease_letters_fac)


# can relabel the levels
disease_numbers_fac
levels(disease_numbers_fac) <- c(1, 2)
disease_numbers_fac



# subset factors in same way as vectors
disease_numbers_fac[1:4]
disease_numbers_fac[1:3]    # all levels retained even if not in subset


# identify all males (1's), for example
disease_letters_fac
disease_letters_fac[disease_letters_fac == "yes"]


(disease <- factor(c(0, 1, 0, 0, 1, 1, 0, 0, 0, 1)))
disease[disease == "1"]



### defining and ordering levels
#####################################

# ex: some months of birth for a group of people
(mob <- c("Apr", "Jan", "Dec", "Sep", "Nov", "Jun", "Jun"))

months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
  "Oct", "Nov", "Dec"
)
months


# factor
mob_fac <- factor(mob, levels = months)    # looks ordered but isn't
mob_fac

mob_fac[2] < mob_fac[4]    # error since levels not ordered


# supply more arguments to factor() to add ordering
# now have an ordered factor
mob_fac2 <- factor(mob, levels = months, ordered = TRUE)    # order set
mob_fac2

mob_fac2[2] < mob_fac2[4]
mob_fac2[3] < mob_fac2[6]



### combining factors
#########################################

# ordered factor from before
mob_fac2

# another ordered factor
mob_fac3 <- factor(c("Jun", "May", "Aug"), levels = levels(mob_fac2), 
  ordered = TRUE
)
mob_fac3


# can combine factors using c()
c(mob_fac2, mob_fac3)



