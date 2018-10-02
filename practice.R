#Data Frame for 100 students






gender = sample(c('M','F'), size = 100 , replace = T, prob = NULL)
spl = sample(c('Marketing', 'Finance','Finance', 'HR'),size = 100, replace = T, prob = NULL)
grades = sample(c('A','B', 'C','D'), size=100, replace=T, prob=c(.4,.2,.3,.1))
gradesFO1 =  factor(grades , ordered=T , levels=c('D','C','B','A')) 
str(spl)
spl
placement =  sample(c('Yes','No'), size = 100 , replace = T)
age = ceiling(runif(100 , min = 21,max= 30))
age
experience = ceiling(rnorm(n=100,mean=4,sd=1))

student= data.frame(gender,spl,gradesFO1,placement,age,experience)
student

library(dplyr)
summarise(student,mean(age), mean(experience))

count(student,age)

student %>% filter(spl != 'Marketing' ) %>% group_by(spl) %>% summarise(max(experience))

student %>% group_by(spl) %>% summarise(avgexp = mean(experience), meanage = mean(age)) %>% arrange( desc(meanage), avgexp)

hist(student$experience)

write.csv(student ,'./data/ximb.csv')

#clustering 

km3 = kmeans(student[,c('age','experience')],centers=3)
km3

install.packages('rpart')
library(rpart)
tree= rpart(placement ~ . , data= student)
tree
printcp(tree)

install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(tree , nn=T ,cex=.8)


#logistic regression
logitmodel1 = glm(placement ~ . , data= student , family='binomial')
summary(logitmodel1)

logitmodel1a = glm(placement ~ gradesFO1 , data = student , family='binomial')
logitmodel1a
summary(logitmodel1a)

linear1 = lm(age ~. , data=student)
summary (linear1)
