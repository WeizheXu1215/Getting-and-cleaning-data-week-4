
##Merge the traning and testing datasets

# set work directory & library packages
setwd('/Users/xuweizhe/Desktop/Coursera R/3. Getting and cleaning data/Getting-and-cleaning-data-week-4-project/UCI HAR Dataset')
library(dplyr)



# Read training data into R
features <- read.table('features.txt')

activityLablels <- read.table('activity_labels.txt', col.names = c('activityID','activityType'))

subjectTrain <- read.table('train/subject_train.txt', col.names = "subjectID")

xTrain <- read.table('train/X_train.txt',col.names = features[,2])

yTrain <- read.table('train/y_train.txt',col.names = "activityID")


# Merge the training data
training <- cbind(yTrain, subjectTrain, xTrain)


# Read teat data into R
subjectTest <- read.table('test/subject_test.txt', col.names = "subjectID")

xTest <- read.table('test/X_test.txt', col.names = features[,2])

yTest <- read.table('test/y_test.txt', col.names = "activityID")


# Merge the test data
testing <- cbind(yTest, subjectTest, xTest)

# Merge the training and test dataset
data <- rbind(training, testing)

# create column name vector
col_name <- colnames(data)



## Subsetting the data set

# Create a vector that identifies the mean and std columns
col_name2 <- (grepl("activity..",col_name) | grepl("subject..",col_name) | grepl("*mean..",col_name) &
                !grepl("*meanFreq..",col_name)| 
                grepl("*std..",col_name))

data <- data[col_name2 == TRUE]

## Merge the dataset with activity labels
data <- merge(activityLablels, data, by = 'activityID', all.y = TRUE)




## tidy the column names
columns <- colnames(data)


for (i in 1:length(columns)) 
{
  columns[i] <- gsub("\\()","",columns[i])
  columns[i] <- gsub("*std","StdDev",columns[i])
  columns[i] <- gsub("*mean","Mean",columns[i])
  columns[i] <- gsub("^(t)","time",columns[i])
  columns[i] <- gsub("^(f)","freq",columns[i])
  columns[i] <- gsub("([Gg]ravity)","Gravity",columns[i])
  columns[i] <- gsub("([Bb]ody)","Body",columns[i])
  columns[i] <- gsub("[Gg]yro","Gyro",columns[i])
  columns[i] <- gsub("AccMag","AccMagnitude",columns[i])
  columns[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",columns[i])
  columns[i] <- gsub("JerkMag","JerkMagnitude",columns[i])
  columns[i] <- gsub("GyroMag","GyroMagnitude",columns[i])
}

colnames(data) <- columns



## Create a tidy dataset

data <- data[,names(data) != 'activityType']
tidySet <- aggregate(. ~subjectID + activityID, data, mean)

setwd('/Users/xuweizhe/Desktop/Coursera R/3. Getting and cleaning data/Getting-and-cleaning-data-week-4-project')
# output
write.table(tidySet, "tidySet.txt", row.names = FALSE)


