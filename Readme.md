## Getting and Cleaning Data - Project
### Introduction

This repository contains the project work for the course Getting and Cleaning Data.

### Files
This repository contains the following files:
1. run_analysis.R- This file contains the code for creating a tidy dataset based on the test and training data available at the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Following are the pre-requisites for running the script:
a. The data must be downloaded from the website mentioned above and extracted to the "UCI HAR Dataset" folder.
b. The working directory should be set as the "UCI HAR Dataset" folder and the "run_analysis.R" file should be present in that folder. The script can be run by calling the following command:
	source("../run_analysis.R")

2. Codebook.md - This file mentions the processing performed on the raw dataset to create the final tidy dataset.

3. tidy.txt - This is a tab delimited file containing the final tidy dataset.