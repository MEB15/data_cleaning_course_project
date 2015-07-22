library(tidyr)
library(dplyr)
library(plyr)
#
#get project data from web -- zipped datafile
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"wc.zip",mode="wb") 
unzip("wc.zip") #unzips to new folder: UCI HAR Dataset
setwd("./UCI HAR Dataset")
#
#read files
#read variable names("features.txt") and activity labels
features <- read.table("features.txt",stringsAsFactors = FALSE) #these are the variable names, read them as character
labels <- read.table("activity_labels.txt",stringsAsFactors = FALSE) #these are the activity name strings, read as character
#read test and train datasets...x is the data, y contains a key for the activity label, subject contains the subject identifiers
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
#
#combine test and train datasets by row
x <- rbind(x_test,x_train)
y <- rbind(y_test,y_train)
subjects <- rbind(subject_test,subject_train)
#
#add descriptive variable names to x, y and subjects
colnames(x) <- features[,2]
colnames(y) <- c("activity_id")
colnames(subjects) <- c("subject")
#
#combine by columns to one dataset in the order: subjects,y,x
a<-cbind(subjects,y,x)
#
#now replace activity_id keys by appropriate activity labels (strings)
colnames(labels) <- c("activity_id","activity") #add descriptive column names to activity labels
a<-merge(labels,a) #merges by activity_id, with 2nd column called "activity" that contains appropriate string descriptors
a<- a[-1] #remove now redundant activity_id column
a<-a[,c(2,1,3:563)] #put subject column first
a<-arrange(a,subject,activity) #arrange data by subject then activity..."a" is a tidy data set of all the raw data
#
#select columns with mean and std deviation data -- these contain the strings "mean" or "std" in the variable name
cols_w_mean <- grep("mean",names(a)) #find variable names with "mean" in them
cols_w_std <- grep("std",names(a)) #find variable names with "std" in them
cols_to_keep <- c(as.integer(c(1,2)),cols_w_mean,cols_w_std) #list of columns to extract
cols_to_keep <- sort(cols_to_keep) #ordered list
a_subset <- a[,cols_to_keep] #a_subset is a tidy set containing only the mean and standard deviation for each variable
#
#now create a "second, independent tidy data set with the average of each variable for each activity and each subject"
tds <- a_subset %>% ddply(.(subject,activity),colwise(mean)) #use ddply to split a_subset (by subject and activity) and apply mean function by column
write.table(tds,file="tidy_data.txt",row.names = FALSE)
#should be read with read.table and header=TRUE
