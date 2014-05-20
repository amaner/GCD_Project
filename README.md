## Getting and Cleaning Data Class Project - README.md

This README file describes how the code (contained in run_analysis.R)
reads in, processes, and outputs data as described in CODEBOOK.md

Assumptions:  All referenced files are in a working directory called "code,"
              which sits inside of the user's home directory.  (I am working
              on a Linux machine, so "~/code" translates to "/home/<my username>/code".)

Pseudocode:

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
* initialize output data frame
* set first column of output frame to be the list of subjects, each repeated 6 times
* set second column of output frame to be the list of activities, 1 - 6 for each subject
* subset tmp frame by subject
* subset subject frames by activity
* calculate per activity means per subject
* store these means in subject frames
* glue subject frames together by row
* column bind subject frames (containing per activity means) with output frame
* cast output activity column as character
* write output frame as a tab-delimited table
