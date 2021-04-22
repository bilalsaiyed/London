# Question 1
# File downloaded from Blackboard and inserted into data frame
# Replaced the missing content with NA
london_crime <- read.csv("london-crime-data.csv", na = "")
# View the structure of the data frame
str(london_crime)
# Amalgamating month and year to Date variable
london_crime$Date <- paste("01", london_crime$month, london_crime$year, sep='/')
str(london_crime)


# Question 2
# Showing the column names and renaming them
names(london_crime)
names(london_crime)[2] <- "Borough"
names(london_crime)[3] <- "MajorCategory"
names(london_crime)[4] <- "SubCategory"
names(london_crime)[5] <- "Value"
names(london_crime)[8] <- "CrimeDate"
names(london_crime)

#Including the given categories
london_crime <- london_crime[c("Borough", "MajorCategory", "SubCategory",
                               "Value",  "CrimeDate")]
# Viewing the structure of the data frame
str(london_crime)

# Question 3
#Converting the format of CrimeDate variable to Date format
london_crime$CrimeDate <- as.Date(london_crime$CrimeDate, "%d/%m/%Y")
str(london_crime)

# Question 4
#Ploting the Borough info
attach(london_crime)
display_settings <- par(no.readonly = TRUE)
#Factoring the char variable to plot
Borough <- factor(Borough)
plot(Borough, main="Crime Status", xlab="Borough", ylab="Count")
# Showing the summary of Borough
summary(Borough)

# The Borough which has the highest level of crime is "Croyodon"
# The area which has the lowest level of crime is "City of London"

# Question 5

summary(MajorCategory)
# Defing the x and labels for pie chart
x <- c(9082, 17727, 10313, 2140, 6737, 8025, 917, 33759, 27347)
labels <- c("Burglary", "Criminal Damage", "Drugs", "Fraud or Forgery", 
            "Other Notifiable Offences", "Robbery", "Sexual Offences",
            "Theft and Handling", "Violence Against the Person")


# Plotting the pie chart
pie(x,labels)

# "Theft and Handling" category had the highest level of crimes
# "Sexual Offences" category had the lowest level of crimes


# Question 6
# Categorising the Boroughs into different regions based on the question
london_crime$Region[london_crime$Borough == "Barking and Dagenham"|london_crime$Borough =="Bexley"|
                    london_crime$Borough == "Greenwich"|london_crime$Borough =="Havering"|
                    london_crime$Borough == "Kingston upon Thames"|london_crime$Borough =="Newham"|
                    london_crime$Borough == "Redbridge"|london_crime$Borough =="Wandsworth"] <- "East"

london_crime$Region[london_crime$Borough == "Barnet"|london_crime$Borough =="Camden"|
                      london_crime$Borough == "Enfield"|london_crime$Borough =="Hackney"|
                      london_crime$Borough == "Haringey"] <- "North"

london_crime$Region[london_crime$Borough == "Bromley"|london_crime$Borough =="Croydon"|
                      london_crime$Borough == "Merton"|london_crime$Borough =="Sutton"] <- "South"

london_crime$Region[london_crime$Borough == "Islington"|london_crime$Borough =="Kensington and Chelsea"|
                      london_crime$Borough == "Lambeth"|london_crime$Borough =="Lewisham"|
                      london_crime$Borough == "Southwark"|london_crime$Borough =="Tower Hamlets"|
                      london_crime$Borough == "Waltham Forest"|london_crime$Borough =="Westminster"] <- "Central"

london_crime$Region[london_crime$Borough == "Brent"|london_crime$Borough =="Ealing"|
                      london_crime$Borough == "Hammersmith and Fulham"|london_crime$Borough =="Harrow"|
                      london_crime$Borough == "Hillingdon"|london_crime$Borough =="Hounslow"|
                      london_crime$Borough == "Richmond upon Thames"] <- "West"

# Finding the missing data in newly created Region variable
missing_data <- london_crime[!complete.cases(london_crime$Region),]
missing_data

library(VIM)
missing_values <- aggr(london_crime, prop = FALSE, numbers = TRUE)
# Show summary of the contents of missing_values
summary(missing_values)

# Using the above method it is clear that there is no missing data in any of the columns after adding "Region"


# Question 7
# Plotting the graph for Regions
attach(london_crime)
display_settings <- par(no.readonly = TRUE)
Region <- factor(Region)
plot(Region, main="Crime Status in Different Regions", xlab="Region", ylab="Count")
summary(Region)

# Central region had the highest number of crimes with the count as 28505
# South region had the lowest number of crimes with the count as 15487

# Question 8
# Using the subset function to extract all records where Region = Central and South
london_crime_subset <- subset(london_crime, Region == "Central" | Region == "South",)
london_crime_subset

# Looking at the data it is clear that Violence against the Person is the major crime

# Question 9:
# Plotting the summary function
summary(london_crime)


# Question 10:
# Saving the modified DF with the new name
write.csv(london_crime, file = "london-crime-modified.csv")






