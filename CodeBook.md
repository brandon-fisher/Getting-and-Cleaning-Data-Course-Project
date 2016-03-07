## Mark-up file for run_analysis.R
##
## There are 17 data sets & 5 Values in run_analysis.R. Below is a description of the command followed in the next line by the command
##
## Data Sets (in order of usage):
##
## 1.) read_test_y_table reads the Y_test.txt file
##     read_test_y_table <- read.table("Y_test.txt")
##
## 2.) read_test_x_table  reads the X_test.txt file
##     read_test_x_table <- read.table("X_test.txt")
##     
## 3.) read_test_subject_table   reads the subject_test.txt file
##     read_test_subject_table <- read.table("subject_test.txt")
##     
## 4.) read_train_y_table  reads the Y_trial.txt file
##     read_train_y_table <- read.table("Y_train.txt")
##     
## 5.) read_train_x_table  reads the X_trial.txt file
##     read_train_x_table <- read.table("X_train.txt")
##     
## 6.) read_train_subject_table   reads the subject_trial.txt file
##     read_train_subject_table <- read.table("subject_train.txt")
##     
## 7.) new_x_table  binds the two x.txt files
##     new_x_table <- rbind(read_test_x_table,read_train_x_table)
##     
## 8.) new_y_table  binds the two y.txt files
##     new_y_table <- rbind(read_test_y_table,read_train_y_table)
##     
## 9.) new_subject_table  binds the two subject.txt files
##     new_subject_table <- rbind(read_test_subject_table,read_train_subject_table)
##     
## 10.) final_y_table  appends the new_y_table to include the subject.txt files
##     final_y_table <- cbind(new_subject_table,new_y_table)
##     
## 11.) read_features  reads the features.txt file
##     read_features <- t(read.table("features.txt"))
##     
## 12.) final_table  binds the new_x_table to the final_y_table
##     final_table <- cbind(final_y_table,new_x_table)
##     
## 13.) read_activity  reads the activity_labels.txt file
##     read_activity <- read.table("activity_labels.txt")
##     
## 14.) labeled_table  merges the read_activity and final_tables by the subject_id to return all column headers
##     labeled_table <- merge(read_activity,final_table,by.x = "V1",by.y = "features")
##     
## 15.) narrow_table  reduces the final_table to only columns for mean or standard deviation
##     narrow_table <- labeled_table[,only_mean_or_std]
##     
## 16.) mean_by_activity - returns the mean by feature by activity level
##     mean_by_activity <- as.data.frame(cbind(colnames(narrow_table[4:89]),ddply(narrow_table,c("activity_levels"), summarize, col_means <- colMeans(narrow_table[,4:89]))))
##     
## 17.) mean_by_subject - returns the mean by feature by subject level
##     mean_by_subject <- as.data.frame(cbind(colnames(narrow_table[4:89]),ddply(narrow_table,c("subject_levels"), summarize, col_means <- colMeans(narrow_table[,4:89]))))
##     
## 
##
## 4 Values (in order of usage):
##
## 1.) only_mean_or_std  exludes columns not referencing mean to standard deviation
##	only_mean_or_std <- sort(c(1,2,3,grep("mean()",colnames(labeled_table)),grep("std()",colnames(labeled_table))), decreasing = FALSE)
## 
## 2.) activity_factor  assigns factors to the activities
## 	activity_factor <- factor(narrow_table$activity_name)
## 
## 3.) activity_levels  assigns levels to the activities
## 	activity_levels <- levels(activity_factor)
## 
## 4.) subject_factor  assigns factors to the subjects
## 	subject_factor <- factor(narrow_table$subject_id)
## 
## 5.) subject_levels  assigns levels to the subjects
##	subject_levels <- levels(subject_factor)