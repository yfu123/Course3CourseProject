## The raw data was downloaded on December 30, 2016 at 5:29PM
## The following files are unzipped and placed into a folder named "Raw Data"

## 1. activity_labels.txt
## 2. features.txt
## 3. subject_test.txt
## 4. subject_train.txt
## 5. X_test.txt
## 6. X_train.txt
## 7. y_test.txt
## 8. y_train.txt

## A detailed description of each file can be found in README_Original.txt

## The following script will merge the 8 files and create one Tidy Dataset

## Step 1 - Load the 8 files
activity_labels <- read.table("./Raw Data/activity_labels.txt")
features <- read.table("./Raw Data/features.txt")
subject_test <- read.table("./Raw Data/subject_test.txt")
subject_train <- read.table("./Raw Data/subject_train.txt")
test_data <- read.table("./Raw Data/X_test.txt")
train_data <- read.table("./Raw Data/X_train.txt")
activity_test <- read.table("./Raw Data/y_test.txt")
activity_train <- read.table("./Raw Data/y_train.txt")

## Step 2 - Identify columns to be extracted
features$Extract <- grepl("mean\\(\\)",features$V2) | grepl("std\\(\\)",features$V2)
extractCol <- features[features$Extract,1]

## Step 3 - Merge the test and train dataset, just the mean and standard deviation columns, give the merged dataset column names
TidyData <- rbind(test_data[,extractCol], train_data[,extractCol])
colnames(TidyData) <- features[features$Extract,2]

## Step 4 - Add in subject and activity columns
activity_test <- merge(activity_test, activity_labels, by = "V1")
activity_train <- merge(activity_train, activity_labels, by = "V1")

TidyData <- cbind(rbind(activity_test, activity_train), rbind(subject_test, subject_train), TidyData)
colnames(TidyData)[1:3] <- c("activityCode", "activityLabel", "subjectCode")

## Step 5 - Create a second, independent tidy data set with average of each variable for each activity and each subject
library(plyr)
myColMean <- function(df) colMeans(df[,4:69])
TidyData_means <- ddply(TidyData, c("activityLabel", "subjectCode"), myColMean)

## Step 6 - Export results to two output files
write.table(TidyData, file = "./Tidy Dataset/TidyData.txt")
write.table(TidyData_means, file = "./Tidy Dataset/TidyData_means.txt")
