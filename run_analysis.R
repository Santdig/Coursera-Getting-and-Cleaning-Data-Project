## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for 
##    each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.

if (!require(dplyr)) {
        install.packages("dplyr")
}

if (!require(data.table)) {
        install.packages("data.table")
}

if (!require(reshape2)) {
        install.packages("reshape2")
}

library(dplyr)
library(data.table)
library(reshape2)

if(file.exists("./dataSets")) {
 setwd("./")
} else {
        dir.create("./dataSets")
        fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="./dataSets/zipfile.zip",method="curl")
        setwd("./")
        unzip("./dataSets/zipfile.zip", files = NULL, list = FALSE, overwrite = TRUE,
              junkpaths = FALSE, exdir = "./dataSets", unzip = "internal",
              setTimes = FALSE)
}

## Load all required data files
featuresData<-read.table("./dataSets/UCI HAR Dataset/features.txt")
activityLabelsData<-read.table("./dataSets/UCI HAR Dataset/activity_labels.txt")

Ytrain<-read.table("./dataSets/UCI HAR Dataset/train/y_train.txt")
Xtrain<-read.table("./dataSets/UCI HAR Dataset/train/X_train.txt")
Subjecttrain<-read.table("./dataSets/UCI HAR Dataset/train/subject_train.txt")

Ytest<-read.table("./dataSets/UCI HAR Dataset/test/y_test.txt")
Xtest<-read.table("./dataSets/UCI HAR Dataset/test/X_test.txt")
Subjecttest<-read.table("./dataSets/UCI HAR Dataset/test/subject_test.txt")

features <- featuresData[, 2]
activityLabels <- activityLabelsData[, 2]

## Extracts only the measurements on the mean and standard deviation 
## for each measurement
Subfeatures <- grepl("mean|std", features)
names(Xtest) <- features
Xtest = Xtest[, Subfeatures]

## Assign activity labels ti Y_test activities
Ytest[, 2] <- activityLabels[Ytest[, 1]]
names(Ytest) <- c("Activity_ID", "Activity_Label")
names(Subjecttest) <- "subject"

## Combine subject, Y, and X test variables
testData <- cbind(Subjecttest, Ytest, Xtest)

## Extracts only the measurements on the mean and standard deviation 
## for each measurement
names(Xtrain) <- features
Xtrain <- Xtrain[, Subfeatures]

## Assign activity labels ti Y_train activities
Ytrain[, 2] <- activityLabels[Ytrain[, 1]]
names(Ytrain) <- c("Activity_ID", "Activity_Label")
names(Subjecttrain) <- "subject"

## Combine subject, Y, and X train variables
trainData <- cbind(Subjecttrain, Ytrain, Xtrain)

## Merge test and train data
mergedData = rbind(testData, trainData)

## Remove working data frames
rm(Ytrain, Xtrain, Ytest, Xtest, trainData, testData)

idLabels <- c("subject", "Activity_ID", "Activity_Label")
mergeddataLabels <- setdiff(colnames(mergedData), id_labels)
meltData <- melt(mergedData, id = idLabels, measure.vars = mergeddataLabels)

## Apply mean function to merged data set using dcast function
tidyData <- dcast(meltData, subject + Activity_Label ~ variable, mean)

## Write tidy dataset to a text file
write.table(tidyData, file = "./tidy_data.txt")