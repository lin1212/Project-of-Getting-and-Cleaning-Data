# Codebook
# The Data set Information:
The original data was collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
The data set can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
# Feature Information:

For each record in the dataset it is provided: 
1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. (X_train.txt and X_test.txt)
4. Its activity label. (y_train.txt and y_test.txt)
5. An identifier of the subject who carried out the experiment. (subject_train.txt and subject_test.txt)

# The run_analysis.R implements cleaning the data set in six steps:

1. download data set
2. use descriptive activity names (activity_labels.txt) to name the activities in the data set
3. label the data set with descriptive variable names (features.txt)
4. extract only the measurements on the mean and standard deviation for each measurement (79 variables)
5. merge the training and the test sets to create one data set.
6. create a second, independent tidy data set with the average of each variable for each activity and each subject

# tidy data set
The final tidy data set contain the average of each variable for each activity and each subject, since we have 30 subjects and 6 activities for each subject, then we have 180 records in tidy.txt.
