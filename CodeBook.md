Code Book
=========

This document contains information about the variables in the final tidy data set. 

## Study Design

The final submitted text file (referred as tidy data set) is a summarized file containing average of certain variables (described below) measured during different activities (e.g. Walking, Sitting, etc.) carried out by a set of subjects (users). 

The original dataset has been collected from the accelerometers from the Samsung Galaxy S smartphone and is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The data set contains different variables characterizing the movement of users while performing various activities. A detailed explanation of the variables is available in the files features.txt and features_info.txt that ship with the data set.

This particular tidy data set has been summarized at the following levels and contains 180 observations:

    1. For every subject (total of 30 distinct subjects)
    2. For every activity type (total of 6 distinct activity types)

A design choice has been made to represent the various averages (mean variables) as columns.

The final data set follows the following commonly observed rules of tidy sets:

    1. There is only one dataset (summarized by subject/activity).
    2. Each variable is in its own column.
    3. Each row represents the summary of only 1 subject and 1 activity.
    
Please refer to README.md for detailed instructions for creating the summarized tidy data set from the orginal data.

## Variable Description

1. SubjectId: Identifier for every subject participating in the study.
2. Activity: Categorical variable describing the types of activity. Possible values are:
    * Laying
    * Sitting
    * Standing
    * Walking
    * Walking_downstairs
    * Walking_upstairs		 

All the remaining variables in this file are *numerical* values and been calculated as an average (summarized by subjectId and Activity) of the corresponding varaibles in 
the original data set. The naming conventions of the variables are provided in the 'features_info.txt' file in the original data set. Some key variable naming conventions are:

    * The first letter of varaible name indicates whether:
        * t - time domain signal
        * f - Fast Fourier Transformed signal
    * The ending of the variable (XYZ) indicates the direction in which the signal was measured.
    * Acc or Gyro represents whether signal was captured from accelerometer or the gyroscope
    * Body or Gravity represents whether the signal was separated for the body or Gravity
    * Mean or Std indicates if the variable was calculated as an average or the standard deviation of the raw signals
	

3. tBodyAccMeanX
4. tBodyAccMeanY
5. tBodyAccMeanZ
6. tBodyAccStdX
7. tBodyAccStdY
8. tBodyAccStdZ
9. tGravityAccMeanX
10. tGravityAccMeanY
11. tGravityAccMeanZ
12. tGravityAccStdX
13. tGravityAccStdY
14. tGravityAccStdZ
15. tBodyAccJerkMeanX
16. tBodyAccJerkMeanY
17. tBodyAccJerkMeanZ
18. tBodyAccJerkStdX
19. tBodyAccJerkStdY
20. tBodyAccJerkStdZ
21. tBodyGyroMeanX
22. tBodyGyroMeanY
23. tBodyGyroMeanZ
24. tBodyGyroStdX
25. tBodyGyroStdY
26. tBodyGyroStdZ
27. tBodyGyroJerkMeanX
28. tBodyGyroJerkMeanY
29. tBodyGyroJerkMeanZ
30. tBodyGyroJerkStdX
31. tBodyGyroJerkStdY
32. tBodyGyroJerkStdZ
33. tBodyAccMagMean
34. tBodyAccMagStd
35. tGravityAccMagMean
36. tGravityAccMagStd
37. tBodyAccJerkMagMean
38. tBodyAccJerkMagStd
39. tBodyGyroMagMean
40. tBodyGyroMagStd
41. tBodyGyroJerkMagMean
42. tBodyGyroJerkMagStd
43. fBodyAccMeanX
44. fBodyAccMeanY
45. fBodyAccMeanZ
46. fBodyAccStdX
47. fBodyAccStdY
48. fBodyAccStdZ
49. fBodyAccJerkMeanX
50. fBodyAccJerkMeanY
51. fBodyAccJerkMeanZ
52. fBodyAccJerkStdX
53. fBodyAccJerkStdY
54. fBodyAccJerkStdZ
55. fBodyGyroMeanX
56. fBodyGyroMeanY
57. fBodyGyroMeanZ
58. fBodyGyroStdX
59. fBodyGyroStdY
60. fBodyGyroStdZ
61. fBodyAccMagMean
62. fBodyAccMagStd
63. fBodyBodyAccJerkMagMean
64. fBodyBodyAccJerkMagStd
65. fBodyBodyGyroMagMean
66. fBodyBodyGyroMagStd
67. fBodyBodyGyroJerkMagMean
68. fBodyBodyGyroJerkMagStd
























































































































