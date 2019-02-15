dddd <- read.csv("/Users/zsarsenbayev/Desktop/2019-master-class/circles_cold_chamber.csv", header = T)
model2 <- lm(Time.ms. ~ ActiveFingerTemp + Condition + IconCenterX + IconCenterY + Group, data = dddd)
summary(model2)

model3 <- lm(Time.ms. ~ ActiveFingerTemp * Condition * IconCenterX * IconCenterY * Group, data = dddd)
summary(model3)



