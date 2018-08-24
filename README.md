# Coursera 'Getting and Cleaning Data' Week 4 Project

This repository contains my submission for the Week 4 Assignment of the Getting and Cleaning Data Course in Coursera's 'Data Science Specialisation'.

This code was written in R Studio running R version 3.4.0.

# The Study
The data in this project comes from the 'Human Activity Recognition Using Smartphones' study.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

# R Script: 'run_analysis.R'

Exceuting the R script, 'run_analysis.R', does the following:

- Downloads the zip folder, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, to the working directory and unzips it.
- Reads in the activity labels and features text files and stores them in seperate tables.
- Reads in the training data set text file along with the training activity and training subject text files and stores these in separate tables.
- Reads in the test data set text file along with the test activity and test subject text files and stores these in separate tables.
- Merges all of the training tables together and merges all of the test tables together.
- Merges these merged training and test tables together to create one data set.
- Labels the variables in the data set using the names from the features text file.
- Extracts the variables which are either a mean or a standard deviation for each measurement and discards the rest.
- Converts numeric activity labels into descriptive ones, e.g 1 -> WALKING, using the activity labels text file.
- Makes the variable names more decriptive.
- Groups the data by subject and then activity and finds the average of each variable for each row of data.
- Saves this in a new text file called 'tidied_data.txt'.

# Codebook

The codebook in this repository describes the data, the variables and the transformations executed to clean the data set.

# tidied_data.txt

The text file 'tidied_data.txt' contains the cleaned version of the original data.