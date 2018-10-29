```R
# recode
library('car')
x1 = c(1,2,3,1,2,3,1,2,3)
recode(x1, "c(1,2)='a';else='b'")
recode(x1,"1:2='a';3='b'")

score = rnorm(10,60,20)
recode(score,"lo:59='pass'; 60:hi='fail'")

score_rep=read.csv("C:\\Users\\Sherry\\Google Drive\\OneDrive\\TMU\\R\\R Code\\score_repeat.csv")
head(score_rep)

score.long=reshape(score_rep, direction="long", varying=list(c(
"english.1","english.2", "english.3"),c("math.1","math.2","math.3"))
, v.names=c("english","math"),timevar="time", idvar="stid")
score.long

score.wide=reshape(score.long, direction="wide",
v.names = c("english","math"), timevar="time", idvar="stid")
score.wide

library('reshape')
melt.long = melt(score.wide, id.vars = c("stid","class"))
melt.long

names(melt.long)[3:4] = c("subject","scores")

score_rep
score = score_rep[,1:5]
score

melt.long = melt(score, id.vars=c("stid","class"))
melt.long

melt.long$variable = as.numeric(sub("english.", "", melt.long$variable))

melt.long$variable = recode(melt.long$variable, "1='first';
2='second'; 3='third'")

cast(melt.long, stid~class)
cast(melt.long, stid~class, fun.aggregate=mean)
cast(melt.long, stid~class+variable)
cast(melt.long, stid~class|variable)
yy = cast(melt.long, stid~class|variable)
yy$"A"
yy$"first"
melt.long

library(xlsx)
library(readxl)
cvd=read_excel("CVD_All.xlsx")
head(cvd)

a1 = sample(1:nrow(iris), 10, replace=F)
a2 = sample(1:nrow(iris), 10, replace=F)
data_a1 = cvd[a1,1:4]
data_a2 = cvd[a2,1:4]
data_pool = rbind(data_a1, data_a2)
data_pool

gender = c("F","M","F")
smoke = c(1,0,0)
y = split(gender, smoke)
y

y$"F"
y$"0"

A = matrix(1:20, nrow=4, ncol=5)
A
A1 = A[,c(2,4,5)]
A1

rownames(A1) = c("R1","R2","R3","R4")
(A1[c("R1","R4"),c("C1","C2")])  #????????????????????????????????????????????????????

sample(1:nrow(iris))

library(xlsx)
library(readxl)
cvd=read_excel("CVD_All.xlsx")
data=cvd[3:4]
names(data)

colnames(data)=c("age","gender")
names(data)

male=data[data$gender=="1",]
age_60=data[data$age>60,]
head(age_60)
head(data)

kk=data[data$age>60 & data$gender==1,]
head(kk)
table_c=xtabs(~gender, data=kk)
table_c

subset(iris, iris$Sepal.Length>7.5, select=c("Sepal.Width","Petal.Width"))
```
