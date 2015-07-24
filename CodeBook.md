#Code Book for cell-phone-measured human activity data

The original data for this excerise are measurements made by a group of 30 volunteers who wore a Samsung Galaxy SII smartphone on their waists while measurements of motion were taken with the smartphone's embedded accelerometer and gyroscope at a rate of 50 Hz.  Each volunteer performed six activities -- WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.  The original data were published by JL Reyes-Ortiz, D. Anguita, A. Ghio, and L. Oneto of the Universita degli Studi di Genova, Genoa, Italy.  

The original data is located at:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Each measurement set taken for a given subject performing one of the six activities is recorded in a 561 feature vector.

The original 561 feature vector consisted of the following variables:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Where XYZ refoers to 3-axial signals in the X, Y and Z directions.

The set of variables in the orginal data that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The script run_analysis.R in this repo extracts the mean() and std() variables from the original data set and creates a tidy data set with appropriate activity labels and variable names.  These variables are then averaged for each user by activity.  This final tidy data set is saved in the file "tidy_data.txt" through write.table.
