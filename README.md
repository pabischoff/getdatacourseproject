run_analysis.R README

Description of script:

1. Downloads zip file containing data to a temporary file from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. unzips and reads each file in the zip folder to separate items in R
3. Deletes the temp file
4. Combines the files into a single data set
	1. Features are set as column names
	2. Subject numbers are appended to the front of the data set
	3. Activity numbers are appended to the front of the data set
	4. Train and Test data sets are combined using rbind
5. Use grep to remove all variables that aren't means or standard deviations, judging by their column names
6. Add a column of descriptive titles for the different activities to the front of the data set
7. Use a loop to select each activity for each subject using filter() from the dplyr package
8. get the mean of each column in each subset of data
9. Add the averages to a new data set (create on if it doesn't exist already)
10. Add the activity numbers and subject numbers back onto the front of the new data set
11. Output the resulting data frame to a .txt file