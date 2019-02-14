ccc <- read.csv("/Users/zsarsenbayev/Desktop/2019-master-class/repo/train.csv", header = T)
cccc <- subset(ccc,select=c(2,3,5,6,7,8,10,12))
cccc$Age[is.na(cccc$Age)] <- mean(cccc$Age,na.rm=T)

is.factor(cccc$Sex)
is.factor(cccc$Embarked)
contrasts(cccc$Sex) # to see how the variables have been dummyfied by R and how to interpret them in a model. E.g., you can see that in the variable sex, female will be used as the reference.
cccc <- cccc[!is.na(cccc$Embarked),]

# We split the data into two chunks: training and testing set. 
# The training set will be used to fit our model which we will be testing over the testing set.

train <- cccc[1:800,]
test <- cccc[801:889,]

model <- glm(Survived ~.,family=binomial(link='logit'),data=train)
summary(model)

anova(model, test="Chisq")

library(pscl)
pR2(model)

# predictive abilities of a model
fitted.results <- predict(model,newdata=subset(test,select=c(2,3,4,5,6,7,8)),type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)

misClasificError <- mean(fitted.results != test$Survived)
print(paste('Accuracy',1-misClasificError))

install.packages("ROCR")
library(ROCR)
p <- predict(model, newdata=subset(test,select=c(2,3,4,5,6,7,8)), type="response")
pr <- prediction(p, test$Survived)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc