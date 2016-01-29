dataset.dir <- "./UCI HAR Dataset"

# This function loads and consolidate the 3 files from the main or test data source into a 
# single data frame
load.ds <-function(subject.path, label.path, set.path) {
    subject <- read.table(paste(dataset.dir, subject.path, sep=""), header = FALSE, col.names = c("subject"))
    label <- read.table(paste(dataset.dir, label.path, sep=""), header = FALSE, col.names = c("activity"))
    set <- read.table(paste(dataset.dir, set.path, sep=""), header = FALSE)
    df <- data.frame(subject, label, set)
    return (df)
}

# Load the train set
train.df <- load.ds("/train/subject_train.txt", "/train/y_train.txt", "/train/X_train.txt")

# Load the test set
test.df <- load.ds("/test/subject_test.txt", "/test/y_test.txt", "/test/X_test.txt")

# Merge the train and test sets
df <- rbind(train.df, test.df)

# Load the feature list and workout the indices of the columns containing 
# measurements on the mean and standard deviation
features <- read.table(paste(dataset.dir, "/features.txt", sep = ""))

pattern <- "mean\\(|std\\("

colindex <- c(1,2,grep(pattern,features$V2) + 2)
colnames <- c("subject", "activityid", grep(pattern, features$V2, value = TRUE))
    
    
# Create a new data frame containing only the subject, the activity and all the measurement
# on mean and standard deviation
df <- df[,colindex]
names(df) <- colnames

# Load acivity names
activites <- read.table(paste(dataset.dir, "/activity_labels.txt", sep = ""), col.names=c("activityid", "activity"))

# Add activity name to data frame
df <- merge(df, activites)

# Update column names to be more meaningfull
colnames <- tolower(names(df))
colnames <- sub("\\(\\)", "", colnames)
names(df) <- colnames

#Re-order column
colnames <- head(colnames, -1)
colnames[2] <- "activity"
colnames <- c("subject", colnames)
df <- df[colnames]

# Create a second, independent data set with the average of each variable for each activity
# and each subject.
library(reshape2)

# Get the name of the columns we need to calculate the mean for
measures <-  tail(colnames, -3)

# Melt the dataframe
mdf <- melt(df, id=c("subject","activity"), measure.vars = measures)

# Calculate the mean for each subject and activity
df2 <- dcast(mdf, subject + activity ~ variable, mean)


