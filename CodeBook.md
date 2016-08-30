# CODE BOOK

## SOURCE OF DATA

The data for this project came from the [Human Activity Recognition Using Smartphones Dataset Version 1.0 (link)](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The data is the result of performing several experiments with study participants.  From the documentation: 

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured [several measures over time]

## ORGANZATION OF TIDY DATA

In this project, we downloaded, summarized, and organized into the **long** format the data described above.  The output of [run_analysis.R (link)](./run_analysis.R) is a dataset with 5 variables.

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

|measure                        |
|:-------------------------|
|f_body_acc_jerkx          |
|f_body_acc_jerky          |
|f_body_acc_jerkz          |
|f_body_acc_mag            |
|f_body_accx               |
|f_body_accy               |
|f_body_accz               |
|f_body_body_acc_jerk_mag  |
|f_body_body_gyro_jerk_mag |
|f_body_body_gyro_mag      |
|f_body_gyrox              |
|f_body_gyroy              |
|f_body_gyroz              |
|t_body_acc_jerk_mag       |
|t_body_acc_jerkx          |
|t_body_acc_jerky          |
|t_body_acc_jerkz          |
|t_body_acc_mag            |
|t_body_accx               |
|t_body_accy               |
|t_body_accz               |
|t_body_gyro_jerk_mag      |
|t_body_gyro_jerkx         |
|t_body_gyro_jerky         |
|t_body_gyro_jerkz         |
|t_body_gyro_mag           |
|t_body_gyrox              |
|t_body_gyroy              |
|t_body_gyroz              |
|t_gravity_acc_mag         |
|t_gravity_accx            |
|t_gravity_accy            |
|t_gravity_accz            |

### avg_mean

For each `id`, `activity`, and `measure`, several values were collected in the study.  The variable `avg_mean` reports the average mean of the time series.

### avg_std

For each `id`, `activity`, and `measure`, several values were collected in the study.  The variable `avg_std` reports the average std of the time series. 