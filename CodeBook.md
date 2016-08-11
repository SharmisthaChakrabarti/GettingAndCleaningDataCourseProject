## Code Book

This code book summarizes the resulting data fields in tidydata_average.txt

### Identifiers

* subject - The ID of the subject (volunteers). Its range is from 1 to 30.
* activity - The type of activity performed when the corresponding measurements were taken. There are six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

### Measurements

 * timeBodyAccelerometer-mean()-X                                  
 * timeBodyAccelerometer-mean()-Y                                  
 * timeBodyAccelerometer-mean()-Z                                  
 * timeBodyAccelerometer-std()-X                                   
 * timeBodyAccelerometer-std()-Y                                   
 * timeBodyAccelerometer-std()-Z                                   
 * timeGravityAccelerometer-mean()-X                               
 * timeGravityAccelerometer-mean()-Y                               
 * timeGravityAccelerometer-mean()-Z                               
 * timeGravityAccelerometer-std()-X                                
 * timeGravityAccelerometer-std()-Y                                
 * timeGravityAccelerometer-std()-Z                                
 * timeBodyAccelerometerJerk-mean()-X                              
 * timeBodyAccelerometerJerk-mean()-Y                              
 * timeBodyAccelerometerJerk-mean()-Z                              
 * timeBodyAccelerometerJerk-std()-X                               
 * timeBodyAccelerometerJerk-std()-Y                               
 * timeBodyAccelerometerJerk-std()-Z                               
 * timeBodyGyroscope-mean()-X                                      
 * timeBodyGyroscope-mean()-Y                                      
 * timeBodyGyroscope-mean()-Z                                      
 * timeBodyGyroscope-std()-X                                       
 * timeBodyGyroscope-std()-Y                                       
 * timeBodyGyroscope-std()-Z                                       
 * timeBodyGyroscopeJerk-mean()-X                                  
 * timeBodyGyroscopeJerk-mean()-Y                                  
 * timeBodyGyroscopeJerk-mean()-Z                                  
 * timeBodyGyroscopeJerk-std()-X                                   
 * timeBodyGyroscopeJerk-std()-Y                                   
 * timeBodyGyroscopeJerk-std()-Z                                   
 * timeBodyAccelerometerMagnitude-mean()                           
 * timeBodyAccelerometerMagnitude-std()                            
 * timeGravityAccelerometerMagnitude-mean()                        
 * timeGravityAccelerometerMagnitude-std()                         
 * timeBodyAccelerometerJerkMagnitude-mean()                       
 * timeBodyAccelerometerJerkMagnitude-std()                        
 * timeBodyGyroscopeMagnitude-mean()                               
 * timeBodyGyroscopeMagnitude-std()                                
 * timeBodyGyroscopeJerkMagnitude-mean()                           
 * timeBodyGyroscopeJerkMagnitude-std()                            
 * frequencyBodyAccelerometer-mean()-X                             
 * frequencyBodyAccelerometer-mean()-Y                             
 * frequencyBodyAccelerometer-mean()-Z                             
 * frequencyBodyAccelerometer-std()-X                              
 * frequencyBodyAccelerometer-std()-Y                              
 * frequencyBodyAccelerometer-std()-Z                              
 * frequencyBodyAccelerometerJerk-mean()-X                         
 * frequencyBodyAccelerometerJerk-mean()-Y                         
 * frequencyBodyAccelerometerJerk-mean()-Z                         
 * frequencyBodyAccelerometerJerk-std()-X                          
 * frequencyBodyAccelerometerJerk-std()-Y                          
 * frequencyBodyAccelerometerJerk-std()-Z                          
 * frequencyBodyGyroscope-mean()-X                                 
 * frequencyBodyGyroscope-mean()-Y                                 
 * frequencyBodyGyroscope-mean()-Z                                 
 * frequencyBodyGyroscope-std()-X                                  
 * frequencyBodyGyroscope-std()-Y                                  
 * frequencyBodyGyroscope-std()-Z                                  
 * frequencyBodyAccelerometerMagnitude-mean()                      
 * frequencyBodyAccelerometerMagnitude-std()                       
 * frequencyBodyAccelerometerJerkMagnitude-mean()                  
 * frequencyBodyAccelerometerJerkMagnitude-std()                   
 * frequencyBodyGyroscopeMagnitude-mean()                          
 * frequencyBodyGyroscopeMagnitude-std()                           
 * frequencyBodyGyroscopeJerkMagnitude-mean()                      
 * frequencyBodyGyroscopeJerkMagnitude-std()                       


### Summaries Calculated

The tidy dataset (tidydata_average.txt) consists of the average (mean) value of each variable for each subject and activity pair. 
The unit of summaries calculated is in Hertz.


### Steps Deployed to Get to the Tidy Data

* Downloaded the zipped files (Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzipped the files
* Read the unzipped files
* Merged the training and the test sets and created one data set
    * The data set Feature was created by concatenating the files X_test.txt and X_train.txt 
    * The data set Activity was created by concatenating the files y_test.txt and y_train.txt 
    * The data set Subject was created by concatenating the files subject_test.txt and subject_train.txt
    * The variable of the three data sets (Feature, Activity, Subject) were properly named
    * Then the three data sets were combined (by columns) together to myData
* Constructed a subset of the data Feature by extracted only those columns with column names containing "mean()" and "std()"
* New myData was formed by combining the above subset, and the data sets Subject and Activity.  
* Descriptive activity names are used to replace activity numbers by corresponding descriptive activity names
* The variable names of the data set was appropriately label with descriptive variable names
* Finally, a second  independent tidy dataset was created which consists of the average (mean) value of each variable 
  for each subject and activity pair.
* The second tidy dataset was writen in .txt file.
* 
