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