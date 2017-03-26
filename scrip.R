library(dplyr)
library(ggplot2)
library('ggthemes')
train<-read.csv('train.csv', stringsAsFactors = F)
train$Title<-gsub('(.*, )|(\\..*)', '', train$Name)
table(train$Title, train$Sex)
other_title<-c('Capt','Col', 'Don', 'Dr','Jonkheer','Lady','Major','Rev','Sir','the Countess')
train$Title[train$Title == "Mlle"]<-'Miss'
train$Title[train$Title == 'Mme']<-'Mrs'
train$Title[train$Title == 'Ms']<-'Miss'
train$Title[train$Title %in% other_title]<-'Other Titles'
table(train$Title, train$Sex)
train$Surname <- sapply(train$Name,  function(x) strsplit(x, split = '[,.]')[[1]][1])
train$FSize<-train$SibSp+train$Parch+1
train$FullFamily<-paste(train$Surname, train$FSize, sep='_')
train$surviveRatio<-train$Survived
