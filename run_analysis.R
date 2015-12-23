summarizeData <- function(){
    library(reshape2)
    source('load_data.R')
    required.features <- loadFeatureList()
    all.data <- loadData(required.features)
    all.data.melt <- melt(data = all.data, id.vars = c("subject", "activity"), measure.vars = createColumnNames(required.features))
    summary.data <- dcast(all.data.melt, subject+activity ~ variable, mean)
    write.table(summary.data, file = 'summaryData.txt', sep = ",", row.names = F)
}