library(readr)
Clean<-read.csv("C:/Users/nadit/Documents/ElectricCarData_Clean.csv")
View(Clean)
attach(Clean)

library(car)
pairs(Clean)

cor(Clean)

model<-lm('Range_Km~.',data=Clean)
summary(model)

car::vif(model)

library(MASS)
stepAIC(model)

residualPlots(model)

qqPlot(model)

influenceIndexPlot(model)

Clean['Efficiency']<-AccelSec*AccelSec
Clean['FastCharge']<-TopSpeed_KmH*TopSpeed_KmH

Clean1<-Clean[-c(81,77,66),]

model1<-lm('MPG~.',data=Clean1)
summary(model1)
car::vif(model1)

residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)

Clean2<-Clean[-c(77,81,66,79),]

model2<-lm('Range_Km~.',data=Clean2[,-5])
summary(model2)
car::vif(model2)
residualPlots(model2)

Clean2<-Clean[-c(77,81,66,79),]
final_model<-lm('Range_Km~.',data=Clean2[,-c(5,7)])
summary(final_model)
residualPlots(final_model)

