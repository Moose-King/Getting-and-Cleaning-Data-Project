# Code Book for Getting and Cleaning Data Project

## So where did you get this data?

The data used in this project is from University of California Irving Machine Learning Repository. This data was collected from the accelerometers from the the Samsung Galaxy S smartphone. 

Here's a link to the data: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Woah ... What am I looking at here? This looks like jibberish!
Well that's why this code book exists. Now hold your horses and let me break this down for you (as best as I can). 

### In a nutshell, according to the site and the original owners of this dataset:

a. The experiments from which the data was gathered was carried our among a group   of 30 volunteers **("subjects")**

b. Each of these "subjects" performed six activities **("activity")** while wearing the accelerometers.This making up the activity labels.
Namely these activities were:
  1. WALKING (value 1)
  2. WALKING _UPSTAIRS (value 2)
  3. WALKING_DOWNSTAIRS (value 3)
  4. SITTING (value 4)
  5. STANDING (value 5)
  6. LAYING (value 6)

c. The dataset was randomly partitioned into two sets, where 70% of subjects were selected for generating the **("training")** data and the remaining 30% were to generate the **("test")** data.

d. the **("features")** measured in this data set (feel free to check out what each one corresponds to by following the link to the original data set) where: 

- tBodyAccMeanX - tBodyAccMeanY	
- tBodyAccMeanZ	
- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ	
- tGravityAccMeanX	
- tGravityAccMeanY	
- tGravityAccMeanZ	
- tGravityAccStdX	
- tGravityAccStdY	
- tGravityAccStdZ	
- tBodyAccJerkMeanX	
- tBodyAccJerkMeanY	
- tBodyAccJerkMeanZ	
- tBodyAccJerkStdX	
- tBodyAccJerkStdY	
- tBodyAccJerkStdZ	
- tBodyGyroMeanX	
- tBodyGyroMeanY	
- tBodyGyroMeanZ	
- tBodyGyroStdX	
- tBodyGyroStdY	
- tBodyGyroStdZ	
- tBodyGyroJerkMeanX	
- tBodyGyroJerkMeanY	
- tBodyGyroJerkMeanZ	
- tBodyGyroJerkStdX	
- tBodyGyroJerkStdY	
- tBodyGyroJerkStdZ	
- tBodyAccMagMean	
- tBodyAccMagStd	
- tGravityAccMagMean	
- tGravityAccMagStd	
- tBodyAccJerkMagMean	
- tBodyAccJerkMagStd	
- tBodyGyroMagMean	
- tBodyGyroMagStd	
- tBodyGyroJerkMagMean	
- tBodyGyroJerkMagStd	
- fBodyAccMeanX	
- fBodyAccMeanY	
- fBodyAccMeanZ	
- fBodyAccStdX	
- fBodyAccStdY	
- fBodyAccStdZ	
- fBodyAccMeanFreqX	
- fBodyAccMeanFreqY	
- fBodyAccMeanFreqZ	
- fBodyAccJerkMeanX	
- fBodyAccJerkMeanY	
- fBodyAccJerkMeanZ	
- fBodyAccJerkStdX	
- fBodyAccJerkStdY	
- fBodyAccJerkStdZ	
- fBodyAccJerkMeanFreqX	
- fBodyAccJerkMeanFreqY	
- fBodyAccJerkMeanFreqZ	
- fBodyGyroMeanX	
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroStdX	
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyGyroMeanFreqX
- fBodyGyroMeanFreqY
- fBodyGyroMeanFreqZ
- fBodyAccMagMean
- fBodyAccMagStd
- fBodyAccMagMeanFreq
- fBodyBodyAccJerkMagMean
- fBodyBodyAccJerkMagStd
- fBodyBodyAccJerkMagMeanFreq
- fBodyBodyGyroMagMean
- fBodyBodyGyroMagStd
- fBodyBodyGyroMagMeanFreq
- fBodyBodyGyroJerkMagMean
- fBodyBodyGyroJerkMagStd
- fBodyBodyGyroJerkMagMeanFreq
- angletBodyAccMean,gravity
- angletBodyAccJerkMean,gravityMean
- angletBodyGyroMean,gravityMean
- angletBodyGyroJerkMean,gravityMean
- angleX,gravityMean
- angleY,gravityMean
- angleZ,gravityMean

- We also get the mean value **(mean())** and the standard deviation **(std())** from these features.
- Also worth noting is that the features are normalized and bounded within[-1,1]

#### If you want to know more, refer to the link taking you to the aforementioned site.
