## Getting and Cleaning Data
## Project
## Author: Tiago Moreiras
## Date: 2014/10/26

## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. From the data set in step 4, creates a second, independent tidy data set 
##      with the average of each variable for each activity and each subject.

# Validate if package needs to be installed
if (!require("data.table")) {
    install.packages("data.table")
}

# Validate if package needs to be installed
if (!require("reshape2")) {
    install.packages("reshape2")
}

# Load Packages
require("data.table")
require("reshape2")

##
## 1. Merges the training and the test sets to create one data set.
##

# 1.1 Load X Train Data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# 1.2 Load X Test Data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# 1.3 Merge Train and Test Data Set
X_data = rbind(X_train, X_test)

##
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
##

# 2.1 Load Features Names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# 2.2 Labels data Appropriately
names(X_data) = features

# 2.3 Create boolean vector identifying indexes of measurements on the mean 
#   and standard deviation for each features.
extract_features <- grepl("mean|std", features)

# 2.4 Create new dataset only with filtered measures
X_data_filtered <- X_data[,extract_features]

##
## 3. Uses descriptive activity names to name the activities in the data set
##

# 3.1 Load Y and Subject Train Data
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# 3.2 Load Y and Subject Test Data
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# 3.3 Merge Train and Test Data
y_data <- rbind(y_train,y_test)
subject_data <- rbind(subject_train,subject_test)

# 3.4 Load Activity Labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# 3.5 Load activity labels
y_data[,2] = activity_labels[y_data[,1]]
names(y_data) = c("activityID", "activityLabel")
names(subject_data) = "subjectID"

##
## 4. Appropriately labels the data set with descriptive activity names.
##

# 4.1 Bind All Three Data Tables into a Single Data Set
data <- cbind(subject_data, y_data, X_data_filtered) 

##
## 5. From the data set in step 4, creates a second, independent tidy data set 
##      with the average of each variable for each activity and each subject.

# 5.1 Melt Data Frame
key_labels <- c("subjectID", "activityID", "activityLabel")
data_labels <- setdiff(colnames(data), key_labels)
melt_data <- melt(data, id = key_labels, measure.vars = data_labels)

# 5.2 Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subjectID + activityLabel ~ variable, mean)

# 5.3 Write the final tidy data file
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)