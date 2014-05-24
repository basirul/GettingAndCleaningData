## Getting and Cleaning Data Course Project

To implement this project, we need Raw Data and Data Clean-Up Processing Script

* Raw Data: This is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* Script: The script is run_analysis.R and is available in this repo

We need to unzip the files at the working directory of the R environment. The .R script also needs to be there in the working directory.

The .R script (run_analysis.R) does the following. More technical information are available in the CodeBook.md

1. Merges the training (under "UCI HAR Dataset/train") and the test (under "UCI HAR Dataset/test") sets data to create one data set. We have ignored data files under "Inertial Signals" in both cases.
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Labels the Column Names as user-friendly labels the data set with descriptive activity names

At the ned of the processes, we are creating independent tidy data set with the average of each variable for each subject and each activity

The Tidy Data set SubjectActivity_Average.csv is available in this repo.


