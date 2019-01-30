#Natalija 05.08.2018.

library(lattice)
library(ggplot2)
library(mlbench)
library(klaR)
library(caret)

n <- 10000
#The simulation will fit models with subset sizes of 1,2,3
sizes <- c(1:3)
sample <- data[sample(1:nrow(data), n),]

#random forest
controlRf <- rfeControl(functions=rfFuncs, method="cv", number=10)
start <- Sys.time()
results <- rfe(sample[,1:3], sample[,4], sizes=sizes, rfeControl=controlRf)
end <- Sys.time()
duration <- end - start
print(duration)


#naive bayes
controlNb <- rfeControl(functions=nbFuncs, method="cv", number=10)
start <- Sys.time()
resultsNb <- rfe(sample[,1:3], as.factor(sample[,4]), sizes=sizes, rfeControl=controlNb)
end <- Sys.time()
duration <- end - start
print(duration)

#linear regression
controlLm <- rfeControl(functions=lmFuncs, method="cv", number=10)
start <- Sys.time()
resultsLm <- rfe(sample[,1:3], sample[,4], sizes=sizes, rfeControl=controlLm)
end <- Sys.time()
duration <- end - start
print(duration)


