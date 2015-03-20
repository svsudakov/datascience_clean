# UCI HAR dataset preprocessing

This repository contains script for cleaning and processing Human Activity Recognition dataset.

Source data can be obtained from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original dataset description can be found either in current repository's Code Book or on the dataset official website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

To run processing you need to download and unzip dataset and place script run_analysis.R in the same folder. Now you can run R function
"run_analysis" without any arguments that will read, merge and process original dataset.

## Dependencies

Current script depends on "dplyr" data processing R package for easy and efficient data table summary
