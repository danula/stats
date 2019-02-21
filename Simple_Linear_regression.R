aaa <- read.csv("p01circles.csv", header = T)
model1 <- lm(aaa$Time.ms.~as.factor(aaa$Condition))  
summary(model1)  
