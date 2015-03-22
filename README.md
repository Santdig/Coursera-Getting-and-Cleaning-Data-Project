# Getting and Cleaning Data Course Project

## Description

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called ```CodeBook.md```. You should also include a ```README.md``` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
each activity and each subject.

## Dataset files

1. ```README.txt```
2. ```features_info.txt```: Shows information about the variables used on the feature vector.
3. ```features.txt```: List of all features.
4. ```activity_labels.txt```: Links the class labels with their activity name.
5. ```train/X_train.txt```: Training set.
6. ```train/y_train.txt```: Training labels.
7. ```test/X_test.txt```: Test set.
8. ```test/y_test.txt```: Test labels.
9. ```train/subject_train.txt```: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Repository files

1. ```README.md```: This file.
2. ```CodeBook.md```: Describes the variables, the data, and any transformations or work that you performed to clean up the data.
3. ```run_analysis.R```: Script for performing the analysis and preparing tidy dataset

## Steps to work on this project

1. Download and unzip the data source files and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
2. Put run_analysis.R in the parent folder of DataUCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
3. Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.
