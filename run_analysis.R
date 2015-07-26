##Downloading the Samsung Galaxy S smartphone data 
if(!file.exists("UCI HAR Dataset.zip")){
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
## load reshape2 library
library(reshape2)

##Training data
## loading the training data sets for this assignment
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "",header = F)
## adding/creating a new column for the y_train data to our training data
training[,562] <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "",header = F)
## adding/creating another column for Subjects to add to our training dataset
training[,563] <-read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "",header = F)

##Test data
## loading the test data sets for this assignment
test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "",header = F)
## adding/creating a new column for the y_train data to our test data
test[,562] <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "",header = F)
## adding/creating another column for Subjects to add to our test dataset
test[,563] <-read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "",header = F)

## loading data for activity labels
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "",header = F)

## activity names 
activityLabels[,2] <- as.character(activityLabels[,2])

## loading data for the features
features <- read.csv("UCI HAR Dataset/features.txt", sep = "",header = F)

## feature names
features[,2] <- as.character(features[,2])

## substituting labels for easier reading
features[,2] <- gsub("-mean","Mean", features[,2])
features[,2] <- gsub("-std","Std", features[,2])
features[,2] <- gsub("[-()]","", features[,2])

## merging the training and test sets to create one data set
oneData <- rbind(training,test)

## for extracting only measurements for mean and standard deviations
extractedFeatures <- grep(".*Mean.*|.*Std.*", features[,2])

## adding the subject and activity columns
features <- features[extractedFeatures,]
extractedFeatures <- c(extractedFeatures, 562,563)

## extracting only measurements we want
oneData <- oneData[,extractedFeatures]

## making column names more readable
colnames(oneData) <- c("Subject","Activity", features[,2])

## making activities and subjects into factors we can work with
oneData$Activity <- factor(oneData$Activity, levels = activityLabels[,1], labels = activityLabels[,2])
Activity <- oneData$Activity
oneData$Subject <- as.factor(oneData$Subject)
Subject <- oneData$Subject

## creating an independent tidy data set with averages of each variable for each subject
oneDataMelted <- melt(oneData, id.vars = c("Subject", "Activity"))
oneDataMeltedMean <- dcast(oneDataMelted, Subject + Activity ~ variable, mean)

## storing the results in neat "tidy.txt" file
write.table(oneDataMeltedMean, "tidy.txt", row.names = F, quote = F, sep = "\t")

 
## I shed a single tear of joy when I first saw my tidy.txt
## This is where it is customary to stand up and slow clap. 
