#Natalija 05.08.2018.
#random forest
library(data.table)
library(randomForest)

set.seed(64)

folderName <- ""
extension <- ".csv"
trainFile = paste("../",folderName, "trainData.csv", sep = "", collapse = NULL)
data <- read.table(file=trainFile, header=TRUE, sep=",")

testN <- 20000
print(paste("test size", testN, sep=" ", collapse = NULL))
testing <- data[sample(1:nrow(data), testN),]
testingData <- cbind(testing[1], testing[2], testing[3])
colnames(testingData) <- c("F_old", "f1", "speed")

training <- data[-testN,]

trainN <- 500000
trainingData <- data[-testN,]
n <- 50000
sample <- sample(1:nrow(trainingData), n)
trainSample1 <- trainingData[sample,]

treeNum <- 64
print(paste("train size", trainN, sep=" ", collapse = NULL))
print(paste("tree size", treeNum, sep=" ", collapse = NULL))

start_model <- Sys.time()
model <- randomForest(iter~., data=trainSample1, ntree=treeNum)
end_model <- Sys.time()
duration_model <- end_model - start_model
print(duration_model)

start_predict <- Sys.time()
predicted = predict(model,testingData)
end_predict <- Sys.time()
duration_predict <- end_predict - start_predict
print(duration_predict)

fileName <- "random_forest_testSample_1"
extension <- ".csv"
file1 <- paste(fileName, extension, sep = "", collapse = NULL)

predictedNice = cbind(testing[1], testing[2], testing[3], testing[4], predicted);
colnames(predictedNice) = c("speed","F_old","f1","iter_real", "iter_predicted")
write.csv(predictedNice, file1, row.names = FALSE)

