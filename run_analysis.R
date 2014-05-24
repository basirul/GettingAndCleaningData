# Step 1
# Merges the training and the test sets to create one data set

subfolder.train <- dir('UCI HAR Dataset/train')[-1]
subfolder.test  <- dir('UCI HAR Dataset/test')[-1]

list.data.train <- lapply(as.list(subfolder.train), 
                     function(x) 
                     read.table(paste0(getwd(),'/UCI HAR Dataset/train/',x)))
list.data.test  <- lapply(as.list(subfolder.test),
                     function(y)
                     read.table(paste0(getwd(),'/UCI HAR Dataset/test/',y)))

combined.data.train <- cbind(list.data.train[[1]],
                             list.data.train[[3]],
                             list.data.train[[2]])
combined.data.test  <- cbind(list.data.test[[1]],
                             list.data.test[[3]],
                             list.data.test[[2]])

merged.data <- rbind(combined.data.train , combined.data.test)


# Step 2
# Extracts only the measurements on the mean and standard deviation for each measurement

measurements.data          <- read.table('UCI HAR Dataset/features.txt')
measurements.meanStd.ids   <- grep("std|mean", 
                                   tolower(measurements.data[, 2]))
measurements.meanStd.names <- grep("std|mean",
                                   tolower(measurements.data[, 2]), value=TRUE)

merged.data.meanStd <- merged.data[c(1:2, measurements.meanStd.ids + 2)]


# Step 3
# Uses descriptive activity names to name the activities in the data set

activities.data  <- read.table('UCI HAR Dataset/activity_labels.txt')
activities.ids   <- activities.data[, 1]
activities.names <- activities.data[, 2]

for (i in 1:length(activities.ids)) {
  merged.data.meanStd[, 2] <- gsub(activities.ids[i],
                                   activities.names[i],
                                   merged.data.meanStd[, 2])
}

# Step 4
# Appropriately labels the data set with descriptive activity names

measurements.meanStd.names <- gsub("-", ".", measurements.meanStd.names)
colnames(merged.data.meanStd) <- c('Subject',
                                   'Activity',
                                   measurements.meanStd.names)


# Step 5
# Creates a second, independent tidy data set with the average of 
#      each variable for each activity and each subject

SubjectActivity.average <- aggregate.data.frame(merged.data.meanStd,
                             list(merged.data.meanStd$Subject,
                                  merged.data.meanStd$Activity), 
                             mean)[, c(-3, -4)]
colnames(SubjectActivity.average)[1:2] <- c('Subject', 'Activity')

write.csv(SubjectActivity.average, "SubjectActivity_Average.txt")

