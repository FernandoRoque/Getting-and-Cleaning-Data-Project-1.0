# Getting and Cleaning Data Project 

Overview
========

This works is about Getting (from internet) and Cleaning Data (for future analysis). Data used comes from a study made by Samsung (see License section for more information about data source). The objetive is create a tidy dataset using R code, since het data from Internet until get the final dataset for further statistical analysis.

Summary
========
Briefly speaking experiment consist in measure acceleration and velocity using smartphones and its embedded accelerometer and gyroscope. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Originally, data was partitiones in two data sets, training (70%) and test (30%). One of the objectives is create only one dataset.

The Project
========
run_analysis.r script contains all step neccesary to clean the Data. Files neccesary are:

* activity_labels.txt
* features.txt
* subject_train.txt
* x_train.txt
* y_train.txt
* subject_test.txt
* x_test.txt
* y_test.txt

Although there are mor files in the downlable package, we only use above files.

The scripts consist in 6 steps neccesary to clean the Data.

0. Load the Data into R
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement
3.  Uses descriptive activity names to name the activities in the data set
4.  Export tidy data
5.  Create a data set with the average of each variable for each activity and each subject



License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
