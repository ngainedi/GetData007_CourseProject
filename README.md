GetData007_CourseProject
========================

This repository contains 3 files that need to be submitted as part of the 
Course Project for Getting and Cleaning Data.
    1. README.md - Contains explanation of the code in run_analysis.R
    2. run_analysis.R - R code that meets the specifications of the project
    3. Codebook.txt - Description of the variables in the final tidy data set

******************************************************************************
Prerequsites for running run_analysis.R:
1. The code assumes that the following Samsung files are available in the 
   same working directory as the run_analysis.R script.
   	a. Training files - X_train.txt, y_train.txt, subject_train.txt
   	b. Test files - X_test.txt, y_test.txt, subject_test.txt
   	c. Features - features.txt (contains names of feature variables)

******************************************************************************
Step1: Merging the training and the test sets to create one data set.
A. Vertically merge X, y and subject files of training data sets using cbind
B. Vertcially merge X, y and subject files of test data sets using cbind
C. Assign variables names to the above datasets using the names available in 
   the Features.txt file.
   Variable from Subject file is named as SubjectId
   Variable from y file is names as ActivityClass
D. Horizontally merge datasets from above using rbind.
   Note: The dataset at the end of Step1 will contain 10297 rows and 563 columns

Step2: Extracts only the measurements on the mean and standard deviation for 
	each measurement. 
A. Create two vectors that have feature names containing the strings "mean(" or 
   "std(". This is done using grep command.
   Note: Intermediate mean variables (e.g: gravityMean) used in angle 
   variables have been excluded.
B. Create a subset of data from Step1d, using the vectors from Step 2a. The 
   variables SubjectId and Activity Class should continue to be retained in
   addition to the mean and std variables.
   Note: The dataset at the end of Step2 will contain 10297 rows and 68 columns
   
Step3: Uses descriptive activity names to name the activities in the data set
A. Create a new vector (ActivityDescription) hat "decodes" ActivityClass 
   back to descriptive names given in the activity_labels.txt file
B. Replace variable ActivityClass with ActivityDescription
   Note: The dataset at the end of Step3 will contain 10297 rows and 68 columns

Step4: Appropriately labels the data set with descriptive variable names.
This step is contained in Step1C. The variables have been named using the
descriptive names given in the features.txt

Step5: From the data set in step 4, creates a second, independent tidy 
	data set with the average of each variable for each activity 
	and each subject
A. Create a new tidy dataset using aggregate command to summarize all variables
   by SubjectId and ActivityDescription (a.k.a. group by columns)
B. Assign back meaningful names to the group by columns
C. Write out a new file (tidy_data.txt) of the final tidy data set.
   Note: The dataset at the end of Step3 will contain 
   	 180 rows (30 subject * 6 activities) and 68 columns
   Please use the following code from the dsicussion forum to view the dataset
   (https://class.coursera.org/getdata-007/forum/thread?thread_id=49) 
   df <- read.table('tidy_data.txt', header=TRUE)
   View(df)
******************************************************************************