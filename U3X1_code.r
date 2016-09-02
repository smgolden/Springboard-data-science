# Using R to clean up the refine_original.csv data set
# Data Science Unit 3: Exercise 1
# Stephen Golden 2016 08 30
#

# Read refine_original.csv into a data frame
my_refine <- read.csv("refine_original.csv") 

# Company Name clean-up
my_refine$company[my_refine$company=="phillips"] <- "Phillips" 
my_refine$company[my_refine$company=="philips"] <- "Phillips" 
my_refine$company[my_refine$company=="phllips"] <- "Phillips" 
my_refine$company[my_refine$company=="phillps"] <- "Phillips" 
my_refine$company[my_refine$company=="fillips"] <- "Phillips" 
my_refine$company[my_refine$company=="phlips"] <- "Phillips" 
my_refine$company[my_refine$company=="akzo"] <- "Akzo" 
my_refine$company[my_refine$company=="akz0"] <- "Akzo" 
my_refine$company[my_refine$company=="AKZO"] <- "Akzo" 
my_refine$company[my_refine$company=="ak zo"] <- "Akzo" 
my_refine$company[my_refine$company=="van houten"] <- "Van Houten" 
my_refine$company[my_refine$company=="van Houten"] <- "Van Houten" 
my_refine$company[my_refine$company=="van houten"] <- "Van Houten" 
my_refine$company[my_refine$company=="unilever"] <- "Unilever" 
my_refine$company[my_refine$company=="unilver"] <- "Unilever" 

# Separate Product Code and Number
# Put column data into vector
colvector <- my_refine[,2]

# Substring the code-nums into individual vectors
codevector <- substr(colvector, 1, 1)
numvector <- substr(colvector, 3, 4)

# Create names for the new columns
my_refine["prod_code"] <- NA
my_refine["prod_num"] <- NA

# Add the vectors to the columns in the data frame
my_refine$prod_code <- codevector
my_refine$prod_num <- numvector

# Replace product codes with their product names
my_refine$prod_code[my_refine$prod_code=="p"] <- "Smartphone"
my_refine$prod_code[my_refine$prod_code=="v"] <- "TV"
my_refine$prod_code[my_refine$prod_code=="x"] <- "Laptop"
my_refine$prod_code[my_refine$prod_code=="q"] <- "Tablet"

# Make one address field
# Create a column for the new address field
my_refine["full_address"] <- NA

# Concatenate address fields into a single field
my_refine$full_address <- paste(my_refine $address, my_refine $city, my_refine $country, sep=", ")

# Create binary variable columns for Company
my_refine$company_phillips <- ifelse(my_refine$company=="Phillips", 1, 0)
my_refine$company_akzo <- ifelse(my_refine$company=="Akzo", 1, 0)
my_refine$company_van_houten <- ifelse(my_refine$company=="Van Houten", 1, 0)
my_refine$company_unilever <- ifelse(my_refine$company=="Unilever", 1, 0)

# Create binary variable columns for Product
my_refine$product_smartphone <- ifelse(my_refine$prod_code=="Smartphone", 1, 0)
my_refine$product_tv <- ifelse(my_refine$prod_code =="TV", 1, 0)
my_refine$product_laptop <- ifelse(my_refine$prod_code =="Laptop", 1, 0)
my_refine$product_tablet <- ifelse(my_refine$prod_code =="Tablet", 1, 0)

# Write the cleaned up data to a new .csv file
write.csv(my_refine, file = "refine_clean.csv")



