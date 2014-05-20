## instruction set for project 
## assume all of the necessary files are in your working directory
## which, in my case, is ~/code

## read in all of the data
setwd("~/code")
train      <- read.table("X_train.txt")
train.sub  <- read.table("subject_train.txt")
train.act  <- read.table("y_train.txt")
test       <- read.table("X_test.txt")
test.sub   <- read.table("subject_test.txt")
test.act   <- read.table("y_test.txt")
activities <- read.table("activity_labels.txt")
## cast activities as character, rather than factor
activities$V2 <- as.character(activities$V2)
## glue the train and test stuff together (separately) for future convenience
train      <- cbind(train.sub,train.act,train)
test       <- cbind(test.sub,test.act,test)
## free up some memory
rm(train.sub,train.act,test.sub,test.act)

## merge the train and test data sets
## i chose to merge by rows, interleaving subjects in an obvious
## order (i.e., 1 -> 2 -> ... -> 30)
## note: this "hides" the concept of train vs test, but fits with
## the instructions of the assignment
## according to our provided files, the subjects break down like this:
## sub1  train rows 1:347,     sub2  test rows 1:302,      sub3  train rows 348:688,
## sub4  test rows 303:619,    sub5  train rows 689:990,   sub6  train rows 991:1315,
## sub7  train rows 1316:1623, sub8  train rows 1624:1904, sub9  test rows 620:907,
## sub10 test rows 908:1201,   sub11 train rows 1905:2220, sub12 test rows 1202:1521,
## sub13 test rows 1522:1848,  sub14 train rows 2221:2543, sub15 train rows 2544:2871,
## sub16 train rows 2872:3237, sub17 train rows 3238:3605, sub18 test rows 1849:2212,
## sub19 train rows 3606:3965, sub20 test rows 2213:2566,  sub21 train rows 3966:4373,
## sub22 train rows 4374:4694, sub23 train rows 4695:5066, sub24 test rows 2567:2947,
## sub25 train rows 5067:5475, sub26 train rows 5476:5867, sub27 train rows 5868:6243,
## sub28 train rows 6244:6625, sub29 train rows 6626:6969, sub30 train rows 6970:7352
tmp <- data.frame()
tmp <- rbind(train[1:347,], test[1:302,], train[348:688,], test[303:619,], train[689:1904,], 
             test[620:1201,], train[1905:2220,], test[1202:1848,], train[2221:3605,], 
             test[1849:2212,], train[3606:3965,], test[2213:2566,], train[3966:5066,], 
             test[2567:2947,], train[5067:7352,])
## strip off only the mean and std-dev columns
## i chose to ignore the columns having "*meanfreq*" measurements,
## and instead am only including mean and std-dev columns, which means
## we want only variables 1:6, 41:46, 81:86, 121:126, 161:166, 201:202,
## 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 
## 503:504, 516:517, 529:530, 542:543 of the original data sets
## so we have to increment everything by 2 here to account for the 
## two new columns we've added
tmp <- cbind(tmp[,1:8], tmp[,43:48], tmp[,83:88], tmp[,123:128], tmp[,163:168], 
             tmp[,203:204], tmp[,216:217], tmp[,229:230], tmp[,242:243], tmp[,255:256], 
             tmp[,268:273], tmp[,347:352], tmp[,426:431], tmp[,505:506], tmp[,518:519], 
             tmp[,531:532], tmp[,544:545])

## give descriptive names to the data columns
## commence operation TypeWayTooMuch in 1, 2, 3, ...
colnames(tmp) <- c("subject","activity",
                   "tbodyaccxmean","tbodyaccymean","tbodyacczmean",
                   "tbodyaccxstd","tbodyaccystd","tbodyacczstd",
                   "tgravityaccxmean","tgravityaccymean","tgravityacczmean",
                   "tgravityaccxstd","tgravityaccystd","tgravityacczstd",
                   "tbodyaccjerkxmean","tbodyaccjerkymean","tbodyaccjerkzmean",
                   "tbodyaccjerkxstd","tbodyaccjerkystd","tbodyaccjerkzstd",
                   "tbodygyroxmean","tbodygyroymean","tbodygyrozmean",
                   "tbodygyroxstd","tbodygyroystd","tbodygyrozstd",
                   "tbodygyrojerkxmean","tbodygyrojerkymean","tbodygyrojerkzmean",
                   "tbodygyrojerkxstd","tbodygyrojerkystd","tbodygyrojerkzstd",
                   "tbodyaccmagmean","tbodyaccmagstd",
                   "tgravityaccmagmean","tgravityaccmagstd",
                   "tbodyaccjerkmagmean","tbodyaccjerkmagstd",
                   "tbodygyromagmean","tbodygyromagstd",
                   "tbodygyrojerkmagmean","tbodygyrojerkmagstd",
                   "fbodyaccxmean","fbodyaccymean","fbodyacczmean",
                   "fbodyaccxstd","fbodyaccystd","fbodyacczstd",
                   "fbodyaccjerkxmean","fbodyaccjerkymean","fbodyaccjerkzmean",
                   "fbodyaccjerkxstd","fbodyaccjerkystd","fbodyaccjerkzstd",
                   "fbodygyroxmean","fbodygyroymean","fbodygyrozmean",
                   "fbodygyroxstd","fbodygyroystd","fbodygyrozstd",
                   "fbodyaccmagmean","fbodyaccmagstd",
                   "fbodyaccjerkmagmean","fbodyaccjerkmagstd",
                   "fbodygyromagmean","fbodygyromagstd",
                   "fbodygyrojerkmagmean","fbodygyrojerkmagstd")
## now the data sets are merged, the proper subsets have been made, and
## the variables are labeled in a reasonable fashion
## now to proceed with the output portion

## use the plyr library for colwise application of mean function
library(plyr)
## initialize an output data frame
out <- data.frame()
## loop through the 30 subjects, subsetting each time by subject
## and then by activity.  calculate colwise means for each subject.
## glue together the resulting 1 observation data frames into 
## 6 observation data frame with subject and activity labels.
## at end of loop, glue this data frame (in a row-wise fashion)
## into the output frame
for (i in 1:30) {
     acts <- c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying")
     acts <- as.data.frame(acts)
     acts$acts <- as.character(acts$acts)
     subj <- rep(i,6)
     subj <- as.data.frame(subj)
     subj$subj <- as.numeric(subj$subj)
     subs  <- subset(tmp,tmp$subject == i)
     subs1 <- subset(subs,subs$activity == 1)
     subs1 <- colwise(mean)(subs1[,3:68])
     subs2 <- subset(subs,subs$activity == 2)
     subs2 <- colwise(mean)(subs2[,3:68])
     subs3 <- subset(subs,subs$activity == 3)
     subs3 <- colwise(mean)(subs3[,3:68])
     subs4 <- subset(subs,subs$activity == 4)
     subs4 <- colwise(mean)(subs4[,3:68])
     subs5 <- subset(subs,subs$activity == 5)
     subs5 <- colwise(mean)(subs5[,3:68])
     subs6 <- subset(subs,subs$activity == 6)
     subs6 <- colwise(mean)(subs6[,3:68])
     subs <- rbind(subs1,subs2,subs3,subs4,subs5,subs6)
     outtmp <- cbind(subj,acts,subs)
     out <- rbind(out,outtmp)
}
## we now have our tidy dataset stored in the out data frame
## write the file
write.table(out, file="GCDProject_amaner_05182014.txt", sep="\t",eol="\n",row.names=FALSE)
