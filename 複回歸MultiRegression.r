```R
babies=read.csv("C:/.../babies2.csv",header=T)
names(babies)
babies$toxemia=as.factor(babies$toxemia)
sum(is.na(babies$tomemia))  # the data has no NA, which is good
# if it is not factor, R takes it as continuous numerical data.
# R does "dummy" automatically for factor
class(babies$toxemia)
babies$sex=as.factor(babies$sex)
class(babies$sex)

# decide correlation model
# pearson - check variables' relevancy. -1 ~ 1. 0: not relation
# spearman - 
cor(babies[,1:5],method="pearson")
cor(babies[,1:5],method="spearman")

#lm - regression
# y ~ x
# Resisuals - margin errors
# t value = (estimation - B)/S.E.
# y = -932.4044 + 30.310X
# ANOVA在檢定除了傑具象以外的係數是不適0 也就是檢定B是不適0  
lm.gest=lm(birthwt~gestage,babies)
summary(lm.gest)

##散佈圖
pairs(babies[,1:5])
plot(babies[,3:4])


library(GGally)
library(ggplot2)
GGally::ggpairs(babies[,1:5]) 
# geom_point - 散佈圖
ggplot(babies)+geom_point(aes(x=gestage,y=birthwt))
qplot(gestage,birthwt,data=babies)

p=ggplot(babies)
p+geom_point(aes(x=gestage,y=birthwt))
p+geom_point(aes(x=gestage,y=birthwt))+labs(x="懷孕週數",y="體重") ##page8

##page9
# shape - use shapes to represent genders
# label = sex - use 1,0 to represent genders
p+geom_point(aes(x=gestage,y=birthwt, shape=sex), size=4)
p+geom_text(aes(x=gestage,y=birthwt,label=sex))

##page10
p+geom_histogram(binwidth=4, aes(x=gestage))+labs(x="懷孕週數")  
#fill 填顏色
#facet_wrap 做分層
p+geom_histogram(binwidth=4, aes(x=gestage, fill=sex))+labs(x="懷孕週數")+facet_wrap(~sex) 

##page11
ggplot(iris, aes(x=iris[,1], fill=iris[,5]))+geom_histogram(binwidth=1)
# histogram of each species under same scale
ggplot(iris, aes(x=iris[,1], fill=iris[,5]))+geom_histogram(binwidth=1)+facet_wrap(~iris[,5])

##page12
p+geom_point(aes(x=gestage, y=birthwt, colour = toxemia))+labs(x="懷孕週數")

##page13 
##加入迴歸線- geom_abline(intercept, slope)
#coef係數: 截距和斜率
lmcoef=coef(lm(birthwt~gestage,babies))
lmcoef
p+geom_point(aes(x=gestage, y=birthwt))+geom_abline(intercept=lmcoef[1],slope=lmcoef[2])

##page 14 複迴歸 -
#複迴歸 -"控制在其他變數不變下"：＂在考慮妊娠毒血症及母親年齡下＂
#拒絕虛無假設 -> 不用檢定B=0,因B不具影響 不拒絕->需考慮B
# F在檢定除了B以外的係數是不適0
lm.mult=lm(birthwt~gestage+toxemia+momage,data=babies)
lm.mult
summary(lm.mult)

##複迴歸畫圖
library(coefplot)
#看信賴區間寬度，含0不拒絕虛無假設
coefplot(lm.mult)

##page 16
##複回歸交互作用項 - *
# 1.檢定要步要加交互作用 H0: B4 = 0   Ha:B4!=0
#接受虛無假社:不用加交互作用項
lm.multinter=lm(birthwt~gestage*toxemia+momage,data=babies)
summary(lm.multinter)

#通常不會用這個模型
lm.multinter2=lm(birthwt~gestage:toxemia+momage,data=babies)  
lm.multinter2

##page 17
coefplot(lm.multinter)
coefplot(lm.multinter2)

##page18
lm(birthwt~gestage+toxemia+I(headcirc/length),data=babies)
##和交互作用項*效果相同
lm(birthwt~gestage+toxemia+(gestage+toxemia)^2,data=babies)
##可直接轉換: 取跟不取log，截距項不同
lm.mult0=lm(birthwt~gestage+toxemia+momage,data=babies)
lm.mult1=lm(birthwt~log(gestage)+toxemia+momage,data=babies)
multiplot(lm.mult0,lm.mult1)

##殘差檢定
resid=lm.mult0$residuals
resid
#檢查是不適常態分配
#拒絕虛無假社 非常態分配
shapiro.test(resid)

library(car)
ncv.test(lm.mult0)

durbin.watson(lm.mult0)
plot(resid)

##殘差分析圖
par(mfcol=c(2,2))
plot(lm.mult0)

##指定參考組
table(babies$sex)
lm.mult=lm(birthwt~gestage+sex,data=babies)
lm.mult

#重新指定參考組的號碼為"1"- relevel
babies$sex1=relevel(babies$sex,ref="1")
names(babies)
table(babies$sex1)
lm.mult1=lm(birthwt~gestage+sex1,data=babies)
lm.mult1
```



