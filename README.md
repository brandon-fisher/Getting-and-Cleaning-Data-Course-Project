# Getting-and-Cleaning-Data-Course-Project
# These are the submissions for the Getting and Cleaning Data Course Project from Cousera
#
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article .
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained:
#
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Here are the data for the project:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#    run_analysis.R is the code that creates the tidy dataset. It can be found in this repo.
# 
#    run_analysis.R does the following:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# There are 17 data sets & 5 Values each of which is described in the CodeBook.md file
#
# Data Sets (in order of usage):
# 1.) read_test_y_table <- reads the Y_test.txt file
# 2.) read_test_x_table <- reads the X_test.txt file
# 3.) read_test_subject_table  <- reads the subject_test.txt file
# 4.) read_train_y_table <- reads the Y_trial.txt file
# 5.) read_train_x_table <- reads the X_trial.txt file
# 6.) read_train_subject_table  <- reads the subject_trial.txt file
# 7.) new_x_table <- binds the two x.txt files
# 8.) new_y_table <- binds the two y.txt files
# 9.) new_subject_table <- binds the two subject.txt files
# 10.) final_y_table <- appends the new_y_table to include the subject.txt files
# 11.) read_features <- reads the features.txt file
# 12.) final_table <- binds the new_x_table to the final_y_table
# 13.) read_activity <- reads the activity_labels.txt file
# 14.) labeled_table <- merges the read_activity and final_tables by the subject_id to return all column headers
# 15.) narrow_table <- reduces the final_table to only columns for mean or standard deviation
# 16.) mean_by_activity - returns the mean by feature by activity level
# 17.) mean_by_subject - returns the mean by feature by subject level
# 
# 4 Values (in order of usage):
# 1.) only_mean_or_std <- exludes columns not referencing mean to standard deviation
# 2.) activity_factor <- assigns factors to the activities
# 3.) activity_levels <- assigns levels to the activities
# 4.) subject_factor <- assigns factors to the subjects
# 5.) subject_levels <- assigns levels to the subjects
