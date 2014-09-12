## Note: Please read the ReadMe.RD file before running the script

## Objectives: 
##  1. Merge test and training data sets into one file
##    (X file, Y file and subject file,)
##  2. Extract a subset of variables based on feature names
##      (only the measurements on the mean and standard deviation )
##  3. Uses descriptive activity names to name the activities in the data set
##      (using Activity labels and the Y files)
##  4. Created a tidy set containing mean of the variables for every subject 
##        and activity



# Initialize path for the files

working_dir = getwd()

training_X_file = paste(working_dir,'/X_train.txt', sep='')
training_Y_file = paste(working_dir,'/Y_train.txt', sep='')
training_sub_file = paste(working_dir,'/subject_train.txt', sep='')

test_X_file = paste(working_dir,'/X_test.txt', sep='')
test_Y_file = paste(working_dir,'/Y_test.txt', sep='')
test_sub_file = paste(working_dir,'/subject_test.txt', sep='')

# Read X, Y, subject train and test files into dataframes
train_X_df = read.csv(training_X_file, sep = '', stringsAsFactors = FALSE)
train_Y_df = read.csv(training_Y_file, sep = '', stringsAsFactors = FALSE)
train_sub_df = read.csv(training_sub_file, sep = '', stringsAsFactors = FALSE)
test_X_df = read.csv(test_X_file, sep = '', stringsAsFactors = FALSE)
test_Y_df = read.csv(test_Y_file, sep = '', stringsAsFactors = FALSE)
test_sub_df = read.csv(test_sub_file, sep = '', stringsAsFactors = FALSE)

# Combine X and Y files (with class label as first column)
train_df = cbind(train_sub_df, train_Y_df, train_X_df)
test_df = cbind(test_sub_df, test_Y_df, test_X_df)

# Assign names to the variables using features names in features.txt
# First variable is 'SubjectId', second variable is 'ActivityClass'
# Rest of variables are extracted from Features.txt file

featurenames_df = read.csv(paste(working_dir, '/features.txt', sep=''), 
                           sep='', 
                           col.names = c('featureno','featurename'),
                           stringsAsFactors = FALSE,
                           header=FALSE)

names(train_df) = c('SubjectId', 'ActivityClass', featurenames_df$featurename)
names(test_df) =  c('SubjectId', 'ActivityClass', featurenames_df$featurename)

# Horizontally merge the two datasets
combined_df = rbind(train_df, test_df)

## Extract features that are mean and std deviation of measurement
## Feature names should have the string "mean()" or "std()"

# Get feature names that have the strings mean( or std()
mean_featurenames = grep("mean\\(", featurenames_df$featurename, value=TRUE)
std_featurenames = grep("std\\(", featurenames_df$featurename, value=TRUE)

# Note: First two variables need to be retained
reduced_df = combined_df[,c('SubjectId', 'ActivityClass',
                            mean_featurenames, std_featurenames)]


## Add a new descriptive variable 'ActivityLabel' to the dataframe using 'ActivityClass'
ActivityDescription = ifelse(reduced_df$ActivityClass==1,'WALKING',
                        ifelse(reduced_df$ActivityClass==2, 'WALKING_UPSTAIRS',
                          ifelse(reduced_df$ActivityClass==3, 'WALKING_DOWNSTAIRS',
                            ifelse(reduced_df$ActivityClass==4, 'SITTING',
                              ifelse(reduced_df$ActivityClass==5, 'STANDING',
                                ifelse(reduced_df$ActivityClass==6, 'LAYING',NA))))))
working_df = cbind(reduced_df[1], ActivityDescription, reduced_df[3:67])


## Create a tidy set that summarizes data from previous step by subject and activity

tidy_df = aggregate(working_df[,3:67], 
                    by=list(working_df$SubjectId, working_df$ActivityDescription), 
                    mean)
names(tidy_df)[1] <- 'SubjectId' #Rename columns in the tidy dataset
names(tidy_df)[2] <- 'Activity'  #Rename columns in the tidy dataset

write.table(tidy_df, file = 'tidy_data.txt', row.names=FALSE)