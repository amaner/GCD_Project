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
colnames(tmp) <- c("Subject","Activity",
                   "tBodyAccXmean","tBodyAccYmean","tBodyAccZmean",
                   "tBodyAccXstd","tBodyAccYstd","tBodyAccZstd",
                   "tGravityAccXmean","tGravityAccYmean","tGravityAccZmean",
                   "tGravityAccXstd","tGravityAccYstd","tGravityAccZstd",
                   "tBodyAccJerkXmean","tBodyAccJerkYmean","tBodyAccJerkZmean",
                   "tBodyAccJerkXstd","tBodyAccJerkYstd","tBodyAccJerkZstd",
                   "tBodyGyroXmean","tBodyGyroYmean","tBodyGyroZmean",
                   "tBodyGyroXstd","tBodyGyroYstd","tBodyGyroZstd",
                   "tBodyGyroJerkXmean","tBodyGyroJerkYmean","tBodyGyroJerkZmean",
                   "tBodyGyroJerkXstd","tBodyGyroJerkYstd","tBodyGyroJerkZstd",
                   "tBodyAccMagmean","tBodyAccMagstd",
                   "tGravityAccMagmean","tGravityAccMagstd",
                   "tBodyAccJerkMagmean","tBodyAccJerkMagstd",
                   "tBodyGyroMagmean","tBodyGyroMagstd",
                   "tBodyGyroJerkMagmean","tBodyGyroJerkMagstd",
                   "fBodyAccXmean","fBodyAccYmean","fBodyAccZmean",
                   "fBodyAccXstd","fBodyAccYstd","fBodyAccZstd",
                   "fBodyAccXmean","fBodyAccYmean","fBodyAccZmean",
                   "fBodyAccXstd","fBodyAccYstd","fBodyAccZstd",
                   "fBodyGyroXmean","fBodyGyroYmean","fBodyGyroZmean",
                   "fBodyGyroXstd","fBodyGyroYstd","fBodyGyroZstd",
                   "fBodyAccMagmean","fBodyAccMagstd",
                   "fBodyAccJerkMagmean","fBodyAccJerkMagstd",
                   "fBodyGyroMagmean","fBodyGyroMagstd",
                   "fBodyGyroJerkMagmean","fBodyGyroJerkMagstd")
## now the data sets are merged, the proper subsets have been made, and
## the variables are labeled in a reasonable fashion
## now to proceed with the output portion

## initialize the output data frame
out <- data.frame()
## first column is the list of subjects
## each appears 6 times because each did all 6 activities
for (i in 1:6)   out[i,1] = 1
for (i in 7:12)  out[i,1] = 2
for (i in 13:18) out[i,1] = 3
for (i in 19:24) out[i,1] = 4
for (i in 25:30) out[i,1] = 5
for (i in 31:36) out[i,1] = 6
## second column is activities
for (i in 1:6)   out[i,2] = activities$V2[i]
for (i in 7:12)  out[i,2] = activities$V2[i-6]
for (i in 13:18) out[i,2] = activities$V2[i-12]
for (i in 19:24) out[i,2] = activities$V2[i-18]
for (i in 25:30) out[i,2] = activities$V2[i-24]
for (i in 31:36) out[i,2] = activities$V2[i-30]
## give meaningful names to out columns
colnames(out) <- c("Subject","Activity")
## start to pull out the means for each column in our data frame
## use the plyr library for colwise application of mean function
library(plyr)
## create subsets for each subject
sub1 <- subset(tmp,tmp$Subject == 1)
sub2 <- subset(tmp,tmp$Subject == 2)
sub3 <- subset(tmp,tmp$Subject == 3)
sub4 <- subset(tmp,tmp$Subject == 4)
sub5 <- subset(tmp,tmp$Subject == 5)
sub6 <- subset(tmp,tmp$Subject == 6)
## subset each by activity
sub11 <- subset(sub1,sub1$Activity == 1)
sub12 <- subset(sub1,sub1$Activity == 2)
sub13 <- subset(sub1,sub1$Activity == 3)
sub14 <- subset(sub1,sub1$Activity == 4)
sub15 <- subset(sub1,sub1$Activity == 5)
sub16 <- subset(sub1,sub1$Activity == 6)
sub21 <- subset(sub2,sub2$Activity == 1)
sub22 <- subset(sub2,sub2$Activity == 2)
sub23 <- subset(sub2,sub2$Activity == 3)
sub24 <- subset(sub2,sub2$Activity == 4)
sub25 <- subset(sub2,sub2$Activity == 5)
sub26 <- subset(sub2,sub2$Activity == 6)
sub31 <- subset(sub3,sub3$Activity == 1)
sub32 <- subset(sub3,sub3$Activity == 2)
sub33 <- subset(sub3,sub3$Activity == 3)
sub34 <- subset(sub3,sub3$Activity == 4)
sub35 <- subset(sub3,sub3$Activity == 5)
sub36 <- subset(sub3,sub3$Activity == 6)
sub41 <- subset(sub4,sub4$Activity == 1)
sub42 <- subset(sub4,sub4$Activity == 2)
sub43 <- subset(sub4,sub4$Activity == 3)
sub44 <- subset(sub4,sub4$Activity == 4)
sub45 <- subset(sub4,sub4$Activity == 5)
sub46 <- subset(sub4,sub4$Activity == 6)
sub51 <- subset(sub5,sub5$Activity == 1)
sub52 <- subset(sub5,sub5$Activity == 2)
sub53 <- subset(sub5,sub5$Activity == 3)
sub54 <- subset(sub5,sub5$Activity == 4)
sub55 <- subset(sub5,sub5$Activity == 5)
sub56 <- subset(sub5,sub5$Activity == 6)
sub61 <- subset(sub6,sub6$Activity == 1)
sub62 <- subset(sub6,sub6$Activity == 2)
sub63 <- subset(sub6,sub6$Activity == 3)
sub64 <- subset(sub6,sub6$Activity == 4)
sub65 <- subset(sub6,sub6$Activity == 5)
sub66 <- subset(sub6,sub6$Activity == 6)
## take the colwise means and glue back into each subject frame
## free up memory as you go
sub11 <- colwise(mean)(sub11[,3:68])
sub12 <- colwise(mean)(sub12[,3:68])
sub13 <- colwise(mean)(sub13[,3:68])
sub14 <- colwise(mean)(sub14[,3:68])
sub15 <- colwise(mean)(sub15[,3:68])
sub16 <- colwise(mean)(sub16[,3:68])
sub1  <- rbind(sub11,sub12,sub13,sub14,sub15,sub16)
rm(sub11,sub12,sub13,sub14,sub15,sub16)
sub21 <- colwise(mean)(sub21[,3:68])
sub22 <- colwise(mean)(sub22[,3:68])
sub23 <- colwise(mean)(sub23[,3:68])
sub24 <- colwise(mean)(sub24[,3:68])
sub25 <- colwise(mean)(sub25[,3:68])
sub26 <- colwise(mean)(sub26[,3:68])
sub2  <- rbind(sub21,sub22,sub23,sub24,sub25,sub26)
rm(sub21,sub22,sub23,sub24,sub25,sub26)
sub31 <- colwise(mean)(sub31[,3:68])
sub32 <- colwise(mean)(sub32[,3:68])
sub33 <- colwise(mean)(sub33[,3:68])
sub34 <- colwise(mean)(sub34[,3:68])
sub35 <- colwise(mean)(sub35[,3:68])
sub36 <- colwise(mean)(sub36[,3:68])
sub3  <- rbind(sub31,sub32,sub33,sub34,sub35,sub36)
rm(sub31,sub32,sub33,sub34,sub35,sub36)
sub41 <- colwise(mean)(sub41[,3:68])
sub42 <- colwise(mean)(sub42[,3:68])
sub43 <- colwise(mean)(sub43[,3:68])
sub44 <- colwise(mean)(sub44[,3:68])
sub45 <- colwise(mean)(sub45[,3:68])
sub46 <- colwise(mean)(sub46[,3:68])
sub4  <- rbind(sub41,sub42,sub43,sub44,sub45,sub46)
rm(sub41,sub42,sub43,sub44,sub45,sub46)
sub51 <- colwise(mean)(sub51[,3:68])
sub52 <- colwise(mean)(sub52[,3:68])
sub53 <- colwise(mean)(sub53[,3:68])
sub54 <- colwise(mean)(sub54[,3:68])
sub55 <- colwise(mean)(sub55[,3:68])
sub56 <- colwise(mean)(sub56[,3:68])
sub5 <- rbind(sub51,sub52,sub53,sub54,sub55,sub56)
rm(sub51,sub52,sub53,sub54,sub55,sub56)
sub61 <- colwise(mean)(sub61[,3:68])
sub62 <- colwise(mean)(sub62[,3:68])
sub63 <- colwise(mean)(sub63[,3:68])
sub64 <- colwise(mean)(sub64[,3:68])
sub65 <- colwise(mean)(sub65[,3:68])
sub66 <- colwise(mean)(sub66[,3:68])
sub6  <- rbind(sub61,sub62,sub63,sub64,sub65,sub66)
rm(sub61,sub62,sub63,sub64,sub65,sub66)
## now glue all of the subsets together
sub <- rbind(sub1,sub2,sub3,sub4,sub5,sub6)
## glue out and sub together to make the tidy output frame
out <- cbind(out,sub)
out$Activity <- as.character(out$Activity)
## free up a bunch of memory
rm(sub1,sub2,sub3,sub4,sub5,sub6,tmp,test,train,activities,sub)
## write the file
write.table(out, file="GCDProject_amaner_05182014.txt", sep=" ",eol="\n",row.names=FALSE)