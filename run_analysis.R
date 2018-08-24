## Load relevant packages
library(dplyr)


##----------------------------------------------------------------------------
## Download the data

## Create a variable for zip folder of data
zipFolder <- "UCI HAR Dataset.zip"

## Download zip folder from internet (if not already downloaded)
if(!file.exists(zipFolder)){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipFolder, mode = "wb")
}

## Create a variable for the path to the folder of data
folderPath <- "UCI HAR Dataset"

## Unzip folder and create directory (if not alread unzipped and created)
if(!file.exists(folderPath)){
        unzip(zipFolder)
}


##----------------------------------------------------------------------------
## Read the data into R

## Read in the activity labels and give the variables names
activityLabels <- read.table(file.path(folderPath, "activity_labels.txt"))
names(activityLabels) <- c("activityID", "activity")

## Read in the features
## Don't convert to factors as these will be column headings and are not unique
features <- read.table(file.path(folderPath, "features.txt"), as.is = TRUE)

## Read in training data
trainingSubjects <- read.table(file.path(folderPath, "train", "subject_train.txt"))
trainingSet <- read.table(file.path(folderPath, "train", "X_train.txt"))
trainingLabels <- read.table(file.path(folderPath, "train", "y_train.txt"))

## Read in the test data
testSubjects <- read.table(file.path(folderPath, "test", "subject_test.txt"))
testSet <- read.table(file.path(folderPath, "test", "X_test.txt"))
testLabels <- read.table(file.path(folderPath, "test", "y_test.txt"))


##----------------------------------------------------------------------------
## Merge the training and test data sets into one data set

## Merge all of the training and all of the test sets of data
trainingData <- cbind(trainingSubjects, trainingSet, trainingLabels)
testData <- cbind(testSubjects, testSet, testLabels)
mergedData <- rbind(trainingData, testData)

## Give the new data set column headings
colnames(mergedData) <- c("subject", features[,2], "activity")

## Remove the individual data sets to save memory
rm(trainingSubjects, trainingSet, trainingLabels, trainingData, testSubjects, testSet, testLabels, testData)


##----------------------------------------------------------------------------
## Extract relevant measurements (mean, standard deviation)

## Check which columns contain values of mean or standard deviation
keepCol <- grepl(("subject|activity|mean|std"), colnames(mergedData))

## Extract the relevant columns and save over the data frame
mergedData <- mergedData[, keepCol]


##----------------------------------------------------------------------------
## Name the activities in the data set

## Convert the activity labels into descriptive activity names
mergedData$activity <- factor(mergedData$activity, activityLabels$activityID, activityLabels$activity)


##----------------------------------------------------------------------------
## Appropriately label the data set

## Remove an punctuation from the column names
colnames(mergedData) <- gsub("[[:punct:]]", "", colnames(mergedData))

## Expand on any abbreviations and capitalise first letter of each element
colnames(mergedData) <- gsub("^t", "timeDomain", colnames(mergedData))
colnames(mergedData) <- gsub("^f", "frequencyDomain", colnames(mergedData))
colnames(mergedData) <- gsub("Acc", "Accelerometer", colnames(mergedData))
colnames(mergedData) <- gsub("Gyro", "Gyroscope", colnames(mergedData))
colnames(mergedData) <- gsub("mean", "Mean", colnames(mergedData))
colnames(mergedData) <- gsub("std", "Standard Deviation", colnames(mergedData))
colnames(mergedData) <- gsub("Mag", "Magnitude", colnames(mergedData))
colnames(mergedData) <- gsub("Freq", "Frequency", colnames(mergedData))

## Add spaces between words in the column names
colnames(mergedData) <- gsub("([a-z])([A-Z])", "\\1 \\2", colnames(mergedData))

## Remove words that are duplicated
colnames(mergedData) <- gsub("BodyBody", "Body", colnames(mergedData))


##----------------------------------------------------------------------------
## Create a new data set with the average of each variable for each activity and each subject

## Groub by subject and then activity; calculate the mean for each
mergedDataMeans <- mergedData %>%
        group_by(subject, activity)%>%
        summarise_each(funs(mean))

## Create a new txt file containing this tidy data
write.table(mergedDataMeans, "tidied_data.txt")