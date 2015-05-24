
library(dplyr)

#loading data
test<-read.table("X_test.txt")
train<-read.table("X_train.txt")
features<-read.table("features.txt")
activity<-read.table("activity_labels.txt")
testActiv<-as.factor(scan("y_test.txt"))
trainActiv<-as.factor(scan("y_train.txt"))
testSubject<-as.factor(scan("subject_test.txt"))
trainSubject<-as.factor(scan("subject_train.txt"))

#adding column names - features
names(test)<-features[,2]
names(train)<-features[,2]

#substract required columns of mean i standard deviation
testCol<-c(grep("*mean*",names(test)),grep("*std*",names(test)))
testShort<-test[,testCol]

trainCol<-c(grep("*mean*",names(train)),grep("*std*",names(train)))
trainShort<-train[,trainCol]

#adding column activity numbers
trainShortActiv<-cbind(trainShort,trainActiv)
names(trainShortActiv)[80]<-"Activity"

testShortActiv<-cbind(testShort,testActiv)
names(testShortActiv)[80]<-"Activity"

#adding column subject
trainShortAll<-cbind(trainShortActiv,trainSubject)
names(trainShortAll)[81]<-"Subject"

testShortAll<-cbind(testShortActiv,testSubject)
names(testShortAll)[81]<-"Subject"

#combining tables train and test
shortAll<-rbind(testShortAll,trainShortAll)

#calculating averages
final<-c(1:81) #initialisation of results' vector
for (i in 1:30){
  for(j in 1:6){
    x<-shortAll[(shortAll$Subject==i & shortAll$Activity==j),]
    y<-c(i,j,sapply(x[,1:79],mean))
    
    final<-rbind(final,y)
  }
}
final<-as.data.frame(final)
final<-final[2:nrow(final),]

#inserting column names for Subject and Activity
names(final)[1:2]<-c("Subject","Activity")

#replacing numbers for the activity labels
for (i in 1:6){
  final$Activity<-gsub(activity[i,1],activity[i,2],final$Activity)
}
final$Activity<-as.factor(final$Activity)

#sorting data
final<-group_by(final,Subject) %>%
  arrange(Activity)

#writing tidy data set
write.table(final, file="tidy_dataset.txt", row.name=FALSE)