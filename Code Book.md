# Code Book

This code book summarises the resulting data in `Tidy Dataset.txt`.

## Dataset Information

The experiments have been carried out with a group of 30 volunteers within an age group of 19-48 years. Each person performed six activities (see Activity Labels below) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the following was captured: 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Each record provides:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the participant who carried out the experiment.

## Data Source

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## Identifier Variables

* `Participant` - The ID of the test participant
* `Activity` - The type of activity performed

## Measurements

Variables are named with the following convention:

Feature of variable names | Description
------------------------- | -------------------
Time | Recorded time
Frequency | Recorded frequency
Accelerometer | Sensor signals measured by embedded accelerometer
Gyroscope | Sensor signals measured by embedded gyroscope
Jerk | Jerk measurement
Magnitude | Size measurement
Mean | Average of measurements
SD | Standard deviation of measurements
X,Y,Z | Recorded for X,Y,Z axis of motion

## Activity Labels

* `Walking`
* `Walking upstairs`
* `Walking downstairs`
* `Sitting`
* `Standing`
* `Laying`

## Notes: 

* Features are normalised and bounded within the interval [-1,1]
* Each feature vector is a row on the text files
