# Using R to clean up the refine_original.csv data set
# Data Science Unit 4: Titanic Code
# Stephen Golden 2016 09 14
#

# R code from the Titanic exercise in the ggplot2 tutorial
# Observe the structure of the dataset
str(titanic)

# Bar chart of passengers by class "dodged" by sex
ggplot(titanic, aes(x = factor(Pclass), fill = factor(Sex))) +
  geom_bar(position = "dodge")
  
# Similar bar chart separated by survived vs. did not survive
ggplot(titanic, aes(x = factor(Pclass), fill = factor(Sex))) +
  geom_bar(position = "dodge") +
  facet_grid(. ~ Survived)

# Survived vs. did not survive as jittered dots  
#  Note: the instruction said to set position = posn.j but said nothing
#        about defining posn.j as an object, nor that it had already been defined.  
#        I included the object definition in my code.  (The course considered it 
#        incorrect, even though it was correct, and it worked.)
posn.j <- position_jitter(0.5)
ggplot(titanic, aes(x = factor(Pclass), y = Age, col = factor(Sex))) +
  geom_jitter(size = 3, alpha = 0.5, position = posn.j) +
  facet_grid(. ~ Survived)

