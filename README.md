# Analysis of cell phone measured human activity recognition data

A description of the data to be analyzed is provided in the accompying file "CodeBook.md"

The "run_analysis.R" script does the following:

1) Downloads the human activity recognition data, per the course assignment, from the web.

2) Unzips the downloaded file, which creates a set of new folders containing the data and descriptive files.

3) Reads the test and training data files as well as associated variable names and activity labels.

4) Combines the test and train datasets into a complete dataset "a". 

5) Adds descriptive variable names to the new data set.

6) Replaces activity ids with descriptive strings for the different actitvities evaluated.

7) From the complete and tidy dataset "a" the calculated mean and standard deviations for each variable are extracted into a new dataset "a_subset".

8) Finally, the mean of the data from 7) are calculated for each user by each activity.

9) The means for each user by activity are stored in a new tidy dataset "tds".

10) The new dataset "tds" is written to "tidy_data.txt".
