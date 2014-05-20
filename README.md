## Getting and Cleaning Data Class Project - README.md

This README file describes how the code (contained in run_analysis.R)
reads in, processes, and outputs data as described in CODEBOOK.md

Assumptions:  All referenced files are in a working directory called "code,"
              which sits inside of the user's home directory.  (I am working
              on a Linux machine, so "~/code" translates to "/home/<my username>/code".)

Pseudocode/steps:

* set the working directory to ~/code
* read in training dataset into data frame train
* read in training subjects list into data frame train.sub
* read in training activities list (as numbers) into data frame train.act
* read in test dataset into data frame test
* read in test subjects list into data frame test.sub
* read in test activities list (as numbers) into data frame test.act
* read in activities (as char) into data frame activities
* cast 2nd col of activities as char (default is factor)
* column bind train.sub, train.act, and train into train frame
* column bind test.sub, test.act, and test into test frame
* create tmp data frame
* row bind test and train frames, interleaving subjects in numeric order, into tmp
* remove columns not required for assignment (leaving only mean and std vars)
* give the columns of tmp relevant and readable variable names
* load the plyr library for colwise mean application
* initialize output data frame
* loop through subjects (i = 1:30) doing the following:
* subset tmp by subject == i
* subset subject frame by activity (1 - 6)
* for each activity-based subset, calculate colwise means and store in activity-based subset
* row bind the new single observation (66 variable) subsets into a 6 observation subset
* make a temporary activities frame containing the 6 activity labels
* make a temporary subject number frame containing i repeated 6 times
* column bind subject number frame, activities frame, and 6 observation subset into temporary output frame
* rowbind temporary output frame onto real output frame
* at end of loop, write output frame as a tab-delimited table
