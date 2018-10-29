```R
#讀檔
infant <- read.csv("C:\\...\\infant.csv")
infant <- na.omit(infant)
head(infant)

#1.-1 請查詢變數名稱及欄位屬性
names(infant)
sapply(infant, class)

#1.-2
summary(infant)
sd(infant$'weight')

#1.-3
#peasrson correlation
cor(infant[5:7],method="pearson")
#spearman correlation
cor(infant[5:7],method="spearman")
# dot plot
library(ggplot2)
library(GGally)
p = ggplot(infant)
# dot plot of age and height
p+geom_point(aes(x=age, y=height))+labs(x="Age",y="Height")
# dot plot of age and weight
p+geom_point(aes(x=age, y=weight))+labs(x="Age",y="Weight")
# dot plot of weight and height
p+geom_point(aes(x=weight, y=height))+labs(x="Weight",y="Height")

#2.1
#將weight以平均數分成兩組(0大於平均 1小於等於平均)
weight <-ifelse(infant$'weight'<=128.6,1,0)
#將age依24, 29歲分為低中高三組
age <- ifelse(infant$'age'<=24,"low",(ifelse(infant$'age'<=29,"mid","high")))
head(age)

#2.-2
#以weight為y. age, parity為x. 母親最低年齡為reference group進行下列分析
#infant[[5]] <- as.factor(infant[[5]])
class(infant$age)
infant$'age'=factor(infant$'age',levels=c("low","mid","high"))
levels(infant$'age')

infant$'weight' = factor(infant$'weight',levels=c(0,1))
#infant$weight <- as.factor(infant[[7]])
class(infant$weight)
levels(infant$weight)
head(infant)

#2.-2 -1
#解釋此複迴歸模型下，age係數之解釋
glm <- glm(infant$'weight' ~infant$'age'+infant$'parity', family=binomial(link='logit'),data=infant)
summary(glm)

#3
p = ggplot(infant)
p+geom_point(aes(x=weight, y=age))+labs(x="Weight",y="age")

infant <- read.csv("C:\\Users\\Sherry\\Google Drive\\OneDrive\\TMU\\R\\R Code\\infant.csv")
infant <- na.omit(infant)
hist(infant$'age',main="babies")

head(smoke)
boxplot(infant$'gestation'~infant$'smoke')
```




