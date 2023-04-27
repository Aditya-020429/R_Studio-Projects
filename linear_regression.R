dataset = read.csv("ElectricCarData_Clean.csv")

AccelSec = dataset [,3]
TopSpeed_KmH = dataset [,4]

data = data.frame(AccelSec, TopSpeed_KmH)

library(caTools)

set.seed(42)

split = sample.split(data$TopSpeed_KmH, SplitRatio = 0.8)

training_set = subset(data, split==TRUE)
View(training_set)

testing_set = subset(data, split==FALSE)
View(testing_set)

regressor = lm(formula = TopSpeed_KmH~AccelSec, data = training_set)

y_pred = predict(regressor, newdata = testing_set)
View(y_pred)

library(ggplot2)

plot(testing_set$AccelSec, testing_set$TopSpeed_KmH, type = 'p', 
     col = 'blue', xlab = 'AccelSec', ylab = 'TopSpeed_KmH')

lines(testing_set$AccelSec, y_pred, type = 'o', col = 'red')