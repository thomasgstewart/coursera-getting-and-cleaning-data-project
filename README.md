# FINAL PROJECT

## FILES

This project includes the following files:

* **README.md** - The file that you are reading.  It provides an overview of the entire project.

* **[run_analysis.R (link)](./run_analysis.R)** - An .R file which downloads the data then generates a tidy dataset.

* **[CodeBooke.md (link)](./CodeBook.md)** - A description of the variables in the tidy dataset which is output by `run_analysis.R`.

## DETAILS ABOUT THE ANALYSIS

As it stands now, `run_analysis.R` will execute the following steps:

0. load functions and packages

1. download and unzip the data from the web

2. run R commands to create the tidy dataset

If you already have the data downloaded, you can alter the code to skip step 1.  (Details are provided in the script.)

## OUTPUT OF THE ANALYSIS

There are many ways to organize the data in this project.  I have chosen to organize this data in the **long** format so that there are 5 variables in the final tidy dataset.  In my opinion, the long format is easiest to work with and easiest to understand.

The [code book (link)](./CodeBook.md) provides greater detail about each column; the first 6 observations of the tidy dataset are as follows:

| id|activity |measure          | avg_mean| avg_std|
|--:|:--------|:----------------|--------:|-------:|
|  1|laying   |f_body_acc_jerkx |   -0.957|  -0.964|
|  1|laying   |f_body_acc_jerky |   -0.922|  -0.932|
|  1|laying   |f_body_acc_jerkz |   -0.948|  -0.961|
|  1|laying   |f_body_acc_mag   |   -0.862|  -0.798|
|  1|laying   |f_body_accx      |   -0.939|  -0.924|
|  1|laying   |f_body_accy      |   -0.867|  -0.834|