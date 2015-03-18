# Course Project
##Instructions for executing script:  run_analysis.R

Ensure that the script (run_analysis.R) is loaded onto the working directory of R Studio before you execute it.
You may also set the working directory of R Studio to where the script and the raw data are located.

The script does the following steps:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set.
4.  Labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The raw data for the script are available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The raw data has to be pre-downloaded and upzipped into in the sub-directory of the working directory where script is located as follows:

./UCI HAR Dataset/

	activity_labels.txt
	features.txt

./UCI HAR Dataset/test/

	subject_test.txt
	X_test.txt
	y_test.txt

./UCI HAR Dataset/train/

	subject_train.txt
	X_train.txt
	y_train.txt

The script makes use of plyr and dplyr libraries.

If you have not installed the following packages, please install using the following instructions before running the script (run_analysis.R) in R Studio:

- install.packages("plyr")
- install.packages("dplyr")

After Step 5, the script outputs the processed data to a text file (tdydata.txt) on the working directory, and display the processed data on R Studio.

Please refer to CodeBook.md for descriptions of the processed data.




	



