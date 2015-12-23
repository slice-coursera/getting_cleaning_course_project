loadFeatureList <- function() {
    #read in the feature list
    featuresFile = './UCI HAR Dataset/features.txt'
    features <- read.table(featuresFile)
    required.features <- features[grep("mean\\(\\)|std\\(\\)", features$V2),]
    required.features
}

createColumnNames <- function(required.features){
    columnNames <- as.character(required.features$V2)
    columnNames <- gsub("^t", "time", columnNames)
    columnNames <- gsub("^f", "frequency", columnNames)
    columnNames <- gsub("Acc", "Accelerometer", columnNames)
    columnNames <- gsub("Mag", "Magnitude", columnNames)
    columnNames <- gsub("-mean\\(\\)", "Mean", columnNames)
    columnNames <- gsub("-std\\(\\)", "StandardDeviation", columnNames)
    columnNames
}

loadData <- function(required.features) {
    #create more humanreadable column names
    columnNames <- createColumnNames(required.features)
    
    #read subjects train
    subjectsTrainFile = './UCI HAR Dataset/train/subject_train.txt'
    train.subjects <- read.table(subjectsTrainFile)
    
    #read in the training set
    theTrainFile = './UCI HAR Dataset/train/X_train.txt'
    theTrainLabelsFile = './UCI HAR Dataset/train/y_train.txt'
    train.data <- read.table(theTrainFile)
    train.labels <- read.table(theTrainLabelsFile)
    train.data <- train.data[, required.features$V1]
    train.data <- cbind(train.data, train.labels)
    train.data <- cbind(train.subjects, train.data)
    colnames(train.data) <- c('subject', columnNames, 'activity')
    
    #read subjects train
    subjectsTestFile = './UCI HAR Dataset/test/subject_test.txt'
    test.subjects <- read.table(subjectsTestFile)
    
    #read in the test set
    theTestFile = './UCI HAR Dataset/test/X_test.txt'
    theTestLabelsFile = './UCI HAR Dataset/test/y_test.txt'
    test.data <- read.table(theTestFile)
    test.labels <- read.table(theTestLabelsFile)
    test.data <- test.data[, required.features$V1]
    test.data <- cbind(test.data, test.labels)
    test.data <- cbind(test.subjects, test.data)
    colnames(test.data) <- c('subject', columnNames, 'activity')
    
    together <- rbind(train.data, test.data)
    together$activity <- factor(together$activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
    together
}