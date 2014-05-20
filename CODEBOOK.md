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
Col  Label   Description
1  	"subject" - A subject number (1 - 30)
2  	"activity" - An activity label (walking, walking_upstairs, 
                 walking_downstairs, sitting, standing, laying)
3  	"tbodyaccxmean"     - per activity (pa) mean of mean time domain 
						  body acceleration (acc) x component (comp)
4  	"tbodyaccymean"     - pa mean of mean time domain body acc y comp
5  	"tbodyacczmean"     - pa mean of mean time domain body acc z comp
6  	"tbodyaccxstd"      - pa mean of standard deviation (stdev) of time 
						  domain body acc x comp
7  	"tbodyaccystd"      - pa mean of stdev of time domain body acc y comp
8  	"tbodyacczstd"      - pa mean of stdev of time domain body acc z comp
9 	"tgravityaccxmean"  - pa mean of mean time domain gravity acc x comp
10 	"tgravityaccymean"  - pa mean of mean time domain gravity acc y comp
11 	"tgravityacczmean"  - pa mean of mean time domain gravity acc z comp
12 	"tgravityaccxstd"   - pa mean of stdev of time domain gravity acc x comp
13 	"tgravityaccystd"   - pa mean of stdev of time domain gravity acc y comp
14 	"tgravityacczstd"   - pa mean of stdev of time domain gravity acc z comp
15 	"tbodyaccjerkxmean" - pa mean of mean time domain body jerk x comp
16 	"tbodyaccjerkymean" - pa mean of mean time domain body jerk y comp
17 	"tbodyaccjerkzmean" - pa mean of mean time domain body jerk z comp
18 	"tbodyaccjerkxstd"  - pa mean of stdev of time domain body jerk x comp
19	"tbodyaccjerkystd"  - pa mean of stdev of time domain body jerk y comp
20 	"tbodyaccjerkzstd"  - pa mean of stdev of time domain body jerk z comp
21	"tbodygyroxmean"	- pa mean of mean time domain gyroscope (gyro) x comp
22	"tbodygyroymean"	- pa mean of mean time domain gyro y comp
23	"tbodygyrozmean"	- pa mean of mean time domain gyro z comp
24 	"tbodygyroxstd"		- pa mean of stdev of time domain gyro x comp
25 	"tbodygyroystd"		- pa mean of stdev of time domain gyro y comp
26	"tbodygyrozstd"		- pa mean of stdev of time domain gyro z comp
27	"tbodygyrojerkxmean"- pa mean of mean time domain gyro jerk x comp
28	"tbodygyrojerkymean"- pa mean of mean time domain gyro jerk y comp
29	"tbodygyrojerkzmean"- pa mean of mean time domain gyro jerk z comp
30	"tbodygyrojerkxstd" - pa mean of stdev of time domain gyro jerk x comp
31	"tbodygyrojerkystd" - pa mean of stdev of time domain gyro jerk y comp
32  "tbodygyrojerkzstd" - pa mean of stdev of time domain gyro jerk z comp
33  "tbodyaccmagmean"   - pa mean of mean time domain body acc magnitude (mag)
34  "tbodyaccmagstd"    - pa mean of stdev of time domain body acc mag
35  "tgravityaccmagmean"- pa mean of mean time domain gravity acc mag
36  "tgravityaccmagstd" - pa mean of stdev of time domain gravity acc mag
37  "tbodyaccjerkmagmean"- pa mean of mean time domain body jerk mag
38  "tbodyaccjerkmagstd"- pa mean of stdev of time domain body jerk mag
39  "tbodygyromagmean"  - pa mean of mean time domain body gyro mag
40  "tbodygyromagstd"   - pa mean of stdev of time domain body gyro mag
41  "tbodygyrojerkmagmean"- pa mean of mean time domain body gyro jerk mag
42  "tbodygyrojerkmagstd"- pa mean of stdev of time domain body gyro jerk mag
43  "fbodyaccxmean"     - pa mean of mean body x acc comp in frequency (freq) domain
44  "fbodyaccymean"     - pa mean of mean body y acc comp in freq domain
45  "fbodyacczmean"     - pa mean of mean body z acc comp in freq domain
46  "fbodyaccxstd"		- pa mean of stdev of body x acc comp in freq domain
47  "fbodyaccystd"		- pa mean of stdev of body y acc comp in freq domain
48  "fbodyacczstd"		- pa mean of stdev of body z acc comp in freq domain
49  "fbodyaccjerkxmean" - pa mean of mean body x jerk comp in freq domain
50  "fbodyaccjerkymean" - pa mean of mean body y jerk comp in freq domain
51  "fbodyaccjerkzmean" - pa mean of mean body z jerk comp in freq domain
52  "fbodyaccjerkxstd"  - pa mean of stdev of body x jerk comp in freq domain
53  "fbodyaccjerkystd"  - pa mean of stdev of body y jerk comp in freq domain
54  "fbodyaccjerkzstd"  - pa mean of stdev of body z jerk comp in freq domain
55  "fbodygyroxmean"	- pa mean of mean body gyro x comp in freq domain
56  "fbodygyroymean"	- pa mean of mean body gyro y comp in freq domain
57  "fbodygyrozmean"  	- pa mean of mean body gyro z comp in freq domain
58  "fbodygyroxstd"		- pa mean of stdev of body gyro x comp in freq domain
59  "fbodygyroystd"  	- pa mean of stdev of body gyro y comp in freq domain
60  "fbodygyrozstd"		- pa mean of stdev of body gyro z comp in freq domain
61  "fbodyaccmagmean"	- pa mean of mean body acc mag in freq domain
62	"fbodyaccmagstd"	- pa mean of stdev of body acc mag in freq domain
63  "fbodyaccjerkmagmean"- pa mean of mean body jerk mag in freq domain
64  "fbodyaccjerkmagstd"- pa mean of stdev of body jerk mag in freq domain
65  "fbodygyromagmean"	- pa mean of mean body gyro mag in freq domain
66  "fbodygyromagstd"	- pa mean of stdev of body gyro mag in freq domain
67	"fbodygyrojerkmagmean"- pa mean of mean body gyro jerk mag in freq domain
68  "fbodygyrojerkmagstd"- pa mean of stdev of bory gyro jerk mag in freq domain
