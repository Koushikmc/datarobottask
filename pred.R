library(caret)
library(class)
library(e1071)
data1<-read.table("D:/bank.csv",sep=";",header=TRUE)
train <-  data1[1:3000,]
test <-data1[3001:4521,]
test_class <- test$y
test$y <-NULL
pred <-glm(y~age+balance+duration+campaign+pdays+previous,data=train,family=binomial(link="logit"))
confint(pred)
outc<- predict(pred,test,type = "response")
pred_class <- rep("no",1521)
pred_class[outc > 0.47] = "yes"
confusionMatrix(pred_class,test_class)
