# Overall

This is a CodeBook documenting the actions taken in run_analysis.R as well as the details of each variables from the generated dataset, tidydata.csv and tidydata.txt

# Actions

## Step 0: reading data

-features.txt
-train_x.txt, train_y.txt, train_subject.txt
-test_x.txt, test_y.txt, test_subject.txt

## Step 1: Merges the training and the test sets to create one data set.

- merged training and test datasets by calling rbind()
- renamed the column names by using extracted features names from features.txt followed by act_label" and "subject"

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
- subset the data by  using grepl() to find mean and standard deviation and merged the data back

## Step 3: uses descriptive activity names to name the activities in the data set
- This is done by reading the labels from the activity_labels.txt file and merging it back with the data. 

## Step 4: Appropriately labels the data set with descriptive variable names.    
- acheived by using gsub() and metacharacters such as ^ . 

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
- summary done by using functions from the dplyr package.
-output: tidydata.R

# Output: tidydata.csv

## key columns
activity - activity name Factor w/ 6 levels
subject - ID of subject, int (1-30)
act_label - ID of activity, num (1-6)

## non-key
 [1] "TimeDomain_BodyAccelerometer_Mean_X"                                 
 [2] "TimeDomain_BodyAccelerometer_Mean_Y"                                 
 [3] "TimeDomain_BodyAccelerometer_Mean_Z"                                 
 [4] "TimeDomain_BodyAccelerometer_StandardDeviation_X"                    
 [5] "TimeDomain_BodyAccelerometer_StandardDeviation_Y"                    
 [6] "TimeDomain_BodyAccelerometer_StandardDeviation_Z"                    
 [7] "TimeDomain_GravityAccelerometer_Mean_X"                              
 [8] "TimeDomain_GravityAccelerometer_Mean_Y"                              
 [9] "TimeDomain_GravityAccelerometer_Mean_Z"                              
[10] "TimeDomain_GravityAccelerometer_StandardDeviation_X"                 
[11] "TimeDomain_GravityAccelerometer_StandardDeviation_Y"                 
[12] "TimeDomain_GravityAccelerometer_StandardDeviation_Z"                 
[13] "TimeDomain_BodyAccelerometerJerk_Mean_X"                             
[14] "TimeDomain_BodyAccelerometerJerk_Mean_Y"                             
[15] "TimeDomain_BodyAccelerometerJerk_Mean_Z"                             
[16] "TimeDomain_BodyAccelerometerJerk_StandardDeviation_X"                
[17] "TimeDomain_BodyAccelerometerJerk_StandardDeviation_Y"                
[18] "TimeDomain_BodyAccelerometerJerk_StandardDeviation_Z"                
[19] "TimeDomain_BodyGyroscope_Mean_X"                                     
[20] "TimeDomain_BodyGyroscope_Mean_Y"                                     
[21] "TimeDomain_BodyGyroscope_Mean_Z"                                     
[22] "TimeDomain_BodyGyroscope_StandardDeviation_X"                        
[23] "TimeDomain_BodyGyroscope_StandardDeviation_Y"                        
[24] "TimeDomain_BodyGyroscope_StandardDeviation_Z"                        
[25] "TimeDomain_BodyGyroscopeJerk_Mean_X"                                 
[26] "TimeDomain_BodyGyroscopeJerk_Mean_Y"                                 
[27] "TimeDomain_BodyGyroscopeJerk_Mean_Z"                                 
[28] "TimeDomain_BodyGyroscopeJerk_StandardDeviation_X"                    
[29] "TimeDomain_BodyGyroscopeJerk_StandardDeviation_Y"                    
[30] "TimeDomain_BodyGyroscopeJerk_StandardDeviation_Z"                    
[31] "TimeDomain_BodyAccelerometerMagnitude_Mean"                          
[32] "TimeDomain_BodyAccelerometerMagnitude_StandardDeviation"             
[33] "TimeDomain_GravityAccelerometerMagnitude_Mean"                       
[34] "TimeDomain_GravityAccelerometerMagnitude_StandardDeviation"          
[35] "TimeDomain_BodyAccelerometerJerkMagnitude_Mean"                      
[36] "TimeDomain_BodyAccelerometerJerkMagnitude_StandardDeviation"         
[37] "TimeDomain_BodyGyroscopeMagnitude_Mean"                              
[38] "TimeDomain_BodyGyroscopeMagnitude_StandardDeviation"                 
[39] "TimeDomain_BodyGyroscopeJerkMagnitude_Mean"                          
[40] "TimeDomain_BodyGyroscopeJerkMagnitude_StandardDeviation"             
[41] "FrequencyDomain_BodyAccelerometer_Mean_X"                            
[42] "FrequencyDomain_BodyAccelerometer_Mean_Y"                            
[43] "FrequencyDomain_BodyAccelerometer_Mean_Z"                            
[44] "FrequencyDomain_BodyAccelerometer_StandardDeviation_X"               
[45] "FrequencyDomain_BodyAccelerometer_StandardDeviation_Y"               
[46] "FrequencyDomain_BodyAccelerometer_StandardDeviation_Z"               
[47] "FrequencyDomain_BodyAccelerometer_MeanFreq_X"                        
[48] "FrequencyDomain_BodyAccelerometer_MeanFreq_Y"                        
[49] "FrequencyDomain_BodyAccelerometer_MeanFreq_Z"                        
[50] "FrequencyDomain_BodyAccelerometerJerk_Mean_X"                        
[51] "FrequencyDomain_BodyAccelerometerJerk_Mean_Y"                        
[52] "FrequencyDomain_BodyAccelerometerJerk_Mean_Z"                        
[53] "FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_X"           
[54] "FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Y"           
[55] "FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_Z"           
[56] "FrequencyDomain_BodyAccelerometerJerk_MeanFreq_X"                    
[57] "FrequencyDomain_BodyAccelerometerJerk_MeanFreq_Y"                    
[58] "FrequencyDomain_BodyAccelerometerJerk_MeanFreq_Z"                    
[59] "FrequencyDomain_BodyGyroscope_Mean_X"                                
[60] "FrequencyDomain_BodyGyroscope_Mean_Y"                                
[61] "FrequencyDomain_BodyGyroscope_Mean_Z"                                
[62] "FrequencyDomain_BodyGyroscope_StandardDeviation_X"                   
[63] "FrequencyDomain_BodyGyroscope_StandardDeviation_Y"                   
[64] "FrequencyDomain_BodyGyroscope_StandardDeviation_Z"                   
[65] "FrequencyDomain_BodyGyroscope_MeanFreq_X"                            
[66] "FrequencyDomain_BodyGyroscope_MeanFreq_Y"                            
[67] "FrequencyDomain_BodyGyroscope_MeanFreq_Z"                            
[68] "FrequencyDomain_BodyAccelerometerMagnitude_Mean"                     
[69] "FrequencyDomain_BodyAccelerometerMagnitude_StandardDeviation"        
[70] "FrequencyDomain_BodyAccelerometerMagnitude_MeanFreq"                 
[71] "FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_Mean"             
[72] "FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_StandardDeviation"
[73] "FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_MeanFreq"         
[74] "FrequencyDomain_BodyBodyGyroscopeMagnitude_Mean"                     
[75] "FrequencyDomain_BodyBodyGyroscopeMagnitude_StandardDeviation"        
[76] "FrequencyDomain_BodyBodyGyroscopeMagnitude_MeanFreq"                 
[77] "FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_Mean"                 
[78] "FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_StandardDeviation"    
[79] "FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_MeanFreq"  








