library(plyr)
library(dplyr) 
library(data.table)

ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")

colnames(xtrain) <- t(features[2])
colnames(xtest) <- t(features[2])

xtrain[,c("Participant","Activity")] <- cbind(subject_train[, 1],ytrain[, 1])
xtest[,c("Participant","Activity")] <- cbind(subject_test[, 1],ytest[, 1])
x_mat <- rbind(xtrain, xtest)

x_mean <- grep("mean()", names(x_mat), value = FALSE, fixed = TRUE)
x_sd <- grep("std()", names(x_mat), value = FALSE)
mean_sd <-cbind(x_mat[,c("Participant","Activity")],x_mat[c(x_mean,x_sd)])

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("act num","Activity"))
activity_labels$Activity <- gsub("_"," ",activity_labels$Activity)
first_letter <- toupper(substr(activity_labels$Activity,1,1))
rest_letters <- tolower(substr(activity_labels$Activity,2,nchar(activity_labels$Activity)))
activity_labels$Activity <- paste0(first_letter,rest_letters)
activity_labels$Activity <- as.factor(activity_labels$Activity)

with_act <- merge(activity_labels,mean_sd,by.x="act.num",by.y="Activity")
with_act <- with_act[order(with_act$Participant),][,-1]
new_data <- cbind(Participant=with_act$Participant,with_act[,-2])

names(new_data) <- gsub("^t", "Time", names(new_data))
names(new_data) <- gsub("^f", "Frequency", names(new_data))
names(new_data) <- gsub("BodyBody","Body", names(new_data))
names(new_data) <- gsub("Acc", "Accelerometer", names(new_data))
names(new_data) <- gsub("Mag", "Magnitude", names(new_data))
names(new_data) <- gsub("Gyro", "Gyroscope", names(new_data))
names(new_data) <- gsub("mean", "Mean", names(new_data))
names(new_data) <- gsub("std", "SD", names(new_data))
names(new_data) <- gsub("\\()", "", names(new_data))

all_data <- data.table(new_data)
averages <- ddply(all_data, .(Participant, Activity), function(x) colMeans(x[,3:ncol(x)]))

write.table(averages, file = "Project/Tidy Dataset.txt", row.names = FALSE)