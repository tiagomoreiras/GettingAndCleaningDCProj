# CodeBook

This is the code book that describes the variables, the data, and any transformations or work that were performed to clean up the data on the Human Activity Recognition Using Smartphones Dataset.

## Authors
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Data Set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Data Sources

* **Description of the dataset:**
	* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* **Dataset files:**
	* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data Records and Files
For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Notes from the authors:

## Transformation Process

The submited ```run_analysis.R``` script executes the following steps to clean the data:

_Require ```reshape2``` and ```data.table``` libraries to guarantee that the script loads the necessary dependencies._

**1. Merges the training and the test sets to create one data set.**

	1. Load X Train Data
	2. Load X Test Data
	3. Merge Train and Test Data Set

**2. Extracts only the measurements on the mean and standard deviation for each measurement.**

	1. Load Features Names
	2. Labels data Appropriately
	3. Create boolean vector identifying indexes of measurements on the mean and standard deviation for each features
	4. Create new dataset only with filtered measures
**3. Uses descriptive activity names to name the activities in the data set.**

	1. Load Y and Subject Train Data
	2. Load Y and Subject Test Data
	3. Merge Train and Test Data
	4. Load Activity Labels
	5. Load activity Labels
**4. Appropriately labels the data set with descriptive activity names.**

	1. Bind All Three Data Tables into a Single Data Set with appropriate names
**5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

	1. Melt Data Frame
	2. Apply mean function to dataset using dcast function
	3. Write the final tidy data file without rownames