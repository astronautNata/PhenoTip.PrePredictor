#Natalija 3.5.2018.
#linear regression
library(data.table)
library(class)

folderName <- ""
extension <- ".csv"

trainFile = paste("",folderName, "trainData.csv", sep = "", collapse = NULL)

data <- read.table(file=trainFile, header=TRUE, sep=",")

testN <- 20000
testing <- data[sample(1:nrow(data), testN),]
testingData <- cbind(testing[1], testing[2], testing[3])
colnames(testingData) <- c("F_old", "f1", "speed")

trainingData <- data[-testN,]
n <- 50000
sample <- sample(1:nrow(trainingData), n)
trainSample1 <- trainingData[sample,]

##
start_model <- Sys.time()
fit <- lm(iter ~ F_old + f1, data = trainSample1, weights = f1+iter)
end_model <- Sys.time()
duration_model <- end_model - start_model
print("--linear done")
print(duration_model)

##Predict Output 
start_predict <- Sys.time()
predicted = predict(fit,testingData)
end_predict <- Sys.time()
duration_predict <- end_predict - start_predict
print("--predict done")
print(duration_predict)


fileName <- "linear_regression_testSample_1"
extension <- ".csv"
file1 <- paste(fileName, extension, sep = "", collapse = NULL)
print(file1)

predictedNice = cbind(testing[1], testing[2], testing[3], testing[4], predicted);
colnames(predictedNice) = c("speed","F_old","f1","iter_real", "iter_predicted")
write.csv(predictedNice, file1, row.names = FALSE)
print("--predictions are in file")








