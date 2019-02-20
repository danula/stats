
dddd <- read.csv("/Users/zsarsenbayev/Desktop/2019-master-class/circles_cold_chamber.csv", header = T)
library(lme4)
model4 <- lmer(Time.ms. ~ ActiveFingerTemp + Condition + IconCenterX + IconCenterY + (1|Participant), data = dddd, REML=FALSE)
summary(model4)

model41 <- lmer(Time.ms. ~  (1|Participant), data = dddd, REML=FALSE)
anova(model4, model41)