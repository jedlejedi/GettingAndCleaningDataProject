library(dplyr)

dataset.dir <- "./UCI HAR Dataset"

load.ds <-function(subject.path, label.path, set.path) {
    subject <- read.table(paste(dataset.dir, subject.path, sep=""), header = FALSE, col.names = c("subject"))
    label <- read.table(paste(dataset.dir, label.path, sep=""), header = FALSE, col.names = c("activity"))
    set <- read.table(paste(dataset.dir, set.path, sep=""), header = FALSE)
    df <- data.frame(subject, label, set)
    return (df)
}

train.df <- load.ds("/train/subject_train.txt", "/train/y_train.txt", "/train/X_train.txt")
test.df <- load.ds("/test/subject_test.txt", "/test/y_test.txt", "/test/X_test.txt")

df <- rbind(train.df, test.df)

names(df)


