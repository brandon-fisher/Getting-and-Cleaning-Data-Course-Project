##    run_analysis.R does the following:
##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
##
## First the test and trial tables need to be joined with the y file being column[,1],
## the subject file being column[,2]
## and the X file representing all columns to the right
##

setwd("C:/Users/Brandon/Documents/R/Coursera/UCI HAR Dataset/test")
read_test_y_table <- read.table("Y_test.txt")
read_test_x_table <- read.table("X_test.txt")
read_test_subject_table <- read.table("subject_test.txt")

setwd("C:/Users/Brandon/Documents/R/Coursera/UCI HAR Dataset/train")
read_train_y_table <- read.table("Y_train.txt")
read_train_x_table <- read.table("X_train.txt")
read_train_subject_table <- read.table("subject_train.txt")

new_x_table <- rbind(read_test_x_table,read_train_x_table)
new_y_table <- rbind(read_test_y_table,read_train_y_table)
new_subject_table <- rbind(read_test_subject_table,read_train_subject_table)

final_y_table <- cbind(new_subject_table,new_y_table)

## once the tables are joined we have to add descriptive names & open the features file

names(final_y_table) <- c("subject","features")
setwd("C:/Users/Brandon/Documents/R/Coursera/UCI HAR Dataset")
read_features <- t(read.table("features.txt"))
names(new_x_table) <- c(read_features[2,])

## now that the names are added we bind the X and Y tables

final_table <- cbind(final_y_table,new_x_table)

## then we add the activity names based on the activity_id
## first we read the activity file

read_activity <- read.table("activity_labels.txt")

## then we join the names by id and once merged convert colnames to lowercase to allow for searching

labeled_table <- merge(read_activity,final_table,by.x = "V1",by.y = "features")
names(labeled_table) <- c("activity_id", "activity_name" , "subject_id" , tolower(read_features[2,]))

## now we return only columns associated with mean or standard deviation

only_mean_or_std <- sort(c(1,2,3,grep("mean()",colnames(labeled_table)),grep("std()",colnames(labeled_table))), decreasing = FALSE)
narrow_table <- labeled_table[,only_mean_or_std]

## in order to summarize you need to call the plyr package

require(plyr)

## then we can get averages by activity

activity_factor <- factor(narrow_table$activity_name)
activity_levels <- levels(activity_factor)
mean_by_activity <- as.data.frame(cbind(colnames(narrow_table[4:89]),ddply(narrow_table,c("activity_levels"), summarize, col_means <- colMeans(narrow_table[,4:89]))))

## or you can get averages by subject

subject_factor <- factor(narrow_table$subject_id)
subject_levels <- levels(subject_factor)
mean_by_subject <- as.data.frame(cbind(colnames(narrow_table[4:89]),ddply(narrow_table,c("subject_levels"), summarize, col_means <- colMeans(narrow_table[,4:89]))))