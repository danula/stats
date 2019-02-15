install.packages("lme4")
library(lme4)
model4 <- lmer(Time.ms. ~ ActiveFingerTemp + Condition + IconCenterX + IconCenterY + (1|Participant), data = dddd, REML=FALSE)
summary(model4)

model5 <- lmer(Time.ms. ~ ActiveFingerTemp * Condition * IconCenterX * IconCenterY + (1|Participant), data = dddd, REML=FALSE)
summary(model5)





# how to interpret mixed effect models
null_model <- lmer(Time.ms. ~  (1|Participant), data = dddd, REML=FALSE)
modelX <- lmer(Time.ms. ~ ActiveFingerTemp + (1|Participant), data = dddd, REML=FALSE)

anova(null_model, modelX)