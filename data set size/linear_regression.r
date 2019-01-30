#Natalija 27.6.2018.
#linear regression
#training set size

library(data.table)
library(class)
library(Metrics)

folderName <- "input and comparation files/"
extension <- ".csv"

trainFile = paste("../",folderName, "zajedno6_parsed.csv", sep = "", collapse = NULL)

data <- read.table(file=trainFile, header=TRUE, sep=",")

#full = 652366
#80:20 => 521892 : 130473

testN <- sample(1:nrow(data),round(0.20*nrow(data)))
testingData <- data[testN,]
testing = cbind(testingData[1], testingData[2], testingData[3])

trainingData <- data[-testN,]
n <- 100
sample <- sample(1:nrow(trainingData), n)
trainSample <- trainingData[sample,]

fit <- lm(iter ~ f1 + F_old + speed, data = trainSample)

predicted = predict(fit,testing)

lm_mse <- mse(testingData$iter, predicted)
print(lm_mse)





