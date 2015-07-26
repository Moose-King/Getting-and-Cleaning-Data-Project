# Introduction

The purpose of this project (from the Coursera - John Hopkin's Data Science Specialization Course) is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The task at hand is to create one R script called run_analysis.R that does the following:

a. Merges the training and the test sets to create one data set.

b. Extracts only the measurements on the mean and standard deviation for each measurement. 

c. Uses descriptive activity names to name the activities in the data set

d. Appropriately labels the data set with descriptive variable names. 

e. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Walk-through of how I collected, worked with, and cleaned the Samsung Galaxy S smartphone accelerometer data set

## Download the Samsung Galaxy S smartphone data for this project
```{r}
if(!file.exists("UCI HAR Dataset.zip")){
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
```

## Load the reshape library we'll be using
```{r}
library(reshape2)
```

## Set up Training data
### load the training data sets for this assignment
```{r}
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "",header = F)
```
### add/create a new column for the y_train data to our training data
```{r}
training[,562] <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "",header = F)
```
### add/create another column for Subjects to add to our training dataset
```{r}
training[,563] <-read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "",header = F)
```

## Set up Test data
### load the test data sets for this assignment
```{r}
test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "",header = F)
```
### add/create a new column for the y_train data to our test data
```{r}
test[,562] <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "",header = F)
```
### add/create another column for Subjects to add to our test dataset
```{r}
test[,563] <-read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "",header = F)
```

## Set up Activity data
### load data for activity labels
```{r}
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "",header = F)
```
### the activity names 
```{r}
activityLabels[,2] <- as.character(activityLabels[,2])
```

## Set up Feature data
### load data for the features
```{r}
features <- read.csv("UCI HAR Dataset/features.txt", sep = "",header = F)
```
### feature names
```{r}
features[,2] <- as.character(features[,2])
```
### substitute labels for easier reading
```{r}
features[,2] <- gsub("-mean","Mean", features[,2])
features[,2] <- gsub("-std","Std", features[,2])
features[,2] <- gsub("[-()]","", features[,2])
```

## Clean and Set up "new" data
### merge the "training" and "test" data sets to create one new data set
```{r}
oneData <- rbind(training,test)
```
### set up for the extraction of only the measurements for mean and standard deviations
```{r}
extractedFeatures <- grep(".*Mean.*|.*Std.*", features[,2])
```
### add the subject and activity columns
```{r}
features <- features[extractedFeatures,]
extractedFeatures <- c(extractedFeatures, 562,563)
```
## extract only the measurements we want
```{r}
oneData <- oneData[,extractedFeatures]
```
## make column names more readable
```{r}
colnames(oneData) <- c("Subject","Activity", features[,2])
```

## make activities and subjects into factors we can work with
```{r}
oneData$Activity <- factor(oneData$Activity, levels = activityLabels[,1], labels = activityLabels[,2])

oneData$Subject <- as.factor(oneData$Subject)

Activity <- oneData$Activity
Subject <- oneData$Subject
```

## create an independent tidy data set with averages of each variable for each subject
```{r}
oneDataMelted <- melt(oneData, id.vars = c("Subject", "Activity"))
oneDataMeltedMean <- dcast(oneDataMelted, Subject + Activity ~ variable, mean)
```

## store the results in neat text file "tidy.txt"
```{r}
write.table(oneDataMeltedMean, "tidy.txt", row.names = F, quote = F, sep = "\t", na="")
```
#### Give yourself a pat on the back.
