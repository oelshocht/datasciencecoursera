readdata <- function(dir = ".") {
    if (!(dir %in% c("training", "test"))) {
        stop("invalid set")
    }

    # read the data set
    df <- read.table(paste(dir, "/X_test.txt", sep=""))

    # read the feature names
    features <- read.table("features.txt", sep=" ")

    # set the column feature names
    names(df) <- features$V2

    # read the activity labels
    labels <- read.table(paste(dir, "/Y_test.txt", sep=""))

    # read the activity label names
    activities <- read.table("activity_labels.txt", sep=" ")

    # merge features and activity
    df <- cbind(labels, df)
}

test <- readdata("test")
training <- readdata("training")

# read activity labels

