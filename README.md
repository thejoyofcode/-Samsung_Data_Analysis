## Samsung_Data_Analysis
CourseProject_GettingAndCleaningData

This repository contains the analysis of data collected from the Samsung Galaxy S smartphone.  
The data for the project is here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The above dataset contains measurements from accelerometer and gyroscope embeded into smart phone of 30 subjects.  
Measurements were taking during 6 types of activities:  
1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

Subjects are divided into 'train' (21 subjects) and 'test' (9 subjects) sets.  
For each, 'train' and 'test' sets, the following separate files are provided:  
--raw data (9 measurements from accelerometer and gyroscope, see Intertial Signals folder)  
--561-feature vector (X_train|test.txt) obtained by various transformations of the raw data (see features_info.txt)  
--activity identifier (y-train|test.txt)  
--subject identifier (subject_train|test.txt)  

In addition, files with descriptive names for each activity (activity_labels.txt) and variable names of 561-feature vector (features.txt) are also provided.

************************
This repository contains:

1. run_analysis.R - R script that reads in the above data files and outputs a tidy subset of data that consists of averages of  mean and standard deviation for each measurement for each activity and each subject (Summary_Means_BySubject_By_Activity.txt)

2. CodeBook.md with description of variables of the output file (Summary_Means_BySubject_By_Activity.txt)

***********************