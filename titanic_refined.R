library(readr)
library(dplyr)
library(tidyr)


titanic_original <- read_csv("C:/Users/heath/Desktop/springboard coursework/project2/titanic_original.csv")
View(titanic_original)

titanic_original <- as.data.frame(titanic_original)

#port of embarkation: replace missing values with "S" 

titanic_original$embarked[is.na(titanic_original$embarked)] <- "S"

#Age: Use mean age to populate missing values

mean_age <- mean(titanic_original$age, na.rm = TRUE)

titanic_original$age[is.na(titanic_original$age)] <- mean_age

#Lifeboats: fill missing values with a dummy value to represent passengers who did not board a lifeboat

titanic_original$boat[is.na(titanic_original$boat)] <- "NA"

#cabin: Does cabin number correlate to survival? Add a binary 
#Create a new column has_cabin_number which has a 1 if there is an assigned cabin, 0 if no assigned cabin

titanic_original <- mutate(titanic_original, has_cabin_number = ifelse(is.na(cabin), 0, 1))

titanic_clean <- titanic_original

titanic_clean

write_excel_csv(titanic_clean, path = "titanic_clean.csv", na = "NA", append = FALSE)


