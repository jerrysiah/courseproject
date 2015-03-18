library(dplyr)
library(plyr)

#Step 1:  Read data files and merge them
#read test data and column merge them
subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y <- read.table("./UCI HAR Dataset/test/y_test.txt")
x <- read.table("./UCI HAR Dataset/test/X_test.txt")
testdata <- cbind(subject, y, x)

#read train data and column merge them
subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y <- read.table("./UCI HAR Dataset/train/y_train.txt")
x <- read.table("./UCI HAR Dataset/train/X_train.txt")
dataset <- cbind(subject, y, x)

#row merge both train and test data
dataset <- rbind(dataset, testdata)

colnames(dataset)[1:2] <- c("SubjectID","Activity")

#Step 2: Extract measurements on mean and standard deviation for each measurement
features <- read.table("./UCI HAR Dataset/features.txt")

#get positions of measurements with mean and std() as labels
selectmeanstd <- c(grep("mean", features$V2, fixed=TRUE), grep("std()", features$V2, fixed=TRUE))
selector <- selectmeanstd + 2
selector <- sort(c(1, 2, selector))

#extract Subject ID, Activity and required measurements
dataset <- select(dataset, selector)

#Step 3: Name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
dataset[,2] <- apply(dataset[2], 2, function(x) x <- activity_labels[x, 2])

#Step 4: Assign labels to the data set
labels <- features[selectmeanstd, 2]
labels <- c("SubjectID", "Activity", as.character(labels))
colnames(dataset) <- labels

#Step 5: Get the average of each variable for each activity and each subject.

y <- ddply(dataset, c("SubjectID", "Activity"), function(x) {
                                                    tempdf = x[, -c(1,2)]
                                                    return(colMeans(tempdf))})

#output tidy data set
write.table(y, file="tdydata.txt", row.name=FALSE)
data <- read.table("tdydata.txt", header=TRUE)
View(data)
