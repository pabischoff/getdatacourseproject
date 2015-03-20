library(dplyr)

#download folder and extract files to separate data frames
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
rawfeatures <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))
rawxtrain <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
rawytrain <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
rawxtest <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
rawytest <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
rawsubjecttrain <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
rawsubjecttest <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
unlink(temp)

#add column names to raw test and train data sets
colnames(rawxtest) <- rawfeatures$V2
colnames(rawxtrain) <- rawfeatures$V2

#add subject numbers as first column of both data sets
rawxtest <- cbind(subject = rawsubjecttest$V1, rawxtest)
rawxtrain <- cbind(subject = rawsubjecttrain$V1, rawxtrain)

#add activity numbers as first column of both data sets
rawxtest <- cbind(ActivityNumber = rawytest$V1, rawxtest)
rawxtrain <- cbind(ActivityNumber = rawytrain$V1, rawxtrain)

#combine train and test data sets into a single data frame
rawX <- rbind(rawxtest,rawxtrain)

#remove all the rows that don't contain means or standard deviations
cleanX <- rawX[, grep("mean\\(\\)|std\\(\\)|subject|ActivityNumber", colnames(rawX))]

#replace activity numbers with descriptive labels...
activitylabels <- c(WALKING=1, WALKING_UP=2, WALKING_DOWN=3,
                    SITTING=4, STANDING=5, LAYING=6)
cleanX$ActivityLabel <- names(activitylabels)[match(cleanX$ActivityNumber, activitylabels)]

#... and move it to the front
tidyX <- cbind(Activity = cleanX$ActivityLabel, cleanX)
tidyX$ActivityLabel <- NULL

#convert subject and activity numbers to numeric so we can average them
tidyX$ActivityNumber <- sapply(tidyX$ActivityNumber, as.numeric)
tidyX$subject <- sapply(tidyX$subject, as.numeric)

#create a new independent tidy data set with the average
#of each variable for each activity and each subject.
subject.n <- 1
while(subject.n <= 30){
      activity.n <- 1
      while(activity.n <= 6){
            #filter out each set of desired observations
            #one at a time by activity and subject
            actsub <- filter(tidyX, ActivityNumber == activity.n & subject == subject.n)
            
            #get the average for each variable
            average <- colMeans(actsub[4:69], na.rm = TRUE)
            
            #add it to the new data set (create it if it doesn't exist)
            if(!exists("averages")){
                  averages <- average
            }
            else{
                  averages <- rbind(averages, average)
            }
            activity.n <- activity.n+1
      }
      subject.n <- subject.n+1
}

#get rid of annoying rownames
rownames(averages) <- NULL


#convert back to data frame and re-add activity labels to front
solutiondata <- data.frame(averages)
ActivityNumber <- rep(c(1:6), 30)
SubjectNumber <- rep(c(1:30),6)
solutiondata <- cbind(ActivityNumber, solutiondata)
solutiondata <- cbind(SubjectNumber, solutiondata)
solutiondata$ActivityLabel <- names(activitylabels)[match(solutiondata$ActivityNumber, activitylabels)]
solutiondata <- cbind(Activity = solutiondata$ActivityLabel, solutiondata)
solutiondata$ActivityLabel <- NULL

#output file
write.table(solutiondata, file = "getdatacourseproject.txt", sep = "\t\t", eol = "\n", row.names=FALSE)
