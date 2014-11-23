Codebook for analysis of movement data
======================================

author: Patricia Campbell

created: Wednesday, November 19, 2014

output: html_document

last updated: Wednesday, November 19, 2014


Description of original data
----------------------------
This script gathers and tidies data collected from experiments carried out 
with a group of 30 volunteers. Each person performed six activities while
wearing a Samsung Galaxy S smartphone that measured 3-axial linear 
acceleration and 3-axial angular velocity. The resulting dataset was randomly
split into two sets, with 70% of volunteers generating the training data and
30% generating the test data. More information is available at the site where
the data were obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data were downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Transformation of the original data
-----------------------------------
From the original data set the following files were combined using the
run_analysis.R script:

- X_test.txt            :data for 'test' subjects
- X_train.txt           :data for 'train' subjects
- features.txt          :variable names for X_test.txt and Y_test.txt
- subject_test.txt      :subject numbers for 'test' subjects
- subject_train.txt     :subject numbers for 'train' subjects
- y_test.txt            ;activities undertaken by 'test' subjects
- y_train.txt           :activities undertaken by 'train' subjects
- activity_labels.txt   :links the class labels with their activity name

The following steps were undertaken to select a subset of the data and clean to create a tidy data set suitable for further analysis:

1. The data contained in X_test.txt and X_train.txt were combined using `rbind()`
2. Variable names contained in features.txt were appended to the dataframe in
step 1
3. Variables containing either "mean()"" or "std()" in their name were 
identified and used to extract only columns corresponding to these variables. 
Variables containing the word "mean", without "()" were not extracted, as they 
were not considered to be aggregated at a similar level to the other variables 
extracted.
4. Subject numbers from subject_test.txt and subject_train.txt were appended to 
the dataframe as factors
5. Activities contained in y_test.txt and y_train.txt were appended to the data
frame as factors, with labels converted to lower case
6.Variable names were transformed by removing "-" and "()". Camel Case was used
for variable names, given their relative length. Initial "t" was replaced by "time",
and "f" by "frequency". "Acc" and "Gyro" were left as abbreviations to avoid further
lengthening variable names. Variable names with "BodyBody" were corrected to "Body"
7. Using the `melt` function, this data frame was melted into a *long* data set using subjectNumber and activity 
as ID variables
8. This long data set was cast using `dcast`into the *wide* dataset described below


Description of transformed data set, meanSubjectActivity.txt
------------------------------------------------------------
The dataset is a 180 x 68 data frame in wide format.

###Variables

subjectNumber (Column 1)

    Number assigned to experiment participant, from 1 to 30
    
activity (Column 2)

    Activity being undertaken by subject when reading was taken
    
    1. walking
    
    2. walkingupstairs
    
    3. walkingdownstairs
    
    4. sitting
    
    5. standing
    
    6. laying
    
timeBodyAccMeanX, timeBodyAccMeanY, timeBodyAccMeanZ (Columns 3-5)
    
    average mean  body acceleration signal in X, Y and Z axes  in time domain
    
timeBodyAccStdX, timeBodyAccStdY, timeBodyAccStdZ (Columns 6-8)

    average standard deviation of  body acceleration signal in X, Y and Z axes in time domain 
    
timeGravityAccMeanX, timeGravityAccMeanY, timeGravityAccMeanZ (Columns 9-11)

    average mean  gravity acceleration signal in X, Y and  Z axes in time domain
    
timeGravityAccStdX, timeGravityAccStdY, timeGravityAccStdZ (Columns 12-14)

    average standard deviation of  gravity acceleration signal in X, Y and Z axes in time domain
    
timeBodyAccJerkMeanX, timeBodyAccJerkMeanY, timeBodyAccJerkMeanZ (Columns 15-17)

    average mean  body acceleration jerk signals in X, Y and Z axes in time domain
    
timeBodyAccJerkStdX, timeBodyAccJerkStdY, timeBodyAccJerkStdZ (Columns 18-20)

    average standard deviation of  body acceleration jerksignals  in X, Y and Z axes in time domain
    
timeBodyGyroMeanX,  timeBodyGyroMeanY, timeBodyGyroMeanZ (Columns 21-23)

    average mean  body angular velocity signals in X, Y and Z axes in time domain
    
timeBodyGyroStdX, timeBodyGyroStdY,, timeBodyGyroStdZ (Columns 24-26)

    average standard deviation of  body angular velocity signals in X, Y and Z axes in time domain
    
timeBodyGyroJerkMeanX, timeBodyGyroJerkMeanY, timeBodyGyroJerkMeanZ 
(Columns 27-29)

    average mean  body angular velocity jerk signals in X, Y and Z axes in time domain

timeBodyGyroJerkStdX, timeBodyGyroJerkStdY, timeBodyGyroJerkStdZ (Columns 30-32)
    
    average standard deviation of  body angular velocity jerk signals in X, Y and Z axes in time domain
    
timeBodyAccMagMean (Column 33)

    average mean magnitude of  body acceleration signals in time domain

timeBodyAccMagStd (Column 34)

    average standard deviation of magnitude of  body acceleration signals in time domain

timeGravityAccMagMean (Column 35)

    average mean magnitude of  gravity acceleration signals in time domain

timeGravityAccMagStd (Column 36)

    average standard deviation of magnitude of  gravity acceleration signals in time domain

timeBodyAccJerkMagMean (Column 37)

    average mean magnitude of body acceleration jerk signals in time domain

timeBodyAccJerkMagStd (Column 38)

    average standard deviation of magnitude of  body acceleration jerk signals in time domain 

timeBodyGyroMagMean (Column 39)

    average mean magnitude of  body angular velocity  signals in time domain

timeBodyGyroMagStd (Column 40)

    average standard deviation of magnitude of  body angular velocity  signals in time domain

timeBodyGyroJerkMagMean	(Column 41)

    average mean magnitude of  body angular velocity jerk signals in time domain

timeBodyGyroJerkMagStd (Column 42)

    average standard deviation of magnitude of  body angular velocity jerk  signals in time domain

frequencyBodyAccMeanX, frequencyBodyAccMeanY, frequencyBodyAccMeanZ 
(Columns 43-45)

    average mean  body acceleration signal in X, Y and Z axes in frequency domain
    
frequencyBodyAccStdX, frequencyBodyAccStdY, frequencyBodyAccStdZ (Columns 46-48)

    average standard deviation of body acceleration signal in X, Y and Z axes in frequency domain
    
frequencyBodyAccJerkMeanX, frequencyBodyAccJerkMeanY, frequencyBodyAccJerkMeanZ
(Columns 49-51)

    average mean  body acceleration jerk signal in X, Y and Z axes in frequency domain
    
frequencyBodyAccJerkStdX, frequencyBodyAccJerkStdY, frequencyBodyAccJerkStdZ
(Columns 52-54)

    average standard deviation of body acceleration jerk signal in X, Y and Z  axes in frequency  domain

frequencyBodyGyroMeanX,	frequencyBodyGyroMeanY,	frequencyBodyGyroMeanZ
(Columns 55-57)

    average mean  body angular velocity signal in X, Y and Z axes in frequency  domain
    
frequencyBodyGyroStdX,	frequencyBodyGyroStdY,	frequencyBodyGyroStdZ
(Columns 58-60)

    average standard deviation of body angular velocity signal in X, Y and Z axes in frequency  domain
    
frequencyBodyAccMagMean	(Column 61)

    average mean magnitude of  body acceleration signals in frequency domain
    
frequencyBodyAccMagStd	(Column 62)

    average standard deviation of magnitude of  body acceleration signals in frequency domain
    
frequencyBodyAccJerkMagMean (Column 63)

    average mean magnitude of  body acceleration jerk signals in frequency domain
    
frequencyBodyAccJerkMagStd (Column 64)

    average standard deviation of magnitude of  body acceleration jerk signals in frequency domain
    
frequencyBodyGyroMagMean (Column 65)

    average mean magnitude of  body angular velocity  signals in frequency domain
    
frequencyBodyGyroMagStd (Column 66)

    average standard deviation of magnitude of  body angular velocity  signals in frequency domain
    
frequencyBodyGyroJerkMagMean (Column 67)

    average mean magnitude of  body angular velocity jerk  signals in frequency domain

frequencyBodyGyroJerkMagStd (Column 68)

    average standard deviation of magnitude of  body angular velocity jerk signals in frequency domain




    
    
    
    

    
    
    




