
# load training and test data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE) #dim(X_train) = 7352*561
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE) #dim(y_train) = #dim(subject_train) = 7352*1
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)   #dim(X_test) = 2947*561
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)   #dim(y_test) = #dim(subject_test) = 2947*1
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

# get activity and feature names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# label data set with descriptive variable names
names(X_train) = features
y_train[,1] = activity_labels[y_train[,1]]
y_test[,1] = activity_labels[y_test[,1]]
names(y_train) = "Activity_label"
names(subject_train) = "subject"

# Extracts only the measurements on the mean and standard deviation for each measurement
MeanOrStd <- grepl("mean|std", features)  # sum(MeanOrStd) = 79
X_train = X_train[,MeanOrStd]  #dim(X_train) = 7352*79
X_test = X_test[,MeanOrStd]    #dim(X_test) = 2947*79

# combine subject_id, activity_labels and measurements on the mean and std together
train <- cbind(subject_train, y_train, X_train)  #dim(train) = 7352*81
test <- cbind(subject_test, y_test, X_test)      #dim(test) = 2947*81
names(test) = names(train)

# merge train and test data 
UCIdata <- rbind(train, test)   #dim(UCIdata) = 10299*81

# tidy data set with the average of each variable for each activity and each subject
library(reshape2)
UCImelt <- melt(UCIdata, id = c("Activity_label", "subject"), 
                measure.vars = setdiff(names(UCIdata), c("Activity_label", "subject")))
tidy <- dcast(UCImelt, subject + Activity_label ~ variable, mean)  # dim(tidy) =180*81
write.table(tidy, file = "./tidy.txt", row.name=FALSE )


