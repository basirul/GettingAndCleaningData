## run_analysis.R Variable Explanation

### Step 1
### Merges the training and the test sets to create one data set

* subfolder.train -> Contains 3 file names (no sub directory) under "UCI HAR Dataset/train"
* subfolder.test -> Contains 3 file names (no sub directory) under "UCI HAR Dataset/test"
* list.data.train -> Contains data of 3 files subject_train.txt, X_train.txt & y_train.txt
* list.data.test -> Contains data of 3 files subject_test.txt, X_test.txt & y_test.txt
* combined.data.train -> Contains data combining all 3 files of list.data.train as Columns
* combined.data.test -> Contains data combining all 3 files of list.data.test as Columns
* merged.data -> Contains data combining combined.data.train and combined.data.test as Rows

At this point, we have merged all the data into a single data frame (merged.data)


### Step 2
### Extracts only the measurements on the mean and standard deviation for each measurement

* measurements.data -> Contains data from 'UCI HAR Dataset/features.txt'
* measurements.meanStd.ids -> Contains all the ids of measurements describing "std" or "mean" type
* measurements.meanStd.names -> Contains all the names of measurements describing "std" or "mean" type
* merged.data.meanStd -> Contains data extracted from original merged.data having Subject, Activity and the measurements of "std"/"mean" type obtaind through measurements.meanStd.ids

At this point, we have merged data having measurements describing "std" or "mean" type


### Step 3
### Uses descriptive activity names to name the activities in the data set

* activities.data -> Contains data from 'UCI HAR Dataset/activity_labels.txt'
* activities.ids -> Contains all the activities ids
* activities.names -> Contains all the activities names

After this, we have replaced the activitiy id with the corresponding description.


### Step 4
### Appropriately labels the data set with descriptive activity names

No new variables are defined in this section, only following operation are performed
* We have changed (e.g. "tBodyAcc-mean()-X" to "tBodyAcc.mean().X") for better column name
* We have labeled Subject and Activity with the proper Column names


### Step 5
### Creates a second, independent tidy data set with the average of 
###      each variable for each activity and each subject

No new variables are defined in this section, only following operation are performed
* We have generated new data set to have mean for each Subject and Activity
* We had to rename the 'Subject' & 'Activity' Column Names as they are modifed by the above operation
* Write this tidy data into a text file

