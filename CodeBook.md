# CodeBook

## How to get to the tinyData.txt:

- Download data from the link below and unzip it into working directory of R Studio.
- Excuse the R script named run_analysis
- **Do not forget to change the work directory in the code**

# About data source

Full description of data:

[UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download the data from here:

[](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# About the R script

The R script file “run_analysis” is able to do following things:

- Read and merge all the training and test datasets following into one dataset
   - 'features.txt'
   - 'activity_labels.txt'
   - 'subject_train.txt'
   - 'x_train.txt'
   - 'y_train.txt'
   - 'subject_test.txt'
   - 'x_test.txt'
   - 'y_test.txt'


- Extract measurements that measures only mean and standard deviation using following methods:
   - Create a vector that contains all the column names of the merged data
   - Using regular expressions that fits the pattern of all mean&Std colums as determinant, 
   create a logical vetor that only columns contains mean&Std will display TRUE
   - Apply that logical vetor on the merged dataframe to subset the columns
   

- Tidy the column names using:
   - Create a vector that contains all the column names of the merged data
   - a for loop that use gsub to replace the original terms in the vector
   - Apply the new vetor on the merged data to replace the column names


- Create tidy data set:
   - Remove the column "activity type"
   - using aggregate function to create a tidy dataset with the average of each variable for each activity and each subject.
   - export the tidySet to working directory


