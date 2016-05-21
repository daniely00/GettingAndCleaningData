# Getting and cleaning data
# Week 4 Assingment

#Load required package(s)
library(reshape2)

# Download zip-file to wd
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "getdata_dataset.zip")

# Unzip zip-file in wd
filePath <- getwd()
unzip(paste0(filePath, "/getdata_dataset.zip"))

# Read activity labels and rename columns
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = 
                                     c("activity_id", "activity_name"))

# Subset mean and std when reading data
features <- read.table("UCI HAR Dataset/features.txt")
features2 <- as.character(features[, 2])
grepFeatures <- grep(".*mean.*|.*std.*", features2)
# Read features i.e. column names
features3 <- features[grepFeatures, 2]
features3 = gsub('-mean', 'Mean', features3)
features3 = gsub('-std', 'Std', features3)
features3 <- gsub('[-()]', '', features3)

# Read train data
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")[grepFeatures]

# Read test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt")[grepFeatures]

# Read train activity id
trainActivity <- read.table("UCI HAR Dataset/train/Y_train.txt")

# Read test activity id
testActivity <- read.table("UCI HAR Dataset/test/Y_test.txt")

# Read train subject id
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test subject id
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge subject id, activity id and data
trainDf <- cbind(trainSubject, trainActivity, trainData)
testDf <- cbind(testSubject, testActivity, testData)

# Merge trainDf and testDf into one data frame
allData <- rbind(trainDf, testDf)
colnames(allData) <- c("subject_id", "activity_id", features3)

# Change activity & subject into factors
allData$activity_id <- factor(allData$activity_id, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject_id <- as.factor(allData$subject_id)

allData.melted <- melt(allData, id = c("subject_id", "activity_id"))
allData.mean <- dcast(allData.melted, subject_id + activity_id ~ variable, mean)

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)