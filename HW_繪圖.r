```R
library(xlsx)
library(readxl)

mydata=read_excel("CVD_All.xlsx")
head(mydata)

1. 從CVD_All中隨機抽出5000筆資料來進行繪圖
mysample = sample(mydata, 5000, replace=TRUE)

# 2.1 畫出腰圍、收縮壓(SBP)之散布圖
plot(mysample$'腰圍',mysample$'收縮壓')
#2.2 畫出腰圍的直方圖
hist(mysample$'腰圍')
#2.3 畫出收縮壓之直方圖
hist(mysample$'收縮壓')
#2.4.畫出不同的抽菸量下之收縮壓的boxplot
boxplot(mysample$'收縮壓'~mysample$'抽菸量')

par(fig=c(0,0.65,0,0.65))
plot(mysample$'腰圍',mysample$'收縮壓')

par(fig=c(0,0.65,0.35,1),new=TRUE)
hist(mysample$'腰圍')

par(fig=c(0.55,1,0,0.6),new=TRUE)
hist(mysample$'收縮壓')

par(fig=c(0.45,1,0.45,1),new=TRUE)
boxplot(mysample$'收縮壓'~mysample$'抽菸量')

#4. 畫出不同的抽菸量下之收縮壓及年齡的散布圖

par(fig=c(0,0.65,0,0.65))
plot(mysample$'腰圍'~mysample$'收縮壓', data=subset(mysample, '抽菸量' == '0'))

par(fig=c(0,0.65,0.35,1),new=TRUE)
plot(mysample$'腰圍'~mysample$'收縮壓', data=subset(mysample, '抽菸量' == '1'))

par(fig=c(0.45,1,0,0.6),new=TRUE)
plot(mysample$'腰圍'~mysample$'收縮壓', data=subset(mysample, '抽菸量' == '2'))
```
