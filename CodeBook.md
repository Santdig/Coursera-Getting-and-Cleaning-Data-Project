# CodeBook
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source

The raw data for this project is accelerometer data collected from the Samsung Galaxy S smartphone, and was provided to us at the links below:

Data file: ```https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip```
CodeBook: ```http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones```
This data included both the raw sampled data (folder ../Inertial Signals) and features apparently based on the raw data. For the purpose of this project, I am only looking at the features, not the raw data.

There are 3 types of files:

```X```: rows of feature measurements
```Y```: the activity labels corresponding to each row of X. Encoded as numbers.
```subject```: the subjects on which each row of X was measured. Encoded as numbers.
In addition, to determine which features are required, we look at the list of features:```features.txt```
The encoding from activity labels ids to descriptive names:```activity_labels.txt```

## Get the data
1. Download the file and put the file in the data folder
2. Unzip the file
3. Unzipped files are in the folderUCI HAR Dataset. Get the list of the files
4. See the README.txt file for the detailed information on the dataset. For the purposes of this project, the files in the Inertial Signals folders are not used. The files that will be used to load data are listed as follows:

* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

```
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./dataSets/zipfile.zip",method="curl")
```

## Read data from the targeted files
From the picture and the related files, we can see:

Values of Varible Activity consist of data from ```Y_train.txt``` and ```Y_test.txt```
values of Varible Subject consist of data from ```subject_train.txt``` and ```subject_test.txt```
Values of Varibles Features consist of data from ```X_train.txt``` and ```X_test.txt```
Names of Varibles Features come from ```features.txt```
levels of Varible Activity come from ```activity_labels.txt```
So we will use Activity, Subject and Features as part of descriptive variable names for data in data frame.

```
testData <- cbind(Subjecttest, Ytest, Xtest)
trainData <- cbind(Subjecttrain, Ytrain, Xtrain)
```

## Transformations
1. Extracts only the measurements on the mean and standard deviation for each measurement.
   ```Subfeatures <- grepl("mean|std", features)```
2. Uses descriptive activity names to name the activities in the data set.
   ```Ytest[, 2] <- activityLabels[Ytest[, 1]]```
3. Appropriately labels the data set with descriptive variable names.
   ```
   names(Xtest) <- features
   names(Ytest) <- c("Activity_ID", "Activity_Label")
   names(Subjecttest) <- "subject"
   ```
4. Merges the training and the test sets to create one data set.
   ```
   mergedData = rbind(testData, trainData)
   ```
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   ```
   write.table(tidyData, file = "./tidyset_meanBySubjectandActivity.txt", row.name = FALSE)
   ```
