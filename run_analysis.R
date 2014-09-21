# Coursera: Data Science Track: Getting and Cleaning Data
# Peer Assessment
#Set Working Directory
setwd("C:/Users/balaji.n/Desktop/Coursera/Getting & Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
#1 - Merging test and training datasets
#Read the test data and the corresponding Activity and Subject
test_data<-read.table("test//X_test.txt")
test_data[,562]<-read.csv("test//Y_test.txt", sep="", header=FALSE)
test_data[,563]<-read.csv("test//subject_test.txt", sep="", header=FALSE)
test_data_label<-read.table("features.txt")

#Read the train data and the corresponding Activity and Subject
train_data<-read.table("train//X_train.txt")
train_data[,562]<-read.csv("train//y_train.txt", sep="", header=FALSE)
train_data[,563]<-read.csv("train//subject_train.txt", sep="", header=FALSE)

#Combine the test & training dataset
final_dataset<-rbind(test_data,train_data)

#2- Extracting measurements on the mean and standard dev for each measurement
#Standardize the feature names 
test_data_label[,2]<-gsub('-mean','Mean',test_data_label[,2])
test_data_label[,2]<-gsub('-std','Std',test_data_label[,2])
test_data_label[,2]<-gsub('[-()]','',test_data_label[,2])
#Get the data corresponding to mean and standard deviation for each of the measurement
Columns<-grep(".*Mean.*|.*Std.*",test_data_label[,2])
#Identify the columns corresponding the features required
test_data_label<-test_data_label[Columns,]
#Add the columns containing data corresponding to Activity and Subject
Columns<-c(Columns,562,563)
#Reduce the final dataset to contain only the relavant columns
final_dataset<-final_dataset[,Columns]
#4- Add the column names to the dataset
colnames(final_dataset)<-c(test_data_label$V2,"Activity","subject")

#3 - Adding descriptive activity names to the names in the dataset
activityLabels <- read.csv("activity_labels.txt", sep="", header=FALSE)
currentActivity=1
for(currentActivityLabels in activityLabels$V2)
{
	final_dataset$Activity<-gsub(currentActivity,currentActivityLabels,final_dataset$Activity)
	currentActivity = currentActivity +1
}

final_dataset$Activity <- as.factor(final_dataset$Activity)
final_dataset$subject <- as.factor(final_dataset$subject)

#5 - Creating an independent dataset
#Creating an independent dataset with the average of each variable for each activity and each subject.
tidy = aggregate(final_dataset, by=list(Activity = final_dataset$Activity, subject=final_dataset$subject), mean)
tidy<-tidy[,1:88]
#Save the dataset
write.table(tidy,"tidy.txt",sep="\t",row.names = FALSE)