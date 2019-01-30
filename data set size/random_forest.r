#Natalija 05.08.2018.
#random forest
library(data.table)
library(randomForest)
library(class)
library(Metrics)

#full = 652366
#80:20 => 521892 : 130473

set.seed(64)

folderName <- "input and comparation files/"
extension <- ".csv"

trainFile = paste("../",folderName, "zajedno6_parsed.csv", sep = "", collapse = NULL)
data <- read.table(file=trainFile, header=TRUE, sep=",")

testN <- sample(1:nrow(data),round(0.20*nrow(data)))
testingData <- data[testN,]
testing = cbind(testingData[1], testingData[2], testingData[3])

trainingData <- data[-testN,]
treeNum <- 64

n <- nrow(trainingData)
sample <- sample(1:nrow(trainingData), n)
trainSample <- trainingData[sample,]

start_model <- Sys.time()
model <- randomForest(iter~., data=trainSample, ntree=treeNum)
end_model <- Sys.time()
duration_model <- end_model - start_model
print(duration_model)

predicted = predict(model,testing)

rf_mse <- mse(testingData$iter, predicted)
print(rf_mse)
