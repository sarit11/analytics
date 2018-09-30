(grades = sample(c('A','B', 'C','D'), size=30, replace=T, prob=c(.4,.2,.3,.1)))

dfgrad= data.frame(grades,stringsAsFactors = F)
dfgrad$grades = factor(dfgrad$grades)

summary(dfgrad)


grades = sample(c(LETTERS[1:4]), size=30 , replace=T , prob=c(.4,.3,.2,.1))
gradesF = factor(grades)

summary(grades) #only shows the length of the vector

summary(gradesF) # shows the level as well , categoraise the vector 

table(grades)
table(gradesF)

gradesFO = factor(grades , ordered=T)
gradesFO

gradesFO1 =  factor(grades , ordered=T , levels=c('B','C','A','D')) #UserDeinedOrdering default:alphabetically 


summary(gradesFO1)

marks = ceiling(rnorm(30, mean=60 , sd=5))
marks

gender = factor(sample(c('M','F'),size=30,replace = T))

student1 = data.frame(marks, gradesFO1)
boxplot(marks ~ gradesFO1 , data = student1)

student1

boxplot(marks)
summary(marks)

abline(h= summary(marks))
