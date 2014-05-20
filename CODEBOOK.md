## Dataset Acquisition

Downloaded data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Dataset Description / Study Design

Data values in this set are derived from 3-axis smartphone accelerometer 
and gyroscope measurements, taken from the smartphones of 30 subjects.  
Measurements were taken at a rate of 50 Hz while subjects performed six 
activities: walking, walking upstairs, walking downstairs, sitting, 
standing, and laying.  Subjects performed each of these activities at 
least twice.

Measurements were filtered in each dimension so as to separate them into 
distinct body (variable names containing the word "bodyacc") and gravity 
(variable names containing the word "gravityacc") acceleration components.  

Time rate of change for these were calculated, yielding jerk components 
(variable names containing the word "jerk," which is the derivative of 
acceleration).  The three dimension (x, y, and z) signals were combined 
and normed to yield 3-dim magnitudes (variable names containing "mag").  
Additionally, FFT was applied to signals to yield frequency-domain 
components.  Note: Variables headed with the letter "t" are in the time 
domain, while variables headed with the letter "f" are in the frequency 
domain.  Time domain measurements are normalized (from -1 to 1) multiples
of the gravity constant g.

This data was provided in two sets: a training set (20 subjects), and a
test set (10 subjects).  The two sets were read in by "run_analysis.R", 
which then interleaved the two sets so as to place the subjects in a
rational order (1-30).  The code then stripped off just those variables
estimating means and standard deviations, and added subject numbers and
activity labels (walking, ...) for each measurement.  It then subsetted
this relatively large, merged dataset into smaller subsets, one for each
subject.  Finally, it calculated PER ACTIVITY AVERAGES for each subject, 
and then glued these averages together into a "tidy" dataset.  This 
dataset has six rows per subject (one per activity), for a total of 
30 * 6 = 180 rows.  It also contains 68 columns, with the first 
containing subject numbers, the second containing activity labels, and
the remaining 66 containing per activity averages.  This final dataset
was output as a tab-delimited text file.

NOTE:  ALL VARIABLES IN COLUMNS 3 - 68 ARE OF CLASS NUMERIC.  COLUMNS 1 & 2
ARE OF CLASS CHARACTER.

## Code Book
* C1  	"subject"           - A subject number (1 - 30)
* C2  	"activity"          - An activity label (walking, walking_upstairs, walking_downstairs, sitting, standing, laying)
* C3  	"tbodyaccxmean"     - per activity (pa) mean of mean time domain body acceleration (acc) x component (comp)
* C4  	"tbodyaccymean"     - pa mean of mean time domain body acc y comp
* C5  	"tbodyacczmean"     - pa mean of mean time domain body acc z comp
* C6  	"tbodyaccxstd"      - pa mean of standard deviation (stdev) of time domain body acc x comp
* C7  	"tbodyaccystd"      - pa mean of stdev of time domain body acc y comp
* C8  	"tbodyacczstd"      - pa mean of stdev of time domain body acc z comp
* C9 	"tgravityaccxmean"  - pa mean of mean time domain gravity acc x comp
* C10 	"tgravityaccymean"  - pa mean of mean time domain gravity acc y comp
* C11 	"tgravityacczmean"  - pa mean of mean time domain gravity acc z comp
* C12 	"tgravityaccxstd"   - pa mean of stdev of time domain gravity acc x comp
* C13 	"tgravityaccystd"   - pa mean of stdev of time domain gravity acc y comp
* C14 	"tgravityacczstd"   - pa mean of stdev of time domain gravity acc z comp
* C15 	"tbodyaccjerkxmean" - pa mean of mean time domain body jerk x comp
* C16 	"tbodyaccjerkymean" - pa mean of mean time domain body jerk y comp
* C17 	"tbodyaccjerkzmean" - pa mean of mean time domain body jerk z comp
* C18 	"tbodyaccjerkxstd"  - pa mean of stdev of time domain body jerk x comp
* C19	"tbodyaccjerkystd"  - pa mean of stdev of time domain body jerk y comp
* C20 	"tbodyaccjerkzstd"  - pa mean of stdev of time domain body jerk z comp
* C21	"tbodygyroxmean"	- pa mean of mean time domain gyroscope (gyro) x comp
* C22	"tbodygyroymean"	- pa mean of mean time domain gyro y comp
* C23	"tbodygyrozmean"	- pa mean of mean time domain gyro z comp
* C24 	"tbodygyroxstd"		- pa mean of stdev of time domain gyro x comp
* C25 	"tbodygyroystd"		- pa mean of stdev of time domain gyro y comp
* C26	"tbodygyrozstd"		- pa mean of stdev of time domain gyro z comp
* C27	"tbodygyrojerkxmean"- pa mean of mean time domain gyro jerk x comp
* C28	"tbodygyrojerkymean"- pa mean of mean time domain gyro jerk y comp
* C29	"tbodygyrojerkzmean"- pa mean of mean time domain gyro jerk z comp
* C30	"tbodygyrojerkxstd" - pa mean of stdev of time domain gyro jerk x comp
* C31	"tbodygyrojerkystd" - pa mean of stdev of time domain gyro jerk y comp
* C32  "tbodygyrojerkzstd"  - pa mean of stdev of time domain gyro jerk z comp
* C33  "tbodyaccmagmean"    - pa mean of mean time domain body acc magnitude (mag)
* C34  "tbodyaccmagstd"     - pa mean of stdev of time domain body acc mag
* C35  "tgravityaccmagmean" - pa mean of mean time domain gravity acc mag
* C36  "tgravityaccmagstd"  - pa mean of stdev of time domain gravity acc mag
* C37  "tbodyaccjerkmagmean"- pa mean of mean time domain body jerk mag
* C38  "tbodyaccjerkmagstd" - pa mean of stdev of time domain body jerk mag
* C39  "tbodygyromagmean"   - pa mean of mean time domain body gyro mag
* C40  "tbodygyromagstd"    - pa mean of stdev of time domain body gyro mag
* C41  "tbodygyrojerkmagmean"- pa mean of mean time domain body gyro jerk mag
* C42  "tbodygyrojerkmagstd" - pa mean of stdev of time domain body gyro jerk mag
* C43  "fbodyaccxmean"      - pa mean of mean body x acc comp in frequency (freq) domain
* C44  "fbodyaccymean"      - pa mean of mean body y acc comp in freq domain
* C45  "fbodyacczmean"      - pa mean of mean body z acc comp in freq domain
* C46  "fbodyaccxstd"		- pa mean of stdev of body x acc comp in freq domain
* C47  "fbodyaccystd"		- pa mean of stdev of body y acc comp in freq domain
* C48  "fbodyacczstd"		- pa mean of stdev of body z acc comp in freq domain
* C49  "fbodyaccjerkxmean"  - pa mean of mean body x jerk comp in freq domain
* C50  "fbodyaccjerkymean"  - pa mean of mean body y jerk comp in freq domain
* C51  "fbodyaccjerkzmean"  - pa mean of mean body z jerk comp in freq domain
* C52  "fbodyaccjerkxstd"   - pa mean of stdev of body x jerk comp in freq domain
* C53  "fbodyaccjerkystd"   - pa mean of stdev of body y jerk comp in freq domain
* C54  "fbodyaccjerkzstd"   - pa mean of stdev of body z jerk comp in freq domain
* C55  "fbodygyroxmean"	    - pa mean of mean body gyro x comp in freq domain
* C56  "fbodygyroymean"	    - pa mean of mean body gyro y comp in freq domain
* C57  "fbodygyrozmean"  	- pa mean of mean body gyro z comp in freq domain
* C58  "fbodygyroxstd"		- pa mean of stdev of body gyro x comp in freq domain
* C59  "fbodygyroystd"  	- pa mean of stdev of body gyro y comp in freq domain
* C60  "fbodygyrozstd"		- pa mean of stdev of body gyro z comp in freq domain
* C61  "fbodyaccmagmean"	- pa mean of mean body acc mag in freq domain
* C62	"fbodyaccmagstd"	- pa mean of stdev of body acc mag in freq domain
* C63  "fbodyaccjerkmagmean"- pa mean of mean body jerk mag in freq domain
* C64  "fbodyaccjerkmagstd" - pa mean of stdev of body jerk mag in freq domain
* C65  "fbodygyromagmean"	- pa mean of mean body gyro mag in freq domain
* C66  "fbodygyromagstd"	- pa mean of stdev of body gyro mag in freq domain
* C67	"fbodygyrojerkmagmean"- pa mean of mean body gyro jerk mag in freq domain
* C68  "fbodygyrojerkmagstd"- pa mean of stdev of bory gyro jerk mag in freq domain
