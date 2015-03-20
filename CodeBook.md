# Human Activity Recognition Using Smartphones Dataset

Current dataset is preprocessed raw UCI HAR dataset with filtered features' summary.

## Original dataset description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.
 
## Feature list

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Therefore there are 33 features.

Final dataset contains of summary for these features' mean and standard deviation for each person and activity type.
So we have 66 features for each combination of "Subject ID" and "Activity Type"

## Feature description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Output dataset structure

Each line of the data contains 68 variables:

1. Subject ID
2. Activity type
3-68. Features

Dataset has following format of feature names: <name>_<mean/std>_<X/Y/Z>. Features that don't have XYZ estimations don't have _<X/Y/Z>.
Examples: tBodyAcc_mean_X, tBodyGyroMag_mean

## Processing description

1. Loading training and testing data
2. Combining data in one dataset
3. Add subject id and activity label as first columns of dataset
4. Convert activity labels into activity names
5. Filter out all features except "mean" and "std" (original dataset contains much more features)
6. Refactor feature names for easy processing - remove brackets and convert '-' into '_'
7. Run summary for each person and each activity
