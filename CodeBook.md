# Code Book
##Process for summary data extraction
From the original data set ([UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)) variables we have created a tidy summarized data set.
The summary data set was created using the following steps:

1. Load the original feature list and filter it down to only the mean and standard deviation variables(variables containing mean() and std())
2. We use the feature list to create more detailed and human readable column names for the new summary data set
3. We then load the data related to the training data set (subject_train.txt, X_train.txt, y_train.txt). Extract the subject, filtered feature list, and the activity
4. We then load the data related to the test data set (subject_train.txt, X_train.txt, y_train.txt). Extract the subject, filtered feature list, and the activity
5. The test and training data set are combined
6. The activity variable is changed into a human readable factor
7. The data set is reshaped to have each row be one subject and one activity and then the mean of all other measurements from the filtered feature list
8. Finally the summary data set is saved as a csv file called summaryData.csv

## Summary data set variables
The summary data set has the following variables:
* subject: numeric (1-30) of the subject who performed the activity
* activity: factor with levels ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"). Describes the activity the subject was performing 
* Time body accelerometer mean and standard deviation summaries variables
  * summary
    * units: m/s^2
	* Measurements in time domain
	* The measurements are for body, gravity and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
    * timeBodyAccelerometerMean-X
    * timeBodyAccelerometerMean-Y
    * timeBodyAccelerometerMean-Z
    * timeBodyAccelerometerStandardDeviation-X
    * timeBodyAccelerometerStandardDeviation-Y
    * timeBodyAccelerometerStandardDeviation-Z
    * timeGravityAccelerometerMean-X
    * timeGravityAccelerometerMean-Y
    * timeGravityAccelerometerMean-Z
    * timeGravityAccelerometerStandardDeviation-X
    * timeGravityAccelerometerStandardDeviation-Y
    * timeGravityAccelerometerStandardDeviation-Z
    * timeBodyAccelerometerJerkMean-X
    * timeBodyAccelerometerJerkMean-Y
    * timeBodyAccelerometerJerkMean-Z
    * timeBodyAccelerometerJerkStandardDeviation-X
    * timeBodyAccelerometerJerkStandardDeviation-Y
    * timeBodyAccelerometerJerkStandardDeviation-Z
* Time body gyro mean and standard deviation variables
  * summary
    * Units: radians/second
	* Measurements in time domain
	* The measurements are for body and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
    * timeBodyGyroMean-X
    * timeBodyGyroMean-Y
    * timeBodyGyroMean-Z
    * timeBodyGyroStandardDeviation-X
    * timeBodyGyroStandardDeviation-Y
    * timeBodyGyroStandardDeviation-Z
    * timeBodyGyroJerkMean-X
    * timeBodyGyroJerkMean-Y
    * timeBodyGyroJerkMean-Z
    * timeBodyGyroJerkStandardDeviation-X
    * timeBodyGyroJerkStandardDeviation-Y
    * timeBodyGyroJerkStandardDeviation-Z
* Time body accelerometer magnitude mean and standard deviation variables
  * summary
    * Units: m/s^2
	* Measurements in time domain
	* The measurements are for body, gravity and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
	* timeBodyAccelerometerMagnitudeMean
    * timeBodyAccelerometerMagnitudeStandardDeviation
    * timeGravityAccelerometerMagnitudeMean
    * timeGravityAccelerometerMagnitudeStandardDeviation
    * timeBodyAccelerometerJerkMagnitudeMean
    * timeBodyAccelerometerJerkMagnitudeStandardDeviation
* Time body gyro magnitude mean and standard deviation variables
  * summary
    * Units: radians/second
	* Measurements in time domain
	* The measurements are for body and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
    * timeBodyGyroMagnitudeMean
    * timeBodyGyroMagnitudeStandardDeviation
    * timeBodyGyroJerkMagnitudeMean
    * timeBodyGyroJerkMagnitudeStandardDeviation
* frequency body accelerometer mean and standard deviation variables
  * summary
    * Units: m/s^2
	* Measurements in frequency domain
	* The measurements are for body and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
    * frequencyBodyAccelerometerMean-X
    * frequencyBodyAccelerometerMean-Y
    * frequencyBodyAccelerometerMean-Z
    * frequencyBodyAccelerometerStandardDeviation-X
    * frequencyBodyAccelerometerStandardDeviation-Y
    * frequencyBodyAccelerometerStandardDeviation-Z
    * frequencyBodyAccelerometerJerkMean-X
    * frequencyBodyAccelerometerJerkMean-Y
    * frequencyBodyAccelerometerJerkMean-Z
    * frequencyBodyAccelerometerJerkStandardDeviation-X
    * frequencyBodyAccelerometerJerkStandardDeviation-Y
    * frequencyBodyAccelerometerJerkStandardDeviation-Z
* Frequency body gyro mean and standard deviation variables
  * summary
    * Units: radians/second
	* Measurements in frequency domain
	* The measurements are for body and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
	* frequencyBodyGyroMean-X
    * frequencyBodyGyroMean-Y
    * frequencyBodyGyroMean-Z
    * frequencyBodyGyroStandardDeviation-X
    * frequencyBodyGyroStandardDeviation-Y
    * frequencyBodyGyroStandardDeviation-Z
* Frequency body accelerometer magnitude mean and standard deviation variables
  * summary
    * Units: m/s^2
	* Measurements in frequency domain
	* The measurements are for body and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
	* frequencyBodyAccelerometerMagnitudeMean
    * frequencyBodyAccelerometerMagnitudeStandardDeviation
    * frequencyBodyBodyAccelerometerJerkMagnitudeMean
    * frequencyBodyBodyAccelerometerJerkMagnitudeStandardDeviation
* Frequency body gyro magnitude mean and standard deviation variables
  * summary
    * Units: radians/second
	* Measurements in frequency domain
	* The measurements are for body and body jerk
	* These are the mean for each measurement taken of a given subject performing a single activity
  * variable names
	* frequencyBodyBodyGyroMagnitudeMean
    * frequencyBodyBodyGyroMagnitudeStandardDeviation
    * frequencyBodyBodyGyroJerkMagnitudeMean
    * frequencyBodyBodyGyroJerkMagnitudeStandardDeviation