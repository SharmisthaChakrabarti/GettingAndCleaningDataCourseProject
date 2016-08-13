library(dplyr)
library(plyr)


# Download the zipped files in the data folder

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip")


# Unzip the files
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")


# list all files
DataFiles <- list.files("./data/UCI HAR Dataset/", recursive = T)   # listing recurse into directories
# print(DataFiles)            # remove # to print all the files


# Read the files and analyse the structures

      # (a) X_test.txt and X_train.txt will be concatenated together to Feature
      # (b) y_test.txt and y_train.txt will be concatenated together to Activity
      # (c) subject_test.txt and subject_train.txt will be concatenated together to Subject
      # (d) Feature, Activity and Subject will be used as part of descriptive variable names


# Read the Feature files
testFeature  <-  read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
trainFeature <-  read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)


# check: remove # below to check the structures 

      # print("structure of testFeature:")
      # str(testFeature)
      # print("structure of trainFeature:")
      # str(trainFeature)


# Read the Activity files
testActivity  <-  read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
trainActivity <-  read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)


# check: remove # below to check the structures 

      # print("structure of testActivity:")
      # str(testActivity)
      # print("structure of trainActivity:")
      # str(trainActivity)


# Read the Subject files
testSubject  <-  read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
trainSubject <-  read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)


# check: remove # below to check the structures 

      # print("structure of testSubject:")
      # str(testSubject)
      # print("structure of trainSubject:")
      # str(trainSubject)



######################################################################################################
# STEP-1:
# Merge the training and the test sets to create one data set

# Concatenate the data tables by rows
FeatureData  <-  rbind(trainFeature, testFeature)
ActivityData <-  rbind(trainActivity, testActivity)
SubjectData  <-  rbind(trainSubject, testSubject)

# Note: dim(FeatureData) = 10299 X 561, dim(ActivityData) = 10299 X 1, dim(SubjectData) = 10299 X 1


# Set names to variables
names(ActivityData) <- c("activity")
names(SubjectData)  <- c("subject")

# the 561 variable names of FeatureData will come from features.txt
namesFeatureData   <- read.table("./data/UCI HAR Dataset/features.txt")
names(FeatureData) <- namesFeatureData$V2

# Get myData by combining FeatureData, SubjectData and ActivityData
myData <- cbind(FeatureData, SubjectData, ActivityData)



######################################################################################################
#STEP-2:
# Extract only the measurements on the mean and standard deviation for each measurement

namesMeanStd      <- grepl("mean\\(\\)|std\\(\\)" , namesFeatureData$V2)     # returns logical vector


# subset the data set by variable names containing mean() & std()
subsetFeatureData <- subset(FeatureData, select = namesMeanStd)  
myData            <- cbind(subsetFeatureData, SubjectData, ActivityData)

# check: remove # below to check the structures 
      # print("The structure of myData")
      # str(myData)                   



######################################################################################################
#STEP-3:
# Use descriptive activity names to name the activities in the data set


# Read descriptive activity names from "activity_labels.txt"
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = F)

      # Replace activity number by corresponding descriptive activity name
      for(i in 1:nrow(activityLabels))
      {
            myData$activity <- gsub(i, activityLabels$V2[i] , myData$activity)
      }


# factorize the activity variable
myData$activity <- as.factor(myData$activity)

# check: remove # to print the first 30 elements of the activity col

      # print(head(myData$activity, 30))                                  



######################################################################################################
#STEP-4:
# Appropriately label the data set with descriptive variable names

# The variable names in FeatureData are re-labelled with descriptive variable names
names(myData) <- gsub("^t", "time", names(myData))                # prefix 't' is replaced by time
names(myData) <- gsub("^f", "frequency", names(myData))           # prefix 'f' is replaced by frequency
names(myData) <- gsub("Acc", "Accelerometer", names(myData))      # 'Acc' is replaced by Accelerometer
names(myData) <- gsub("Gyro", "Gyroscope", names(myData))         # 'Gyro' is replaced by Gyroscope
names(myData) <- gsub("Mag", "Magnitude", names(myData))          # 'Mag' is replaced by Magnitude
names(myData) <- gsub("BodyBody", "Body", names(myData))          # 'BodyBody' is replaced by Body


# check: remove # to see the names of myData with descriptive variable names

      # print(names(myData))



######################################################################################################
#STEP-5:
# From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject and output it.


tidyData_average <- ddply(myData, .(subject, activity), function(x){colMeans(x[, 1:66])})
# Note: 66 out of 68 columns as the last two cols are subject and activity

write.table(tidyData_average, "./data/tidydata_average.txt", row.names = F)







