### README

Getting and cleaning data - course
Week 4 Assignment: Getting and Cleaning Data Course Project


## Input files
1. features.txt: list of column names
2. activity_labels.txt: list of class labels and activity names
3. features_info.txt: contains information about features
4. X_train.txt: dataset
5. X_test.txt: dataset
6. Y_train.txt: contains labels
7. Y_test.txt: contains labels
8. subject_train.txt: contains ID
9. subject_test.txt: contains ID

## Output files
1. tidy.txt: tidy dataset (mean and std)
2. CodeBook.md: describes variables, steps in R script and more
3. run_analysis.R: R script described below
4. README.md: information about course project

## What run_analysis.R does:
1. Download data, unzip and read into R.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set.
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

