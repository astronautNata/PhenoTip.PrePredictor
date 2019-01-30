#Natalija 06.08.2018.
#KNN
library(data.table)
library(class)

#full = 652366
#80:20 => 521892 : 130473

set.seed(64)

folderName <- ""
extension <- ".csv"

trainFile = paste("",folderName, "trainData.csv", sep = "", collapse = NULL)
data <- read.table(file=trainFile, header=TRUE, sep=",")

testN <- 20000
testSample <- sample(1:nrow(data), testN)
testSample1 <- data[testSample,]
testing = cbind(testSample1[1], testSample1[2], testSample1[3])

trainingData <- data[-testN,]
n <- 50000
sample <- sample(1:nrow(trainingData), n)
trainSample1 <- trainingData[sample,]

trainSample <- cbind(trainSample1[1], trainSample1[2], trainSample1[3])
trainClasses <- trainSample1[,4]

nrow(testing)
nrow(trainSample)

start_model <- Sys.time()
predictedValuesKNN <- knn(train = trainSample, test = testing, cl = trainClasses, k=3)
end_model <- Sys.time()
duration_model <- end_model - start_model
print(duration_model)

#knn_mse <- mse(as.data.frame(testingData$iter), as.numeric(as.character(predictedValuesKNN)))
#print(knn_mse)

comparation <- cbind(testing[1], testing[2], testing[3], testSample1[4], as.numeric(as.character(predictedValuesKNN)))
colnames(comparation) <- c("feKorak", "idElementa", "indexGausoveTacke", "iter_real", "knn_iter")
#print(comparation)
write.csv(comparation,"knn_testSample_1.csv", row.names = FALSE)

