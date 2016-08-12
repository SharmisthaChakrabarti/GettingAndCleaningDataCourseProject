# Getting And Cleaning Data Course Project

This repository hosts the R code and documentation files for the Data Science Specialization's track course "Getting and Cleaning data", available in coursera. The R script, run_analysis.R, does the following:

* Downloads the dataset in the folder data. If the folder data does not already exist in the working directory, it creates the folder   first.
* Loads the activity and feature info.
* Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation.
* Loads the activity and subject data for each dataset, and then.
* Merges the training and the test sets and creats one data set.
* Replaces the numeric activity labels by corresponding descriptive activity names.
* Relabels the variable names of the data set with appropriate descriptive variable names
* Finally, it creates a second,  independent tidy dataset which consists of the average (mean) value of each variable 
  for each subject and activity pair.
* The second tidy dataset was writen in .txt file (tidydata_average.txt)

The tidy data tidydata_average.txt is uploaded in the repo.

Note: The code takes for granted that all the data is present in the same folder, un-compressed and without names altered.

