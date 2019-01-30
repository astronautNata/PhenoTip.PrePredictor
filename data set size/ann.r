#Natalija 05.08.2018.
#artificial neural network

library(data.table)
library(class)
library(neuralnet)

set.seed(64)

folderName <- ""
extension <- ".csv"

trainFile = paste("",folderName, "trainData.csv", sep = "", collapse = NULL)
data1 <- read.table(file=trainFile, header=TRUE, sep=",")

maxS <- apply(data1, 2, max)
minS <- apply(data1, 2, min)

data <- as.data.frame(scale(data1, center = minS, scale = maxS - minS))

testN <- 5000
testing <- data[sample(1:nrow(data), testN),]
testingData <- cbind(testing[1], testing[2], testing[3])
colnames(testingData) <- c("F_old", "f1", "speed")

trainingData <- data[-testN,]
n <- 10000
sample <- sample(1:nrow(trainingData), n)
trainSample1 <- trainingData[sample,]

nn <- names(trainingData)
f <- as.formula(paste("iter ~", paste(nn[!nn %in% "iter"], collapse = " + ")))
neuronNum = c(5)

start_model <- Sys.time()
model <- neuralnet(f,data=trainSample1,hidden=neuronNum, rep = 5, stepmax = 1e+06)
end_model <- Sys.time()
duration_model <- end_model - start_model
print(duration_model)

computed <- compute(model,testingData)
nonNormComputed <- computed$net.result*(max(data1$iter)-min(data1$iter))+min(data1$iter)
nonNormComputedFormated <- as.numeric(as.character(nonNormComputed))
nonNormTest <- (testing$iter)*(max(data1$iter)-min(data1$iter))+min(data1$iter)

fileName <- "ann_testSample_1"
extension <- ".csv"
file1 <- paste(fileName, extension, sep = "", collapse = NULL)
print(file1)

predictedNice = cbind(testing[1], testing[2], testing[3], nonNormTest, nonNormComputedFormated);
colnames(predictedNice) = c("speed","F_old","f1","iter_real", "iter_predicted")
write.csv(predictedNice, file1, row.names = FALSE)

#ann_mse <- mse(nonNormTest, nonNormComputedFormated)
#print(ann_mse)
