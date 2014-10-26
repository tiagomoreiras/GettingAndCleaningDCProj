<<<<<<< HEAD
# Getting and Cleaning Data Project

## Coursera Final Course Project

The objective of the presented work is to create one R script called ```run_analysis.R``` that:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to execute the Run Analysis Script

1. Download the data source from the UCI data repository to ```%Download_Folder%```. Go to your ```%Download_Folder%``` and you will fin a ```UCI HAR Dataset``` folder.
2. Put your developed ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set the former as your working directory using ```setwd()``` function in RStudio.
3. To execute the script just run ```source("run_analysis.R")``` in your RStudio, and it will generate a new file ```tiny_data.txt``` in the previously defined working directory.

## Package Dependencies

```run_analysis.R``` depends on ```reshape2``` and ```data.table```. If you have an active internet connection the script will install the needed dependencies automatically.
=======
GettingAndCleaningDCProj
========================

Getting and Cleaning Data Course Project Coursera
>>>>>>> c89260a941850fc21beb6816b5459efd6b7e6f05
