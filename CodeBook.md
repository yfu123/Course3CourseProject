Data Source:

The raw data was downloaded on December 30, 2016 at 5:29PM from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fproject?les%2FUCI%20HAR%20Dataset.zip

The zip file downloaded contains a README.txt file which described the experimental study design, variables, and units.
Transformation into a Tidy Dataset performed below does not modify any content of the original data.

Data Transformation:

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