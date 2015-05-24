# Project
Project repo for Getting and Cleaning Coursera course

## Project description
The goal of the project is to create script which transforms two data sets X_test.txt and X_train.txt from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
to one tidy data set according to requirements put forward in the "Getting and Cleaning" Coursera course project.
Detailed information about the data sets is provided in the README.txt file available in the linked .zip file.

### Raw data
From the .zip file linked above the following raw data are employed in the script:
* X_test.txt
* X_train.txt
* features.txt
* activity_labels.txt
* y_test.txt
* y_train.txt
* subject_test.txt
* subject_train.txt

## Script description
The script run_analysis.R creates file tidy_dataset.txt in the following steps:

1. loading raw data
2. adding column names - useful for controlling how the script works
3. substracting required columns of mean i standard deviation - allows operating on smaller objects
4. adding column with activity numbers
5. adding column with subject numbers
6. combining tables train and test data
7. calculating averages
8. sorting data
9. creating tidy_dataset.txt file

## Description of the tidy data set
Tidy data set is a data frame with 180 observations (rows) and 81 variables (columns).
There is one observation (average from X_test.txt and X_train.txt raw data sets) for the each of the 6 activities and for the each of the 30 subjects (persons). That gives 6x30=180 observations in total.
First column contains number of subject, second column contains the name of the activity. Other 79 variables are the averages of the all mean and standard deviation (std) variables from the X_test.txt and X_train.txt raw data sets for any observation. That gives 81 variables in total.
Therefore the tidy data set is in accordance with the general principles of tidy data published by Jeff Leek:

    Each variable you measure should be in one column
    Each different observation of that variable should be in a different row





## Project includes the following files:
* README.md
* Code_book.md
* run_analysis.R
