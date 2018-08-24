# Codebook: Coursera 'Getting and Cleaning Data' Week 4 Project
## Data
This codebook is for the data set in the space delimited text file, 'tidied_data.txt', found in this repository. There is a newline character at the end of each row of this data set. The codebook describes the variables in this data set and the transformations to clean it.

The data in this text file originates from several text files in the following zip folder: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This zip folder contains data collected in the 'Human Activity Recognition Using Smartphones' study along with information regarding the study.

Please use the README.md in this repository for more information about the background of this study.

## Variables
The first variable in this data set, 'subject', is an integer - this is a unique identifier for the volunteers in the study and ranges from 1-30.

The last variable in this data set, 'activity', is a factor - this is the activity the subject was carrying out. There are six possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The remaining variables in this data set originate from the data collected in the 'Human Activity Recognition Using Smartphones' study. They are numeric variables and their names can be found in the table below. The values for these variables in 'tidied_data.txt' are averages for each subject doing each activity.

Any variables that have 'Accelerometer' in their name were measured in standard gravity units and any variables with 'Gyrocscope' in their name were measured in radians/second. The values were normalised and bound within [-1,1] before the data set was cleaned.

Number | Variable Name
-------|--------------
1 | time Domain Body Accelerometer Mean X
2 | time Domain Body Accelerometer Mean Y
3 | time Domain Body Accelerometer Mean Z
4 | time Domain Body Accelerometer Standard Deviation X
5 | time Domain Body Accelerometer Standard Deviation Y
6 | time Domain Body Accelerometer Standard Deviation Z
7 | time Domain Gravity Accelerometer Mean X
8 | time Domain Gravity Accelerometer Mean Y
9 | time Domain Gravity Accelerometer Mean Z
10 | time Domain Gravity Accelerometer Standard Deviation X
11 | time Domain Gravity Accelerometer Standard Deviation Y
12 | time Domain Gravity Accelerometer Standard Deviation Z
13 | time Domain Body Accelerometer Jerk Mean X
14 | time Domain Body Accelerometer Jerk Mean Y
15 | time Domain Body Accelerometer Jerk Mean Z
16 | time Domain Body Accelerometer Jerk Standard Deviation X
17 | time Domain Body Accelerometer Jerk Standard Deviation Y
18 | time Domain Body Accelerometer Jerk Standard Deviation Z
19 | time Domain Body Gyroscope Mean X
20 | time Domain Body Gyroscope Mean Y
21 | time Domain Body Gyroscope Mean Z
22 | time Domain Body Gyroscope Standard Deviation X
23 | time Domain Body Gyroscope Standard Deviation Y
24 | time Domain Body Gyroscope Standard Deviation Z
25 | time Domain Body Gyroscope Jerk Mean X
26 | time Domain Body Gyroscope Jerk Mean Y
27 | time Domain Body Gyroscope Jerk Mean Z
28 | time Domain Body Gyroscope Jerk Standard Deviation X
29 | time Domain Body Gyroscope Jerk Standard Deviation Y
30 | time Domain Body Gyroscope Jerk Standard Deviation Z
31 | time Domain Body Accelerometer Magnitude Mean
32 | time Domain Body Accelerometer Magnitude Standard Deviation
33 | time Domain Gravity Accelerometer Magnitude Mean
34 | time Domain Gravity Accelerometer Magnitude Standard Deviation
35 | time Domain Body Accelerometer Jerk Magnitude Mean
36 | time Domain Body Accelerometer Jerk Magnitude Standard Deviation
37 | time Domain Body Gyroscope Magnitude Mean
38 | time Domain Body Gyroscope Magnitude Standard Deviation
39 | time Domain Body Gyroscope Jerk Magnitude Mean
40 | time Domain Body Gyroscope Jerk Magnitude Standard Deviation
41 | frequency Domain Body Accelerometer Mean X
42 | frequency Domain Body Accelerometer Mean Y
43 | frequency Domain Body Accelerometer Mean Z
44 | frequency Domain Body Accelerometer Standard Deviation X
45 | frequency Domain Body Accelerometer Standard Deviation Y
46 | frequency Domain Body Accelerometer Standard Deviation Z
47 | frequency Domain Body Accelerometer Mean Frequency X
48 | frequency Domain Body Accelerometer Mean Frequency Y
49 | frequency Domain Body Accelerometer Mean Frequency Z
50 | frequency Domain Body Accelerometer Jerk Mean X
51 | frequency Domain Body Accelerometer Jerk Mean Y
52 | frequency Domain Body Accelerometer Jerk Mean Z
53 | frequency Domain Body Accelerometer Jerk Standard Deviation X
54 | frequency Domain Body Accelerometer Jerk Standard Deviation Y
55 | frequency Domain Body Accelerometer Jerk Standard Deviation Z
56 | frequency Domain Body Accelerometer Jerk Mean Frequency X
57 | frequency Domain Body Accelerometer Jerk Mean Frequency Y
58 | frequency Domain Body Accelerometer Jerk Mean Frequency Z
59 | frequency Domain Body Gyroscope Mean X
60 | frequency Domain Body Gyroscope Mean Y
61 | frequency Domain Body Gyroscope Mean Z
62 | frequency Domain Body Gyroscope Standard Deviation X
63 | frequency Domain Body Gyroscope Standard Deviation Y
64 | frequency Domain Body Gyroscope Standard Deviation Z
65 | frequency Domain Body Gyroscope Mean Frequency X
66 | frequency Domain Body Gyroscope Mean Frequency Y
67 | frequency Domain Body Gyroscope Mean Frequency Z
68 | frequency Domain Body Accelerometer Magnitude Mean
69 | frequency Domain Body Accelerometer Magnitude Standard Deviation
70 | frequency Domain Body Accelerometer Magnitude Mean Frequency
71 | frequency Domain Body Body Accelerometer Jerk Magnitude Mean
72 | frequency Domain Body Body Accelerometer Jerk Magnitude Standard Deviation
73 | frequency Domain Body Body Accelerometer Jerk Magnitude Mean Frequency
74 | frequency Domain Body Body Gyroscope Magnitude Mean
75 | frequency Domain Body Body Gyroscope Magnitude Standard Deviation
76 | frequency Domain Body Body Gyroscope Magnitude Mean Frequency
77 | frequency Domain Body Body Gyroscope Jerk Magnitude Mean
78 | frequency Domain Body Body Gyroscope Jerk Magnitude Standard Deviation
79 | frequency Domain Body Body Gyroscope Jerk Magnitude Mean Frequency

## Transformations
The R script, 'run_analysis.R', downloaded the zip folder and unzipped it. It then read the files into R and implemented the following steps to clean the data and produce the 'tidied_data.txt' text file.

1. The training data (trainingSet) was merged with the training subjects (trainingSubjects) and the training acitvity labels (trainingLabels).
2. The test data (testSet) was merged with the test subjects (testSubjects) and the test activity labels (testLabels)
3. These training and test data sets were then merged to create one.
4. The data set was consolidated by extracting the mean and standard deviation variables for each measurement whilst discarding the remaining variables.
5. The activity labels were decoded into descriptive activity names e.g 1 was changed to WALKING
6. The variable names were made more descriptive by removing punctuation and lengthening any abbreviations e.g. tBodyAcc-mean()-X was changed to time Domain Body Accelerometer Mean X

	a. t -> time Domain; f -> frequency Domain

	b. Acc -> Accelerometerl; Gyro -> Gyroscope

	c. mean -> Mean; std -> Standard Deviation

	d. Mag -> magnitude; freq -> Frequency

	(e. Spaces were added between words to make the variable names easier to read)
7. A new data set was created by grouping by subject and then activity. The average for each variable was calculated and this was then saved to a text file called 'tidied_data.txt'.