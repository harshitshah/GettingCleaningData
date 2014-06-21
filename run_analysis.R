# Get the measurements corresponding to mean and std of each measurement
features <- (read.table("UCI HAR Dataset//features.txt", stringsAsFactors = F))[[2]]
requiredColumns <- grep("-mean[(]|-std[(]", features)

# Read training set
trainingSet <- read.table("UCI HAR Dataset//train//X_train.txt")
names(trainingSet) <- features
trainingSet <- trainingSet[, requiredColumns]
trainingLabels <- read.table("UCI HAR Dataset//train//y_train.txt")[[1]]
trainingSubjects <- read.table("UCI HAR Dataset//train//subject_train.txt")[[1]]

# Read test set
testSet <- read.table("UCI HAR Dataset/test//X_test.txt")
names(testSet) <- features
testSet <- testSet[, requiredColumns]
testLabels <- read.table("UCI HAR Dataset//test//y_test.txt")[[1]]
testSubjects <- read.table("UCI HAR Dataset//test//subject_test.txt")[[1]]

Labels <- c(trainingLabels, testLabels)
LabelLevels <- sort(unique(Labels))
Subjects <- c(trainingSubjects, testSubjects)
SubjectLevels <- sort(unique(Subjects))

# Merge training and test sets
mergedSet <- rbind(trainingSet, testSet)

# Compute means of variables for each activity and each user
tempFunc1 <- function(x) {
        tapply(x, list(Labels, Subjects), mean)
}
tempOutput <- lapply(mergedSet, tempFunc1)

# Generate tidy data set
tidyData <- expand.grid(LabelLevels, SubjectLevels)
tempFunc2 <- function(x) {
        tidyData <<- cbind(tidyData, as.numeric(x))
}
lapply(tempOutput, tempFunc2)

# Assign descriptive names to variables
descNames <- paste("avg-", names(tempOutput), sep = "")
names(tidyData) <- c("Activity", "SubjectID", descNames)

# Assign descriptive names to Activities
ActivityLabels <- read.table("UCI HAR Dataset//activity_labels.txt", stringsAsFactors = F)
for (i in 1:nrow(tidyData)) {
        tidyData$Activity[i] <- ActivityLabels[tidyData$Activity[i], 2]
}

# Write the new data set into a text file
write.table(tidyData, "tidy_data.txt", sep = " ", quote = F, row.names= F)

# Remove unnecessary objects
rm(list = c("features", "LabelLevels", "Labels", "mergedSet", 
            "requiredColumns", "SubjectLevels", "Subjects", "tempFunc1", 
            "tempFunc2", "tempOutput", "testLabels", "testSet", "i", 
            "ActivityLabels", "testSubjects", "trainingLabels", "trainingSet", 
            "trainingSubjects", "descNames", "tidyData"))