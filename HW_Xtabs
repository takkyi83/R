```R
library(xlsx)
library(readxl)

# Randomly choose 100 samples
cvd = read_xlsx("C:\\Users\\Sherry\\Documents\\TMU_R\\CVD_All.xlsx")
cvd = na.omit(cvd)
data_i = sample(1:length(cvd$ID),100,replace=F)

# at least include 5 variables (include waist width)
data2 = cvd[data_i,c(2,4:7)]
head(data2)
#class(data2[[1]])
#data2 = as.factor(data2[[1]])
#levels(data2[[1]])


# devide data base on CVD
# subset
cvd_1 = subset(data2, data2[1]==1)
cvd_0 = subset(data2, data2[1]==0)

# count cvd_1, cvd_2
xtabs(~data2[[1]], data=data2)

# calculate waist width [4] mean
x = cbind(round(mean(cvd_1[[4]]),2),round(mean(cvd_0[[4]]),2))
rownames(x) = c("mean")
colnames(x) = c("cvd","no cvd")
x

# do analysis base on "gender"
xtabs(~data2[[2]]+data2[[1]], data=data2)

#收縮壓(SBP)的正常值在90和140之間。小於90偏低，
#大於140偏高。 利用CVD_all資料，利用if, else if將資料分成三部份：
#偏低、正常、偏高。
N=matrix(1,100,1)
for (i in 1:100)
{
    if(data2$'收縮壓'[i]<90)
    {N[i]="too low"}
    else if(data2$'收縮壓'[i]>140)
    {N[i]="too high"}
    else
    {N[i]="normal"}
}
colnames(N) = c("sbp status")
data3 = cbind(data2,N)
head(data3,100)
```

