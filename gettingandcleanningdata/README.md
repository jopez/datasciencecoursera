Data Science, Coursera: run_analysis.R, Version 1.0
===================
## From the Course: Getting and Cleaning Data
===================

# The Data 

The data used in this project was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It is a collection of test and training measurements taken from the accelerometers form the Samsung Galaxy S smartphone. 
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. 
The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it was provided:
===================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

A full description is available at the website
where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


More information about the data can also be found in the file "Codebook.md".

# The Script

The "run_analysis.R" script performs a sequence of steps following the requirements of the final project of the course Getting and Cleaning Data offered
in Coursera. More information aobut the course can be found at: https://www.coursera.org/course/getdata

With the original set of measurements provided in the ZIP file referred before, the script performs the following steps:
===================

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set in order to ease its lecture, and using the information provided by the collectors of the data.
4. Appropriately labels the data set with descriptive variable names in order to ease its lecture, and using the information provided by the collectors of the data.
5. Creates a final tidy data set with the average of each variable for each activity and each subject.

# The Requirements

The script was created and successfully executed in the following environment:
===================

- Windows 7, 64 bits
- R 3.1.0, 64 bits
- The "R.utils" package

# Running the Script

There are at least two ways of running the script:
===================

1. Open it with your favorite text editor, and copy the text into an R shell.

2. Open a command prompt, move to the directory where the script is located, an execute the command "Rscript run_analysis.R"

Regarding the concrete operations performed by the script:
===================

- It checks for the installed R.utils package
- It creates a "data" directory, in the case there is none
- It downloads the ZIP file from the URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- It unzips the file
- It merges the data and test sets and performs the activities described in section "The Script"
- It creates a CSV and a TXT file with the resulting tidy data set
- It deletes the ZIP and unzipped files





