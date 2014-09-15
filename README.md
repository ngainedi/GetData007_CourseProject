GetData007_CourseProject
========================

This repository contains 3 files that need to be submitted as part of the 
Course Project for Getting and Cleaning Data.

    1. README.md - Contains explanation of the code in run_analysis.R
    2. run_analysis.R - R code that meets the specifications of the project
    3. Codebook.txt - Description of the variables in the final tidy data set

******************************************************************************
###Pre-requsites for running run_analysis.R:

The code assumes that the following files provided with the assignment are available in the same working directory as the run_analysis.R script.

   	1. Training files - X_train.txt, y_train.txt, subject_train.txt
   	2. Test files - X_test.txt, y_test.txt, subject_test.txt
   	3. Features - features.txt (contains names of feature variables)

******************************************************************************
###Main steps in run_analysis.R script:

#### Step1: Merging the training and test sets to create one data set.
    1. Vertically merge X, y and subject files of training data sets using __cbind__
    * Vertcially merge X, y and subject files of test data sets using **cbind**
    * Assign variables names to the above datasets using the names available in the Features.txt file. 
    * The variable from the Subject file and the y file are named  SubjectId and ActivityClass respectively.
    * Horizontally merge datasets from above using **rbind**.
    * The dataset at the end of Step1 will contain 10297 rows and 563 columns

#### Step2: Extract measurements on the mean and standard deviation.
    * Create two vectors that have feature names containing the strings "mean(" or "std(". using **grep** command. 
        Note: Intermediate mean variables (e.g: gravityMean) used in angle variables have been excluded.
    * Create a subset of data from Step1d, using the vectors from Step 2a. The variables SubjectId and Activity Class should continue to be retained in addition to the mean and std variables.
    * The dataset at the end of Step2 will contain 10297 rows and 68 columns
   
#### Step3: Uses descriptive activity names to name the activities in the data set
    * Create a new vector (ActivityDescription) hat "decodes" ActivityClass back to descriptive names given in the activity_labels.txt file
    * Replace variable ActivityClass with ActivityDescription
    * Note: The dataset at the end of Step3 will contain 10297 rows and 68 columns

#### Step4: Appropriately labels the data set with descriptive variable names.

This step is contained in Step1C. The variables have been named using the
descriptive names given in the features.txt. Please refer to the files feature_info.txt for more information.

#### Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
    * Create a new tidy dataset using aggregate command to summarize all variables by SubjectId and ActivityDescription (a.k.a. group by columns)
    * Assign back meaningful names to the group by columns
    * Write out a new file (tidy_data.txt) of the final tidy data set.
    * The dataset at the end of Step3 will contain 180 rows (30 subject * 6 activities) and 68 columns.
    * Please use the following code from the dsicussion forum to view the dataset (https://class.coursera.org/getdata-007/forum/thread?thread_id=49) 
    df <- read.table('tidy_data.txt', header=TRUE)
    View(df)
    
******************************************************************************
