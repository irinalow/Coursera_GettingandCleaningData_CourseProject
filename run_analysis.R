library(dplyr)

# Step 0: reading data
    ## features
    features <- read.table("UCI HAR Dataset/features.txt") %>%
      rename(index= V1,
             feature= V2)
    features_names <- as.character(features$feature)
    
    ## train
    train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
    train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")
    train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    train <- cbind(train_x, train_y) %>%
      cbind(train_subject)
    
    ## test 
    test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
    test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
    test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    test <- cbind(test_x, test_y) %>%
      cbind(test_subject)

    
# Step 1: Merges the training and the test sets to create one data set.
    df <- rbind(train, test)
    colnames(df) <- c(features_names, "act_label", "subject")
    
    names(df)
    
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
    features_wanted <- features[grepl("mean|std", features$feature),]
    features_wanted_index <- features_wanted$index
    
    df_sub <- df[, c(features_wanted_index, 562:563)]

# Step 3: uses descriptive activity names to name the activities in the data set
    # This is done by reading the labels from the activity_labels.txt file
    activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')
    colnames(activity_labels) <- c("act_label", "activity")
    df_sub <- merge(df_sub, activity_labels, by="act_label")
    names(df_sub)

# Step 4: Appropriately labels the data set with descriptive variable names.    
    df_sub_names <- names(df_sub)
    descriptive_names <- gsub("^t", "TimeDomain_", df_sub_names)
    descriptive_names <-  gsub("Acc", "Accelerometer", descriptive_names)
    descriptive_names <- gsub("[(][)]", "", descriptive_names)
    descriptive_names <-  gsub("-mean-", "_Mean_", descriptive_names)
    descriptive_names <-  gsub("-std-", "_StandardDeviation_", descriptive_names)
    descriptive_names <-  gsub("Gyro", "Gyroscope", descriptive_names)
    descriptive_names <- gsub("^f", "FrequencyDomain_", descriptive_names)
    descriptive_names <- gsub("Mag", "Magnitude", descriptive_names)
    descriptive_names <- gsub("-", "_", descriptive_names)
    descriptive_names <- gsub("_mean", "_Mean", descriptive_names)
    descriptive_names <- gsub("_std", "_StandardDeviation", descriptive_names)
    
    df_sub_renamed <- df_sub
    names(df_sub_renamed) <- descriptive_names  
    
# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.    df_averaged <- df_sub_renamed %>%
      group_by(activity, subject) %>%
      summarise_each(mean) %>%
      arrange(activity, subject)
    
    write.table(df_averaged, file="./tidydata.txt",row.name=FALSE) 
    write.csv(df_averaged, "./tidydata.csv")
    
