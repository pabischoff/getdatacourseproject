CODE BOOK FOR SAMSUNG GALAXY S SMARTPHONE ACCELEROMETER DATA

Activity & ActivtyNumber (6)
	Label for each activity and its associated number
		1 WALKING
		2 WALKING_UP
		3 WALKING_DOWN
		4 SITTING
		5 STANDING
		6 LAYING

Subject	(30)
	The number assigned to each test subject


Variables (360)

	mean: Mean value
	std: Standard deviation
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

		tBodyAcc.mean...X 		Body acceleration
		tBodyAcc.mean...Y
		tBodyAcc.mean...Z
		tBodyAcc.std...X
		tBodyAcc.std...Y
		tBodyAcc.std...Z
	
		tGravityAcc.mean...X	Gravity acceleration
		tGravityAcc.mean...Y
		tGravityAcc.mean...Z
		tGravityAcc.std...X
		tGravityAcc.std...Y
		tGravityAcc.std...Z
	
		tBodyAccJerk.mean...X	Body accerlation jerk
		tBodyAccJerk.mean...Y
		tBodyAccJerk.mean...Z
		tBodyAccJerk.std...X
		tBodyAccJerk.std...Y
		tBodyAccJerk.std...Z
	
		tBodyGyro.mean...X		Body Gyration
		tBodyGyro.mean...Y
		tBodyGyro.mean...Z
		tBodyGyro.std...X
		tBodyGyro.std...Y
		tBodyGyro.std...Z
	
		tBodyGyroJerk.mean...X 	Body gyration jerk
		tBodyGyroJerk.mean...Y
		tBodyGyroJerk.mean...Z
		tBodyGyroJerk.std...X
		tBodyGyroJerk.std...Y
		tBodyGyroJerk.std...Z
	
		tBodyAccMag.mean..		Body acceleration magic
		tBodyAccMag.std..
	
		tGravityAccMag.mean..	Gravity acceleration magic
		tGravityAccMag.std..
	
		tBodyAccJerkMag.mean..	Body accerlation jerk magic
		tBodyAccJerkMag.std..
	
		tBodyGyroMag.mean..		Body gyration magic
		tBodyGyroMag.std..
	
		tBodyGyroJerkMag.mean.. Body gyration jerk magic
		tBodyGyroJerkMag.std..
	
		fBodyAcc.mean...X		Fast Fourier Transform Body acceleration
		fBodyAcc.mean...Y
		fBodyAcc.mean...Z
		fBodyAcc.std...X		
		fBodyAcc.std...Y
		fBodyAcc.std...Z
		fBodyAccJerk.mean...X	Fast Fourier Transform Body acceleration jerk
		fBodyAccJerk.mean...Y
		fBodyAccJerk.mean...Z
		fBodyAccJerk.std...X	Fast Fourier Transform body acceleration jerk
		fBodyAccJerk.std...Y
		fBodyAccJerk.std...Z
		fBodyGyro.mean...X		Fast Fourier Transform body gyration
		fBodyGyro.mean...Y
		fBodyGyro.mean...Z
		fBodyGyro.std...X
		fBodyGyro.std...Y
		fBodyGyro.std...Z
		fBodyAccMag.mean..		Fast Fourier Transform acceleration magic
		fBodyAccMag.std..
		fBodyBodyAccJerkMag.mean..	Fast Fourier Transform Body Body Acceleration Jerk Magic
		fBodyBodyAccJerkMag.std..
		fBodyBodyGyroMag.mean..		Fast Fourier Transform Body Body gyration magic
		fBodyBodyGyroMag.std..
		fBodyBodyGyroJerkMag.mean..	Fast Fourier Transform body body gyration jerk magic
		fBodyBodyGyroJerkMag.std..

TRANSFORMATIONS

This data merges the training and the test sets to create one data set, extracts only the measurements on the mean and standard deviation for each measurement, uses descriptive activity names to name the activities in the data set, and appropriately labels the data set with descriptive variable names. 

The original data set can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 