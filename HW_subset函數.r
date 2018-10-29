```R
#作業6.5.4 使用subset函數來切割資料
#利用CSD_All資料
  #隨機選出100資料
  #包含五個變數(須包含腰圍)
  #依照有、無心血管疾病作分割
  #並計算個別資料之人數、及腰圍平均數


library(xlsx)
library(readxl)
mydata=read_excel("CVD_All.xlsx")
head(mydata)
nrow(mydata)
ncol(mydata)
attach(mydata)
ran_mydata=sample(1:200,100,replace=F)
ran_mydata2=mydata[ran_mydata,2:6]

head(ran_mydata2)


heart_split=split(ran_mydata2,"心血管疾病",drop=F)
heart_split$'心血管疾病'

attach(heart_split)

heart_disease=c(1,0,0)
y=split('心血管疾病',heart_disease)

#colnames(ran_mydata2[1]) <- "heart"
#head(ran_mydata2)

ab_1 = ran_mydata2[ran_mydata2$'心血管疾病'==1,]
ab_0 = ran_mydata2[ran_mydata2$'心血管疾病'==0,]

aa_1 = xtabs(~'心血管疾病', ran_mydata2=ab_1)
aa_2 = xtabs(~'心血管疾病', ran_mydata2=ab_2)
```


