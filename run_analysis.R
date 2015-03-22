
#####################################################################
###Merge the training and the test sets to create one data set

###read in data for test subjects 
test_ActL<-read.table("UCI HAR Dataset//test/y_test.txt")
test_Features<-read.table("UCI HAR Dataset//test/X_test.txt")
test_Subjects<-read.table("UCI HAR Dataset//test/subject_test.txt")

##combine values of SubjectID, ActivityID and Feature vector into a single test data frame
test_Set<-cbind(test_Subjects,test_ActL,test_Features)

###read in data for train subjects
train_ActL<-read.table("UCI HAR Dataset//train/y_train.txt")
train_Features<-read.table("UCI HAR Dataset//train/X_train.txt")
train_Subjects<-read.table("UCI HAR Dataset//train/subject_train.txt")

##combine values of SubjectID, ActivityID and Feature vector into a single train data frame
train_Set<-cbind(train_Subjects,train_ActL,train_Features)

#join data sets (combine rows from test and train sets)
FullSet<-rbind(test_Set,train_Set)

###################################################################
###Add descriptive variable names

##get features names (561)
Features_data<-read.table("UCI HAR Dataset//features.txt")
Features_names<-Features_data[,2]

#convert from factor to character class
Features_names<-as.character(Features_names)

##make names for subject and activity columns (variables 1 and 2 in FullSet)
first2ColNames<-c("Subject_ID", "Activity_ID")

#combine variable names
AllVarNames<-c(first2ColNames,Features_names)

#change variable names in the FullSet to descriptive names
colnames(FullSet)<-AllVarNames

#################################################################
###Change activity_ID values to descriptive names

##Get descriptive names for activity labels 
activityNames<-read.table("UCI HAR Dataset//activity_labels.txt")

#change var names in activityNames data frame
colnames(activityNames)<-c("Activity_ID","Activity_Name")

#merge activityNames data frame with FullSet by Activity_ID variable
FullSet<-merge(activityNames, FullSet,all=TRUE)

#remove activity_ID variable since now there are descriptive names for each activity 
FullSet$Activity_ID<-NULL


#######################################################################
###Extracts only the measurements on the mean and standard deviation for each measurement

##get a vector of column names
VarNames<-names(FullSet)

##get column numbers of the variable names that match "mean()" and "std()" string
MatchMean<-grep("mean()",VarNames,fixed=TRUE)
MatchStd<-grep("std()",VarNames,fixed=TRUE)
MatchBoth<-c(MatchMean,MatchStd)

##get subset of FullSet that only includes mean and std measures
Mean_Std<-FullSet[,c(1,2,MatchBoth)]


#############################################################################
###get data set with the average of each variable for each activity and each subject

##make summary of means in Mean_Std dataframe by 2 factors 
Summary<-aggregate(x=Mean_Std[,c(3:68)], by=list(Mean_Std$Subject_ID, Mean_Std$Activity_Name),FUN="mean")

#change Var names of factor variables
colnames(Summary)[1]<-"Subject_ID"
colnames(Summary)[2]<-"Activity_Name"

# write output
write.table(Summary, file="Summary_Means_BySubject_By_Activity.txt", row.names = FALSE)

############################## DONE #########################################
