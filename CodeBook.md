## CodeBook: project for _Getting and Cleaning Data_


This is how the original DataSet is transformed

1. Training and Test sets ("UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/test/X_test.txt") are merged into one 

2. Feature names are read from "UCI HAR Dataset/features.txt"

..* Only features corresponding to mean and standard deviation of each measurement (i.e., feature names containing string "-mean(" or "-std(" ) are selected

..* Other features are removed from the merged data set computed in step 1

3. Activity ids from the training and test sets ("UCI HAR Dataset/train/Y_train.txt", "UCI HAR Dataset/test/Y_test.txt") are merged together

4. Subject ids from the training and test sets ("UCI HAR Dataset/train/subject_train.txt", "UCI HAR Dataset/test/subject_test.txt") are merged together

5. For each Activity and each User, average values are computed for each variable in merged data set from step 2.

6. A new data set is created from variables computed in step 5

7. Descriptive names are assigned to variables in the new data set

8. Activity ids and User ids are added to the new data set

9. Activity ids are replaced by activity names from "UCI HAR Dataset/activity_info.txt" in the new data set

10. The new data set is written into "tidy_data.txt"


Each record in tidy_data set  contains:
Activity

..* Name of the activity

SubjectID

..* Subject identifier

Each of the folowing variables in tidy_data.txt is an average value (for a given Subject and a given Activity) of the corresponding variable in "UCI HAR Dataset/features.txt" whose name is prefixed by "avg-"

avg-tBodyAcc-mean()-X

avg-tBodyAcc-mean()-Y

avg-tBodyAcc-mean()-Z

avg-tBodyAcc-std()-X

avg-tBodyAcc-std()-Y

avg-tBodyAcc-std()-Z

avg-tGravityAcc-mean()-X

avg-tGravityAcc-mean()-Y

avg-tGravityAcc-mean()-Z

avg-tGravityAcc-std()-X

avg-tGravityAcc-std()-Y

avg-tGravityAcc-std()-Z

avg-tBodyAccJerk-mean()-X

avg-tBodyAccJerk-mean()-Y

avg-tBodyAccJerk-mean()-Z

avg-tBodyAccJerk-std()-X

avg-tBodyAccJerk-std()-Y

avg-tBodyAccJerk-std()-Z

avg-tBodyGyro-mean()-X

avg-tBodyGyro-mean()-Y

avg-tBodyGyro-mean()-Z

avg-tBodyGyro-std()-X

avg-tBodyGyro-std()-Y

avg-tBodyGyro-std()-Z

avg-tBodyGyroJerk-mean()-X

avg-tBodyGyroJerk-mean()-Y

avg-tBodyGyroJerk-mean()-Z

avg-tBodyGyroJerk-std()-X

avg-tBodyGyroJerk-std()-Y

avg-tBodyGyroJerk-std()-Z

avg-tBodyAccMag-mean()

avg-tBodyAccMag-std()

avg-tGravityAccMag-mean()

avg-tGravityAccMag-std()

avg-tBodyAccJerkMag-mean()

avg-tBodyAccJerkMag-std()

avg-tBodyGyroMag-mean()

avg-tBodyGyroMag-std()

avg-tBodyGyroJerkMag-mean()

avg-tBodyGyroJerkMag-std()

avg-fBodyAcc-mean()-X

avg-fBodyAcc-mean()-Y

avg-fBodyAcc-mean()-Z

avg-fBodyAcc-std()-X

avg-fBodyAcc-std()-Y

avg-fBodyAcc-std()-Z

avg-fBodyAccJerk-mean()-X

avg-fBodyAccJerk-mean()-Y

avg-fBodyAccJerk-mean()-Z

avg-fBodyAccJerk-std()-X

avg-fBodyAccJerk-std()-Y

avg-fBodyAccJerk-std()-Z

avg-fBodyGyro-mean()-X

avg-fBodyGyro-mean()-Y

avg-fBodyGyro-mean()-Z

avg-fBodyGyro-std()-X

avg-fBodyGyro-std()-Y

avg-fBodyGyro-std()-Z

avg-fBodyAccMag-mean()

avg-fBodyAccMag-std()

avg-fBodyBodyAccJerkMag-mean()

avg-fBodyBodyAccJerkMag-std()

avg-fBodyBodyGyroMag-mean()

avg-fBodyBodyGyroMag-std()

avg-fBodyBodyGyroJerkMag-mean()

avg-fBodyBodyGyroJerkMag-std()




### Note
run_analysis.R expects the original data set "UCI HAR Dataset.zip" to be unzipped and present in the same folder. The output of the script will be contained in **tidy_data.txt** (also in the same folder).
