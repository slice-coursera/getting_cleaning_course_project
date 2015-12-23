# Getting and Cleaning Data Course Project
## Important files
* You can find the tidy dataset in the file summarizeData.csv
* The scripts used to generate the dataset are load_data.R and run_analysis.R
* CodeBook.md is the markdown with information about the summarizeData.csv dataset
## Scripts
There are two scripts to run in order to get the summarized data found in summaryData.csv. load_data.R is used to load and do some transformations to the data.
run_analysis.R is the entry point script that should be used to run the entire process. In order to do this source run_analysis.R and then call the function summarizeData.
This will load the data and transform the original data into the summarizeData.csv file.
### load_data.R
```R
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
```
### run_analysis.R
```R
summarizeData <- function(){
    library(reshape2)
    source('load_data.R')
    required.features <- loadFeatureList()
    all.data <- loadData(required.features)
    all.data.melt <- melt(data = all.data, id.vars = c("subject", "activity"), measure.vars = createColumnNames(required.features))
    summary.data <- dcast(all.data.melt, subject+activity ~ variable, mean)
    write.table(summary.data, file = 'summaryData.csv', sep = ",", row.names = F)
}
```
