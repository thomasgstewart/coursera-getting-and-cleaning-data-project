# STEP 0: LOAD FUNCTIONS (SOME USER WRITTEN) ---------------
# ----------------------------------------------------------
library(data.table)

`%|%` <- function(a,b) paste0(a,b)

namify <- function(txt){
  txt <- gsub("\\.|-", "_", txt)               # Change . or - to _
  txt <- gsub(" +$|^ +|\\(|\\)","",txt)        # Remove leading/trailing spaces, (, )
  txt <- gsub("%","pct",txt)                   # Change % to pct
  txt <- gsub("([a-z])([A-Z])","\\1_\\2", txt) # Remove camel-case
  txt <- gsub(" ","_",txt)                     # Change interior space to underscore
  txt <- tolower(txt)                          # to lower case
  txt <- gsub("[^_[:alnum:]]","",txt)          # Remove punctuation
  return(txt)
}



# STEP 1: DOWNLOAD AND UNZIP THE DATA ----------------------
#         IF THE DATA IS ALREAD DOWNLOADED AND UNZIPPED, ---
#         YOU CAN SKIP THIS STEP ---------------------------
# ----------------------------------------------------------

# CREATE A TEMPORARY FOLDER TO DOWNLOAD DATA
tempfolder <- tempdir()

# SET TEMP FOLDER AS WORKING DIR
setwd(tempfolder)

# DOWNLOAD ZIP FILE FROM INTERNET
download.file(
  url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
  destfile = "dataset.zip"
)

# UNZIP FILE INTO TEMP FOLDER
unzip("dataset.zip")



# STEP 2: CREATE TIDY DATASET ------------------------------
#         IF YOU DID NOT RUN STEP 1, ALTER FIRST COMMAND ---
# ----------------------------------------------------------

# MOVE TO DATAFOLDER
setwd("UCI HAR Dataset") # <- CHANGE LOCATION IF NEEDED

# READ IN FEATURE LIST
features <- read.table(
  file = "features.txt",
  stringsAsFactors = FALSE
)

# Find features with mean() and std().  These will
# be the columns that are extracted from the datasets
feature_idx <- grep("mean\\(\\)|std\\(\\)", features[,2])


# READ X DATA (SELECT ONLY NEEDED COLUMNS)
# READ Y DATA
# READ SUBJECT DATA
# COMBINE SUBJECT, X, Y, AND G (which indicates group TEST/TRAIN) 
groups <- c("test", "train")
data <- list()
for(g in groups){
  x_file <- "./" %|% g %|% "/X_" %|% g %|% ".txt"
  x_data <- fread(x_file, select = feature_idx)
  
  y_file <- gsub("X_", "y_", x_file)
  y_data <- fread(y_file)
  
  subject_file <- "./" %|% g %|% "/subject_" %|% g %|% ".txt"
  subject_data <- fread(subject_file)
  
  data[[g]] <- cbind(x_data, y_data, g, subject_data)
}

# STACK DATASETS INTO SINGLE DATA.FRAME
data <- rbindlist(data)

# CHANGE VARIABLE NAMES - MAKE VARIABLE NAMES EASY TO READ
feature_names <- namify(features[feature_idx, 2])
setnames(data, c(feature_names, "activity_code", "group", "id"))

# USE ACIVITY CODES (1, 2, 3, ...) TO APPEND ACTIVITY LABELS
# FROM THE activity_labels.txt FILE
activities <- fread(
  input = "activity_labels.txt",
  col.names = c("","activity")
)
activities[, activity := tolower(activity)] # (OPTIONAL) make labels lower case
setkey(data, activity_code)
data[activities, activity := activity]

# CALCULATE MEAN BY ID AND ACTIVITY
data_summary <- data[, lapply(.SD, mean), by = .(id, activity), .SDcols = feature_names]
setkey(data_summary, id, activity)

# MELT DATA TO BE IN LONG FORMAT WITH THE FOLLOWING COLUMNS:
# id, activity, measure, avg_mean, avg_std
#
# While other forms of the data may also be tidy, I think this
# form is very helpful and intuitive because it reflects the
# hierarchical nature of the data- participants, activities, measures.

data_summary_long <- melt(
  data = data_summary, 
  id.vars = c("id","activity"),
  variable.name = "measure",
  variable.factor = FALSE
  )

has_word <- function(x, word){
  out <- rep(FALSE, length(x)); 
  out[grep(word, x)] <- TRUE; 
  out 
} 

data_summary_long[, avg := ifelse(has_word(measure, "_mean"), "avg_mean", "avg_std") ]
data_summary_long[, measure := gsub("_mean_|_mean|_std_|_std","", measure)]

dsl <- dcast(data_summary_long, id+activity+measure ~ avg, value.var = "value")


# WRITE DATASET TO FILE
write.table(dsl, file = "tidy-dataset.txt", row.names = FALSE)
