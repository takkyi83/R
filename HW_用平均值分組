```R
# 將CVD_All資料讀入
# 並將腰圍命名為y
# 將腰圍利用腰圍平均切成二組，並給高、低名稱
# 計數高、低兩組之個數

install.packages("rJava")
install.packages("xlsx")
install.packages("readxl")
library(xlsx)
library(readxl)

mydata=read_excel("CVD_All.xlsx")
head(mydata)

y=(mydata["腰圍"])
y

code=c("high","low")
y_index=1*(y<=78)+2*(y>78)
y_index
class("y")
(newcode=code[y_index])
xtabs(~newcode,data=mydata)
```
