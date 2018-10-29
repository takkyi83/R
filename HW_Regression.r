```R
##統計:迴歸作業
#1. 試利用心血管疾病資料（CVD ALL）分析沒有
#心血管疾病成人之腰圍與收縮壓的關係。（顯著水
#準設定為0.05）
#(1)請問腰圍與收縮壓的皮爾生相關係數為何？兩者是否
#存在顯著的線性關係？
#(2)請問腰圍與收縮壓的斯皮爾曼等級相關為何？兩者是
#否存在顯著的等級相關？
#(3)試利用簡單線性迴歸模型建立腰圍預測收縮壓之模型，
#I. 請問此模型為何？
#II. 腰圍是否與收縮壓有顯著相關？此模型腰圍解釋了
#收縮壓變異的多少百分比？
#III. 若有一人腰圍為100公分，請預測此人平均而言收
#壓縮何？

library(xlsx)
library(readxl)

##########由於我的r會顯示中文為亂碼，所以column names都改成英文############
data=read_excel("CVD_All.xlsx")

head(data)
names(data)
head(data$'Waist circumference')
head(data$'Systolic pressure')
# There are NAs, need to remove them so we can do calculation
sum(is.na(data$'Waist circumference'))
sum(is.na(data$'Systolic pressure'))
# rmeove na
data<-na.omit(data)

# 算有幾個rows的心血管疾病為0，這裡要用length而不是用nrow,因為一個column看作是一個list
##sum is used to add elements;
##nrow is used to count the number of rows in a rectangular array (typically a matrix or data.frame);
##length is used to count the number of elements in a vector.
length(data$'Cardiovascular diseases'=="0")
#備份data到data1，data1只保留無心血管疾病資料
data1 <- data
data1 <- data1[!(data1$`Cardiovascular diseases`==0),]

#問:(1)請問腰圍與收縮壓的皮爾生相關係數為何？兩者是否
#存在顯著的線性關係？
#答: Pearson相關係數為0.32 代表腰圍與收縮壓是small correlation
cor(data1[,6:7],method="pearson")

#問:(2)請問腰圍與收縮壓的斯皮爾曼等級相關為何？兩者是
#否存在顯著的等級相關？
#答:Spearman相關係數為0.33 代表腰圍與收縮壓是small correlation
cor(data1[,6:7],method="spearman")

#(3)試利用簡單線性迴歸模型建立腰圍預測收縮壓之模型，
#問:I. 請問此模型為何？
#答:回歸方程式: 收縮壓 = 63.48 + 0.14*腰圍

#問:II. 腰圍是否與收縮壓有顯著相關？
#答:p value < 0.05表兩變數具有線性相關

#問:此模型腰圍解釋了收縮壓變異的多少百分比？
#答: %10

#問:III. 若有一人腰圍為100公分，請預測此人平均而言收壓縮何？
#答:77.48
lm_data1<-lm(data1$'Waist circumference'~data1$'Systolic pressure',data1)
summary(lm_data1)

##=======================================================================
#R回歸作業
# 題目和統計作業相同
# 圖：利用ggplot畫出單變量迴歸線及散佈圖 但需用R程式撰寫
# 注意： 
#– 類別變數需要確定有定義成factor 或  lm.mult=lm(birthwt~gestage+factor(toxemia)+momage,data=babies)
#– 參考組：小數字及先出現之英文字母
#– 性別：女為0, 男為1 女為1, 男為0 

#散佈圖
pairs(data1[,6:7])
plot(data1[,6:7])
library(GGally)
library(ggplot2)
GGally::ggpairs(data1[,6:7]) 
# geom_point - 散佈圖
ggplot(data1)+geom_point(aes(x=data1$'Waist circumference',y=data1$'Systolic pressure'))
qplot(data1$'Waist circumference',data1$'Systolic pressure',data=data1)

p=ggplot(data1)
p+geom_point(aes(x=data1$'Waist circumference',y=data1$'Systolic pressure'))
p+geom_point(aes(x=data1$'Waist circumference',y=data1$'Systolic pressure'))+labs(x="腰圍",y="收縮壓") ##page8
```

