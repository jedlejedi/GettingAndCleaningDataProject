Coursera Getting and Cleaning Data Course Project Cookbook
==========================================================

Dataset Derivation
------------------

The data set generated by the run_analysis.R script is based *Human Activity Recognition Using Smartphones Dataset* (Please refer to the *UCI HAR Dataset/README.txt* file for an overview of the content of that dataset). The transformations below were applied to the HAR dataset:

1. For each sets (train and test), the subject, label and data files were concatenated into a single data frame.
2. The two data frames were merged together
3. Of the 561 features of the resulting data frame, only the ones representing the mean or standard deviation of the original measurements were retained. All the others were filtered out.
4. The names of the activity were added to the data frame
5. Meaningful column names were added to the data frame based on the names of the features (converted to lower case and with brackets removed)
6. The last part of the script creates a second, independent data set with the average of each variable for each activity and each subject.

Dataset Description
-------------------

### Main Dataset
For each record the following information is provided:

- Identifier of the subject who carried out the experiment
- Identifier of the activity carried out
- Name of the activity carried out

As well as the following feature from the original datset:

- tBodyAcc-mean-X
- tBodyAcc-mean-Y
- tBodyAcc-mean-Z
- tBodyAcc-std-X
- tBodyAcc-std-Y
- tBodyAcc-std-Z
- tGravityAcc-mean-X
- tGravityAcc-mean-Y
- tGravityAcc-mean-Z
- tGravityAcc-std-X
- tGravityAcc-std-Y
- tGravityAcc-std-Z
- tBodyAccJerk-mean-X
- tBodyAccJerk-mean-Y
- tBodyAccJerk-mean-Z
- tBodyAccJerk-std-X
- tBodyAccJerk-std-Y
- tBodyAccJerk-std-Z
- tBodyGyro-mean-X
- tBodyGyro-mean-Y
- tBodyGyro-mean-Z
- tBodyGyro-std-X
- tBodyGyro-std-Y
- tBodyGyro-std-Z
- tBodyGyroJerk-mean-X
- tBodyGyroJerk-mean-Y
- tBodyGyroJerk-mean-Z
- tBodyGyroJerk-std-X
- tBodyGyroJerk-std-Y
- tBodyGyroJerk-std-Z
- tBodyAccMag-mean
- tBodyAccMag-std
- tGravityAccMag-mean
- tGravityAccMag-std
- tBodyAccJerkMag-mean
- tBodyAccJerkMag-std
- tBodyGyroMag-mean
- tBodyGyroMag-std
- tBodyGyroJerkMag-mean
- tBodyGyroJerkMag-std
- fBodyAcc-mean-X
- fBodyAcc-mean-Y
- fBodyAcc-mean-Z
- fBodyAcc-std-X
- fBodyAcc-std-Y
- fBodyAcc-std-Z
- fBodyAccJerk-mean-X
- fBodyAccJerk-mean-Y
- fBodyAccJerk-mean-Z
- fBodyAccJerk-std-X
- fBodyAccJerk-std-Y
- fBodyAccJerk-std-Z
- fBodyGyro-mean-X
- fBodyGyro-mean-Y
- fBodyGyro-mean-Z
- fBodyGyro-std-X
- fBodyGyro-std-Y
- fBodyGyro-std-Z
- fBodyAccMag-mean
- fBodyAccMag-std
- fBodyBodyAccJerkMag-mean
- fBodyBodyAccJerkMag-std
- fBodyBodyGyroMag-mean
- fBodyBodyGyroMag-std
- fBodyBodyGyroJerkMag-mean
- fBodyBodyGyroJerkMag-std

### Summary Dataset
The summary dataset contains the average of the feature in the main dataset for each subject and activity. For each record the following information is provided:

- Identifier of the subject who carried out the experiment
- Name of the activity carried out
As well as the average of the following feature listed in the above sections.