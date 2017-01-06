==================================================================
Data Source:
==================================================================

The raw data was downloaded on December 30, 2016 at 5:29PM from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fproject?les%2FUCI%20HAR%20Dataset.zip

The zip file downloaded contains a README.txt file which described the experimental study design, variables, and units.
Transformation into a Tidy Dataset performed below does not modify any content of the original data.

The original publisher of the data described the experimental study design as the following. (Note that you can find the following sections in "README.txt" and "features_info.txt" in the downloaded zip file. The following extract has been presented for the readers' convenience.)

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation"

Please note that original set of variables contain more than just the mean and standard deviation. During the data transformation process, only the mean and standard deviation columns are kept in the Tidy Datasets.

==================================================================
Data Transformation:
==================================================================

The following files are merged into a single text file named "TidyData.txt".

1. activity_labels.txt
2. features.txt
3. subject_test.txt
4. subject_train.txt
5. X_test.txt
6. X_train.txt
7. y_test.txt
8. y_train.txt

The steps used are as follows.

1. Load the 8 files listed above.
2. Using features.txt, identify columns to be extracted. Columns with the description "mean()" or "std()" are identified to be extracted.
3. Merge the X_test and X_train datasets including just the mean and standard deviation columns. Rename the merged dataset column names to the appropriate variable names.
4. Add in subject and activity columns
5. Create a second, independent tidy data set with average of each variable for each activity and each subject
6. Export results to two output files

==================================================================
Output Files:
==================================================================

Output files include the following.

1. TidyData.txt
2. TidyData_means.txt

TidyData.txt contains the following columns.

activityCode - A numeric code for activity the subject was performing. Ranges from 1 to 6
activityLabel - A text description of the activity
subjectCode - An identifier for the subject

66 columns of mean and standard deviation of each variable from the source dataset.

TidyData_means.txt ontains the following columns.

activityLabel - A text description of the activity
subjectCode - An identifier for the subject

66 columns of the average of each variable column in TidyData.txt summarized by activityLabel and subjectCode.