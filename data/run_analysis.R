####################################
#
# Coursera Getting and Cleaning Data
# Programming Assignment
#
####################################
#
# This script gathers and tidies data collected from experiments carried out 
# with a group of 30 volunteers. Each person performed six activities while
# wearing a Samsung Galaxy S smartphone that measured 3-axial linear 
# acceleration and 3-axial angular velocity. The resulting dataset was randomly
# split into two sets, with 70% of volunteers generating the training data and
# 30% generating the test data. More information is available at the site where
# the data were obtained:
#
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+
# Smartphones
#
# and in the README.md file for this analysis.
#
# Data were downloaded from:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR
# %20Dataset.zip
#
# Files associated with this data analysis are:
# run_analysis.R (this script)
# README.md which explains the operations undertaken in the analysis
# CodeBook.md which describes the variables, data and transformations used

###############
#
# Housekeeping
#
###############

# set working directory
setwd("~/Coursera/Getting and Cleaning Data/data")

# required packages
library(plyr)
library(reshape2)

###########
#
# Load data
#
###########

# read in the data sets
XTest <- read.table("X_test.txt")               # data for 'test' subjects
XTrain <- read.table("X_train.txt")             # data for 'train' subjects
features <- read.table("features.txt")          # variable names for readings
subjectTest <- read.table("subject_test.txt")   # subject numbers'test'
subjectTrain <- read.table("subject_train.txt") # subject numbers'train'
yTest <- read.table("y_test.txt")               # activities for 'test'
yTrain <- read.table("y_train.txt")             # activities for 'train'
activityLabels <- read.table("activity_labels.txt") # activity labels
  
#####################################################
#
# Merge training and test sets to create one data set
# Attach raw variable names to data frame
#
#####################################################

# merge data sets
movementData <- rbind(XTest,XTrain)

# add column names obtained from features.txt 
colnames(movementData) <- t(features[,2]) 

###############################################################################
#
# Extract  measurements on the mean and standard deviation for each measurement,
# interpreted as column names with mean() or std() but NOT meanFreq() 
#
###############################################################################

requiredColsMean <- grep("mean()", colnames(movementData),fixed=TRUE)
requiredColsStd <- grep("std()", colnames(movementData),fixed=TRUE)
columnIndex <- sort(union(requiredColsMean,requiredColsStd))
meanMovementData <- subset(movementData,select=columnIndex)

#########################################################################
#
# Append subject number and activities to subsetted data frame
# Apply descriptive activity names to name the activities in the data set
#
#########################################################################

# append subject numbers 
subjectNumbers <- rbind(subjectTest,subjectTrain) # combine 'test' and 'train'  
meanMovementData$subjectNumber <- as.factor(subjectNumbers$V1) 

# append activities
activity <- rbind(yTest,yTrain)
activityTypes <- gsub("_","",tolower(activityLabels$V2)) # format neatly
meanMovementData$activity <- factor(activity$V1,levels=as.character(c(1:6)),
                                    labels=activityTypes)

###################################################################
#
# Appropriately label the data set with descriptive variable names
#
################################################################### 

tidyNames <- gsub("-","",names(meanMovementData))       # remove dashes
tidyNames <- gsub("()","",tidyNames,fixed=TRUE)         # remove brackets 
tidyNames <- gsub("std","Std",tidyNames)                # convert to CamelCase
tidyNames <- gsub("mean","Mean",tidyNames)              # convert to CamelCase
tidyNames <- gsub("BodyBody","Body",tidyNames)          # correct name error
tidyNames <- sub("^[t]","time",tidyNames)               # time
tidyNames <- sub("^[f]","frequency",tidyNames)          # frequency
names(meanMovementData) <- tidyNames                    # reapply tidy names

######################################################################
#
# Create a second, independent tidy data set with the average of each 
# variable for each activity and each subject
#
######################################################################

# melt into a long dataset
meanMovementDataMelt <- melt(meanMovementData,id.vars=c(67,68),
                             variable.name="measurement",value.name = "mean")

# cast into data frame averaging variables by activity and subject
meanMovementDataSummary <- dcast(meanMovementDataMelt,subjectNumber + activity
                                 ~ measurement,fun.aggregate=mean)

########################################
#
# Write final tidy data set to .txt file
#
########################################

write.table(meanMovementDataSummary, file = "meanSubjectActivity.txt",row.names=FALSE)





        

