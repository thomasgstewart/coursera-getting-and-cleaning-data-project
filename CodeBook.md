# CODE BOOK

## SOURCE OF DATA

The data for this project came from the [Human Activity Recognition Using Smartphones Dataset Version 1.0 (link)](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data is the result of performing several experiments with study participants.  From the documentation: 

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured [several measures over time] ...
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)...

For every combination of study participant and activity, several measures were collected from the wearable device.  For each measure, several statistics were calculated within each sampling window.  From each study participant and activity, the resulting data is a time series of 281 to 409 values for each statistic calculated on each measure within the sampling window.

## EXTRACTED DATA

For this project, only two statistics were extracted: **mean** and **std**.  These two time-series of statistics were extracted for each study participant and activity for 33 different measures drawn or calculated from the wearable device.

## SUMMARIZED DATA IN TIDY DATASET

The two time-series of **mean** and **std** were averaged for every combination of participant, activity, and measure.

## ORGANZATION OF TIDY DATASET

We downloaded, summarized, and organized the data into the **long** format.  The output of [run_analysis.R (link)](./run_analysis.R) is a dataset with 5 variables, each described in detail below.  The variables are `id` (as in participant id), `activity`, `measure`, and then `avg_mean` and `avg_std`.  

### id

A number between 1 and 30 indicating the participant ID.

### activity

A character string indicating the activity of participant during data collection of the various measures.  There are six possible activities.

|activity                 |
|:------------------|
|laying             |
|sitting            |
|standing           |
|walking            |
|walking_downstairs |
|walking_upstairs   |

### measure

A character string indicating the measurement summarized in the `avg_mean` and `avg_std` variables.

|measure                   | Description                    |
|:-------------------------|:-------------------------------|
|f_body_acc_jerkx          |Body acceleration jerk signal on the x-plane in frequency units|
|f_body_acc_jerky          |Same as above, except measured on the y-plane|
|f_body_acc_jerkz          |Same as above, except measured on the z-plane|
|f_body_acc_mag            |Body acceleration magnitude in frequency units|
|f_body_accx               |Body Acceleration on the x-plane in frequency units.|
|f_body_accy               |Same as above, except measured on the y-plane|
|f_body_accz               |Same as above, except measured on the z-plane|
|f_body_body_acc_jerk_mag  |Body acceleration jerk signal magnitude in frequency units|
|f_body_body_gyro_jerk_mag |Body angular velocity jerk signal magnitude in frequency units|
|f_body_body_gyro_mag      |Body angular velocity magnitude in frequency units|
|f_body_gyrox              |Body angular velocity measured on the x-plane in frequency units|
|f_body_gyroy              |Same as above, except measured on the y-plane|
|f_body_gyroz              |Same as above, except measured on the z-plane|
|t_body_acc_jerk_mag       |Body acceleration jerk signal magnitude in time units|
|t_body_acc_jerkx          |Body acceleration jerk signal on the x-plane in time units|
|t_body_acc_jerky          |Same as above, except measured on the y-plane|
|t_body_acc_jerkz          |Same as above, except measured on the z-plane|
|t_body_acc_mag            |Body acceleration magnitude in time units|
|t_body_accx               |Body Acceleration on the x-plane in time units|
|t_body_accy               |Same as above, except measured on the y-plane|
|t_body_accz               |Same as above, except measured on the z-plane|
|t_body_gyro_jerk_mag      |Body angular velocity jerk signal magnitude in time units|
|t_body_gyro_jerkx         |Body angular velocity measured on the x-plane in time units|
|t_body_gyro_jerky         |Same as above, except measured on the y-plane|
|t_body_gyro_jerkz         |Same as above, except measured on the z-plane|
|t_body_gyro_mag           |Body angular velocity magnitude in time units|
|t_body_gyrox              |Body angular velocity measured on the x-plane in time units.|
|t_body_gyroy              |Same as above, except measured on the y-plane|
|t_body_gyroz              |Same as above, except measured on the z-plane|
|t_gravity_acc_mag         |Gravity acceleration magnitude in time units|
|t_gravity_accx            |Gravity acceleration in time units|
|t_gravity_accy            |Same as above, except measured on the y-plane|
|t_gravity_accz            |Same as above, except measured on the z-plane|

### avg_mean

For each `id`, `activity`, and `measure`, several values were collected in the study.  The variable `avg_mean` reports the average mean of the time series.

### avg_std

For each `id`, `activity`, and `measure`, several values were collected in the study.  The variable `avg_std` reports the average std of the time series. 