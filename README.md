## Course project for _Getting and Cleaning Data_

This project uses the [Human Activity Recognition Using Smartphones Dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from the [UCI Machine Learning Repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The project includes an R script file **run_analysis.R**. It reads data from the _UCI HAR_ dataset and generates another data set. The output data set is stored in a file called **tidy_data.txt**. 

For details on the UCI HAR data set, please refer to the README.txt contained in the data set.

run_analysis.R transforms the UCI HAR dataset as follows:
1. It merges the training and test data sets.
2. It extracts only the mean and standard deviations of each measurement.
3. Labels the variables of output data set with descriptive names.
4. Labels the activity ids with descriptive names.
5. Generates a new data set with average of each variable for each activity and each subject.

**CodeBook.md** describes the transformations performed on input dataset and variables contained in tidy_data.txt 

### Note
run_analysis.R expects the original data set "UCI HAR Dataset.zip" to be unzipped and present in the same folder. The output of the script will be contained in **tidy_data.txt** (also in the same folder).
