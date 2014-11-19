
README file for run_analysis.R Version 1.0
==========================================


author: Patricia Campbell

created: Tuesday, November 18, 2014

output: html_document

last updated: Wednesday November 19, 2014

Description
-----------
This script gathers and tidies data collected from experiments carried out 
with a group of 30 volunteers. Each person performed six activities while
wearing a Samsung Galaxy S smartphone that measured 3-axial linear 
acceleration and 3-axial angular velocity. The resulting dataset was randomly
split into two sets, with 70% of volunteers generating the training data and
30% generating the test data. More information is available at the site where
the data were obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+
Smartphones

Data were downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR
%20Dataset.zip

Files associated with this data analysis
----------------------------------------
- run_analysis.R (script file to tidy data set)
- README.md (this file)
- CodeBook.md  (describes the variables, data and transformations used)
- meanSubjectActivity.txt (the resulting tidy data set)

Files processed by run_analysis.R
---------------------------------
The script requires the following files to be located in the same directory as
the run_analysis.R script:

- X_test.txt            :data for 'test' subjects
- X_train.txt           :data for 'train' subjects
- features.txt          :variable names for X_test.txt and Y_test.txt
- subject_test.txt      :subject numbers for 'test' subjects
- subject_train.txt     :subject numbers for 'train' subjects
- y_test.txt            ;activities undertaken by 'test' subjects
- y_train.txt           :activities undertaken by 'train' subjects
- activity_labels.txt   :links the class labels with their activity name

Required libraries
------------------
plyr

reshape2

What run_analysis.R does
-----------------------
- merges the training and the test sets to create one data set
- labels the data set with descriptive, legal, variable names 
- extracts the measurements on the mean and standard deviation for each reading 
- re-labels the activities with descriptive activity names
- creates a data set, meanSubjectActivity.txt, which provides the mean of each 
of the retained variables for each subject and each activity

Use of the resulting data set
-----------------------------
The tidy data set meanSubjectActivity.txt may be read into R as follows:

data <- read.table("meanSubjectActivity.txt", header=TRUE)
     

    





