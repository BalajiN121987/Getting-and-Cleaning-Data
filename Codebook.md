## Getting and Cleaning Data - Project
### Codebook

###Source Data
The source data containing the smartphone accelerometer and gyroscope 3-axial raw signals has been taken from the following site:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###Processing Steps
Following processing steps are performed on the raw dataset downloaded from the website mentioned above:
Combine the test and training set and create a master dataset. Add the fields Activity and Subject to the dataset.
Using regular expression, only the measurements on the mean and standard deviation for each measurement was extracted.
Tidy dataset was created containing average of each variable for each activity and for each subject.

###Tidy Dataset
The original variable names were modified as follows in the tidy dataset
*. '-mean' replaced by 'Mean'
*. '-std' replaced by 'Std'
*. Paranthesis have been removed (i.e. '-()' replaced by '')


