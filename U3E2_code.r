# Using R to clean up the refine_original.csv data set
# Data Science Unit 3: Exercise 2
# Stephen Golden 2016 08 31
#

# Dealing with missing values
# Read the titanic_original.csv file into a data frame
titanic <- read.csv("L:/MyDocuments/Data Science/Data Wrangling 2/titanic_original.csv")

# Replace missing Southampton with Science
titanic$embarked <- sub("^$", "S", titanic$embarked)

# Refactor values that were changed to character
titanic$embarked=as.factor(titanic$embarked)

# Calculate mean of Age column and place into missing values
titanic$age[is.na(titanic$age)] = mean(titanic$age, na.rm=TRUE)

# Considering other ways to populate missing values:
# 
# 1. Placing zeroes in the missing age values would skew the mean toward the minimum.
#
# 2. You could randomly insert age values ranging from the minimum age to the maximum age, 
#    but since the passengers were self-selecting, it may bias the results because passengers 
#    of a particular age group might be more frequent than a random distribution would produce.
#  
# 3. We could simply not count the NA entries in the mean of the passenger age and only take 
#    the mean of the ages recorded.  That seems to me to be as valid as imputing an average age on 
#    those missing.  It would be interesting to see the mean of those present and the total mean with 
#    the average replacing the NA.  Wait!  That’s what we did!  We first computed the mean without the 
#    NA entries, then inserted that into the NA places in the data.
#
# Place NA in the boat column if there is no boat ID
titanic$boat <- sub("^$", "NA", titanic$boat)

# Refactor the values
titanic$boat=as.factor(titanic$boat)

# Add a new column to indicate 1 for cabin number and 0 for no cabin number
titanic$has_cabin_number <- as.factor(ifelse(titanic$cabin=="", 0, 1))

# Write cleaned file to titanic.csv
write.csv(titanic, file = "L:/MyDocuments/Data Science/Data Wrangling 2/titanic_clean.csv")
