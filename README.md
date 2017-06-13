# Getting and Cleaning Data Course Project

## Objective
1. Tidy the dataset 
2. Submit the dataset and code book to GitHub repository
3. Code book has information regarding the data

## R program
The program entitled `run_analysis.R` does the following:
1. Reads training and test data into the workspace
2. Merges these into one dataset
2. Reads the activity and feature labels into the workspace
3. Adds features as variable labels
4. Subsets dataset which only contains mean and standard deviation variables, using text extraction
5. Adds participant and activity data
6. Converts the activity variable into factors
7. Gives more descriptive names to variables
7. Creates a second, tidy dataset that consists of the average of each variable for each participant and each activity

## Data source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones