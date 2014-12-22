readdata <- function(set = ".") {
    if (!(set %in% c("train", "test"))) {
        stop("invalid set")
    }

    # read the data set
    df <- read.table(paste(set, "/X_", set, ".txt", sep=""))

    # read the feature names
    features <- read.table("features.txt", sep=" ")

    # set the column feature names
    names(df) <- features$V2


    # read the activity labels
    labels <- read.table(paste(set, "/Y_", set, ".txt", sep=""))

    # convert the activity labels into a factor
    labels$V1 <- factor(labels$V1)

    # read the activity label names
    activities <- read.table("activity_labels.txt", sep=" ")

    # set the activity label names
    levels(labels$V1) <- activities$V2

    # set the activity labels column name
    names(labels) <- c("activity")

    # read the subjects
    subjects <- read.table(paste(set, "/subject_", set, ".txt", sep=""))

    # set the subject column name
    names(subjects) <- "subject"

    # merge all columns
    df <- cbind(subjects, labels, df)
}

test <- readdata("test")
training <- readdata("train")

# merge datasets
result <- rbind(test, training)

# keep only measurements for mean and standard deviation
result <- result[,grep("(subject)|(activity)|(mean)|(std)",names(result))]

# write result back to file
write.table(result, file="result.txt", row.names=FALSE)
