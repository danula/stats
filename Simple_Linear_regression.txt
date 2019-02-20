aaa <- read.csv("/Users/zsarsenbayev/Desktop/2019-master-class/p01circles.csv", header = T)
model1 <- lm(aaa$Time.ms.~as.factor(aaa$Condition))  
summary(model1)  