#Natalija 16.6.2018

library("FSelector")

folderName <- "input and comparation files/"
extension <- ".csv"

fileName = paste("../",folderName, "zajedno6_parsed.csv", sep = "", collapse = NULL)

#load data
start_read <- Sys.time()
data <- read.table(file=fileName, header=TRUE, sep=",")
end_read <- Sys.time()
duration <- end_read - start_read
print("--data loaded")
print(duration)

print(paste("sample ",10000))
n <- sample(1:nrow(data),10000)#round(0.75*nrow(data))
sample <- data[n,]

#RReliefF filter - relief
#The algorithm finds weights of continous and discrete attributes basing on a distance between instances.
start_relief <- Sys.time()
result <- relief(iter~., sample, neighbours.count = 20, sample.size = 100)
end_relief <- Sys.time()
duration_relief <- end_relief - start_relief
print(duration_relief)

print(result)
subset <- cutoff.k(result, 2)
f <- as.simple.formula(subset, "iter")
print(f)

#CFS filter - chi.squared
#The algorithm finds attribute subset using correlation and entropy measures for continous and discrete data
subset <- cfs(iter~., data)
f_cfs <- as.simple.formula(subset, "iter")
print(f_cfs)

#Chi-squared filter - chi.squared 
#The algorithm finds weights of discrete attributes basing on a chi-squared test.
weights_chi <- chi.squared(iter~., data)
print(weights_chi)
subset_chi <- cutoff.k(weights_chi, 5)
f_chi <- as.simple.formula(subset_chi, "iter")
print(f_chi)


#Consistency-based filter - consistency
#The algorithm finds attribute subset using consistency measure for continous and discrete data.
result_cons <- consistency(iter~., data)
f_cons <- as.simple.formula(result_cons, "iter")
print(f_cons)


#Correlation filter - correlation
#The algorithm finds weights of continous attributes basing on their correlation with continous class attribute.
#linear.correlation uses Pearson’s correlation
weights_linear <- linear.correlation(iter~., data)
print(weights_linear)

#rank.correlation uses Spearman’s correlation
weights_rank <- rank.correlation(iter~., data)
print(weights_rank)




