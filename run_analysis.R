# Main script to perform data leading and cleaning for UCI HAR dataset
# This script will merge and reshape the data so that output will be only the most interesting data:
#   the average of mean and standart deviation of differect features for each subject and each type
#   of activity

run_analysis <- function()
{
    library(dplyr)
    
    # Loading activity and features labels
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    features <- read.table("UCI HAR Dataset/features.txt")
    
    activity_labels <- activity_labels[, 2]
    features <- features[, 2]
    
    # Loading separate test data tables
    test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
    test_act <- read.table("UCI HAR Dataset/test/y_test.txt")
    test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
    # Loading separate train data tables
    train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
    train_act <- read.table("UCI HAR Dataset/train/y_train.txt")
    train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
    # Combine test & train data into one table
    data <- rbind(train_data, test_data)
    activity <- rbind(train_act, test_act)
    subject <- rbind(train_sub, test_sub)
    
    # Put text feature names in variable names
    names(data) <- features
    names(activity) <- "Activity"
    names(subject) <- "SubjectID"
    
    # Convert activity label into activity name
    activity$Activity <- factor(activity$Activity)
    levels(activity$Activity) <- activity_labels
    
    # Filter only features with 'mean' and 'std' in name
    idx <- (grepl("mean", features) & !grepl("meanFreq", features)) | grepl("std", features)
    data <- data[, idx]
    
    # Finally combine everything in one big data frame
    data = cbind(subject, activity, data)
    
    # Remove extra characters and replace the ones that will be bad for further processing
    names(data) <- gsub("-", "_", names(data))
    names(data) <- gsub("\\(\\)", "", names(data))
    
    # Calculate mean feature for each subject and each type of activity
    summary_data <- data %>% group_by(SubjectID, Activity) %>% summarise_each(funs(mean))

    # Summary data is our target output
    summary_data
}
