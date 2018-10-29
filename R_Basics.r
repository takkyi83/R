```R
# 1. 建立一個4 x 5 的matrix
x = matrix(1:20,nrow = 4, ncol = 5,byrow = TRUE)
x

# 2. 查x的維度
dim(x)

# 3. 計算每行之平均數
mean(x[,1]); mean(x[,2]); mean(x[,3]); mean(x[,4]); mean(x[,5])

# 4. 找出第三行，第四列的元素
x[4,3]

# 5.
gender =c('F','M','F','M','M','M','M','M','M','F','M','M','M','F','M','M','M','F','F','F')
grade =c(90,80,70,80,90,80,70,80,90,80,70,80,90,80,70,80,90,80,70,80)
head.index=1+(grade > mean(grade))
newcodes=c("H","M","L")
headsize=newcodes[head.index]
headtable = table(gender,grade)

# Week 1
a <- c(1,2,3,4,5)
mean(a)
sd(a)
hist(a)

apropos("norm")


install.packages("car")
library(car)

?car
?car:Anova

detach(car)

data(iris)
head(iris,10)
tail(iris,5)
mean(iris$Sepal.Length)

attach(iris)
mean(Sepal.Length)

getwd()
#setwd("")

memory.size()
memory.limit()

seq(1,3,0.5)
seq(1,3,length=10)
rep(10,5)
rep(c("a","b"),3,each=2)
rep(c("a","b"), 3, each=2, length=6)
matrix(rep(0,16), nrow=4)
matrix(rep(c("a","b"),length=16),nrow=4)

x<-c(1,2,3,4,5)
y<-c(x,0)
y

x=c(1,2,3,4,5)
x[2]
x[2]*x[5]

#物件的自動循環重複特性
 x = c(1,2,3,4,5,6)
 x + 2 # 相當於c(1,2,3,4,5,6) + c(2,2,2,2,2,2)
 
# ---------------------------------------------------------# 
# ---------------------------------------------------------#
# 從N(5,10)機率分配產生10個隨機變數，存到y向量
y = rnorm(100,5,10)
y
#Q1 = 第25百分位數，Q3 = 第75百分位數
Q1 = quantile(y,0.25)
Q3 = quantile(y,0.75)
 
stat.names = c("min", "Q1", "mean", "medium", "Q3", "max")
s = c(min(y), Q1, mean(y), median(y), Q3, max(y))
names(s) = stat.names
print(s)
# histogram - using probability on y axis instead of counts
hist(y,prob=TRUE)
# 機率密度曲線empirical density，使用虛線
lines(density(y), lty=2)
# normal(5,10) 理論機率密度曲線
curve(dnorm(x,5,10), min(y), max(y), n=100, add=TRUE)

#------------------------------------------------------------#
# -----------------------------------------------------------#
# 建立一個自訂函數來比較兩個數字大小，若前者大於後者，傳回"及格"，否則傳回"不及格"
mycompare = function(a, b)
{
  if (a > b)
    c = "及格"
  else
    c = "不及格"
  return(c) #自訂函數最後傳回字串變數c的內容
}

# 產生隨機亂數之前，先設定隨機起始點
set.seed(123454321)
# 從 N(60,5) 

data(iris)
head(iris)
mean(iris$Sepal.Width)
sd(iris$Sepal.Width)
hist(iris$Sepal.Length)
attach(iris)
mean(Sepal.Length)
seq(1,10,10)
se1(1,10)
seq(1,10)
seq(1,10,5)
rep("a",2, each = 3, length = 4)
x = c(1,2,3,4,5)
Q1 = quantile(x , 0.75)
Q1
hist(x)
lines(density(x), lty=2)
stat.names = c("min", "Q1")
x1 = c(min(x), Q1)
names(x1) = stat.names
x1

##--------------------##
x = c(1:10)
x
x(-3)
x[-3]
iris(data)
iris[,2]
head(iris)
head(iris[2:3])
head(iris[,2:3])
x
round(pi,5)
signif(pi,5) 
is.numeric(x)

# WEEK 2==================================#
x=c(1:10)
x
x[-3]
data(iris)
iris[1,2]
iris[,2:3]
names(iris[-1])
names(iris[,-1])
names(iris)
factorial(5)
choose(5,2)
signif(pi,5)
round(pi,5)
x = c(1,2,3,4,5)
sum(x)
cumsum(x)
prod(x)
cumprod(x)
y = c(-1,-2,-3,-4,-5)
outer(x,y)
sample(6,8,replace = T)
z = c(0.5,0.7,1.5,1.9)
trunc(z)
w=numeric(10)
w1=matrix(0, nrow=10, ncol=3)
w2 = array(0,dim=c(3,3,3))
w2
w
w1
is.numeric(x)
is.double(iris$Sepal.Length)

a_name="sherry"
class(a_name)
true_false=TRUE
class(true_false)
x
x = x[-c(1,5)]
x
dim(x)
x2 = matrix(x, nrow = 2, ncol = 4)
dim(x2)
x3 = c(0,2,3)
x3
y1 = c(x,x3)
y1
y1[c(1,9)]= c(100,100)
y1
y1 = c(y1[1:3], 222,y1[4:10])
y1

v1 = c(1,2,3)
v2 = c(4,5,6)
a1 = rbind(v1,v2)
a1
a2 = cbind(v1,v2)
a2
is.array(a1)
is.matrix(a1)
xx = array(1:20, dim=c(4,5))
xx
dim(xx)
length(xx)
ncol(xx)
aperm(xx)

## WEEK 3----------------------------##
data(iris)
names(iris)
as.factor(iris$Species)
is.factor(iris$Species)
boxplot(iris$Sepal.Length~iris$Species)
#離群值Q1-1.5IQR; Q3+1.5IQR  #極端值Q1-3IQR; Q3+3IQR
#離群值與極端值必須先被探討他為何產生，才決定做甚麼動作

x = rnorm(20)
y = rnorm(20)
lm.result=lm(y~x)
names(lm.result)
lm.result$coefficients

myfriend=list(nicknames="sherry", wife="may",n.children=0, child.age=0)
myfriend

attributes(myfriend)
names(myfriend)
myfriend$nicknames
myfriend[1]
myfriend[[1]]

myfriend2=list(nickname="marina", wife="s", n.children=0,child.age=0)
friends=rbind(myfriend,myfriend2)
friends
class(friends)

iris(data)
iris$Sepal.Length
iris[,"Sepal.Length"]  #有逗點，回傳向量
iris[,2]  #有逗點，回傳向量
iris[2]   #沒有逗點，回傳data-frame
iris["Sepal.Length"]  #沒有逗點，回傳data-frame
class(iris[,5,drop=F])  #最好用data frame,若一定要用向量可以用這個指令。R會回傳向量 且忽略他不適data frame
names((iris[,5])  #vector不存在"names"
names(iris[5])   #data frame存在names

# SOLVED : To read Chinese https://www.zhihu.com/question/21435159
install.packages("rJava")
install.packages("xlsx")
install.packages("readxl")
library(xlsx)
library(readxl)
aa=read_excel("CVD_All.xlsx")
head(aa)
dim(aa)
class(aa[,16])

x = data.frame()
x = edit(x)
x = fix(x)


x=c(age=3, height=75, weight=15)
x
names(x)
x[age]    #錯誤。在方框內必須有" "
x["age"]
x[1]
x[[3]]
x[[1]]
is.list(x)

## WEEK 4---------------------##
# 課本程式範例1-4
x = read.table("C:/Users/Sherry/Google Drive/OneDrive/TMU/R/R Code/babies.txt",header = F)
weight.diff = function(weight,standard)
{
  difference = weight - standard
  return(difference)
}
na.omit(x)
bwt2 = x$bwt
summary(bwt2)

Q1 = quantile(bwt2,0.25)

# 計算bwt2向量中所有元素的個數
n = length(bwt2)
# 先宣告一個空的文字向量變數weight 2(for 數值向量用=numeric(n)), 預留n個元素的位置
weight2 = character(n)

#?????????????????????????????????????????????????#
for(i in 1:n)
{ 
    if(weight.diff(bwt2[i],Q1)<=0){
        weight2[i] = "Low"
  } else {
        weight2[i] = "OK"
  }
}

x$weight2 = weight2

write.table(x, "C:/Users/Sherry/Google Drive/OneDrive/TMU/R/R Code/babies_output.txt", quote = FALSE,
            row.names = FALSE)


#=====4.4.3查詢或設定行列名稱=======
#names() 向量變數。為每個元素命名或查詢
#colnames, rownames二維陣列或矩陣變數。查詢，命名
#row.names data-frame變數。查詢，命名
#dimnames(x[[1]]) 陣列變數。查詢，命名

xx=matrix(60:65,nrow=2,ncol=3)
dimnames(xx)[[1]]   # error: because didnt give rows and col names
xx
dimnames(xx)[[1]]=c("r1","r2")  #correct, now you can allocate it
xx
dimnames(xx)[[2]]=c("c1","c2","c3")
xx

#abbreviate 變數名稱簡化
x <- c("abcd", "efgh", "abce")
abbreviate(x, 2)
abbreviate(x, 2, strict = TRUE) # >> 1st and 3rd are == "ab"

#======Attributes判斷資料類型，取得headings======
data("iris")
attributes(iris)
attr(iris,"class")
attr(iris,"names")
attr(iris,"row.names")

#=======4.4.5 which系列指標的功能======
#which(邏輯判斷式, arr.ind=FALSE)
#arr.ind 邏輯判斷式會回傳matrix位置。defult is False
#read by "columns"
xx = matrix(60:65, nrow = 2, ncol = 3)
which(xx%%3==0)
which(xx%%3==0,arr.ind=T)  #search by "columns"
xx
?which

#rbind: combine vectors by "rows"  
#cbind: combine by columns
xx1=c(30,22,10)
xx2=c(30,21,43)
xx3=c(39,43,11)
xx4=c(1,2,3)
xxp=rbind(xx1,xx2,xx3,xx4)
xxp

which.max(xxp)         #list the first largest value's location
which(xxp==max(xxp))   #list all largest values' locations
xxp[which(xxp==max(xxp))]   #return the "value" of [the location]
max(xxp)

install.packages("car")
library(car)
which.names("setosa",iris$Species)    #which.names is only in "car" package

# match()找吻合
match(xx1,xx2)
match(1:10, c(2,4,6,9))

#表格型態的彙整資料:列聯表:多用於類別資料、名目資料、序位資料(癌症期別)
#連續型資料須先做切割(用黃金準則 老中青年齡層)，再用列聯表
#一維向量: 
  #tabulate:結構和"一維向量"相同(一個變數  抽菸 不抽菸)
  #table函數: 產生之物件的類別(class)是table,但它其實是"陣列"(超過三個維度)

# tabulate function
score = c(64,65,61,63,60,70,61,63,62,69,68,68,66,69,69)
score = factor(score)  # factor() 對資料做排序(Levels)
class(score)
(score.tabulate=tabulate(factor(score)))  #return each values' "counts"
class(score.tabulate)
is.vector(score.tabulate)
attributes(score.tabulate)  # because it is a "vector", attributes()不支援查詢

(score.table=table(score))  #no need to transfer to factor first if using "table"
is.array(score.table)

#table function
(score.table=table(score))
class(score.table)
is.vector(score.table)
is.matrix(score.table)
is.array(score.table)
attributes(score.table)

#xtabs function: for "data frame", similar to "table"
iris.xtabs=xtabs(~Species, data=iris)
iris.xtabs
is.vector(iris.xtabs)
is.array(iris.xtabs)
iris.xtabs[2]

#4.4
#is.numeric/factor/matrix  判斷資料類型
#as.  轉換資料類型
gender = c("f","f","m")
is.factor(gender)
gender = as.factor(gender)
is.factor(gender)
gender

#dim
dim(iris)  #return rows, columns numbers

#attributes: list objects' attribution
attributes(iris)

#Tidy data
  #1. columns: data variables
  #2. rows: observations
  #3. 表格自成一類: 表格間用"index"串連

#class
class(iris)

#attr(data,"查甚麼")
attr(iris,"class")
attr(iris,"names")

##表格型態的彙整資料#####
#資料存到mydata
mydata=read.table("C:/Users/Sherry/Google Drive/OneDrive/TMU/R/R Code/example3_10.txt",header =T)
# head1欄被平均值分成1,2兩個編碼，存在head.index欄
# 加mydata$ 變數才會被加到資料欄位中
mydata$head.index=1+(mydata$head1 > mean(mydata$head1)) 
mydata$head.index
# 根據[head.index]的結果，編碼轉成"L""H",存在headsize欄
newcodes=c("L","H")
mydata$headsize=newcodes[head.index]
head(mydata)

#重複以上步驟
#breadth1.index欄: 以平均數標準編碼成1,2
mydata$breadth1.index=1+(mydata$breadth1>mean(mydata$breadth1))
mydata$breadth1.index
dim(mydata)
newcodes=c("narrow","wide")
#breadthsize欄:根據[breadth1.index]的結果，編碼轉成"narrow","wide"
mydata$breadthsize=newcodes[mydata$breadth1.index]
head(mydata)

##建立breadthsize和headsize列聯表
headtable=table(mydata$breadthsize,mydata$headsize)
headtable
is.matrix(headtable)
is.array(headtable)
headtable[2,2]
headtable["wide","L"]
#xtabs和table不同處:會呈現變數名稱，table只會呈現類別
head.xtabs=xtabs(~breadthsize+headsize,data=mydata)
head.xtabs

## WEEK 5 ---------------------##
# 6.1 重新編碼
# 6.6.1 使用邏輯判斷式

x = c(1,13,30)
x2 = 1*(x<=10)+2*(x>10 & x<=20)+3*(x>20)  #按1,2,3編碼 class = numeric
x2
class(x2)
as.factor(x2)

#按labels編碼
lavels=c("A","B","C")
x3=labels(x2)
x3
class(x3)

#Example: 將年齡轉為1-20, 21-40, 41-60,61以上，並編碼為
#1,2,3,4

#若數值中只有少數幾個值，或想轉成文字，可以使用%in%
#運算子(表示在某個集合之內)

# ifelse. same as excel formula
x4=ifelse(x<=20,2,3)
x4

x4=ifelse(x>20,3,ifelse(x<=10,1,2))
x4

x4=ifelse(x>20,"C",ifelse(x<=10,"A","B"))
x4

y=c("A","B","C","D","C","D")
y2=ifelse(y %in% c("A","C"),"Group1","Group2")
y2

#6.1.2 cut()函數
#cut函數可根據我們所提供的切點將資料重新編碼，將一
#個數值向量轉換成分類的factor變數
#cut(x, breaks, labels, include.lowest=F, right=T)
x
x5=cut(x,breaks=c(0,10,20,max(x)),labels=c("A","B","C"))
x5

#沒給labels時會回傳區間
#(:不包含  ]:包含
x5=cut(x,breaks=3)
x5

#不寫labels寫F 會寫出是在第幾組
x5=cut(x,breaks=3, labels=F)
x5
class(x5)  #此時不適factor, 是integer

#Normal Distribution 
score=round(rnorm(20,60,10),2)
summary(score)
score.cut=cut(score,breaks=5)
score.cut=cut(score,breaks=5,labels=F)
score.cut
class(score.cut)

# 練習
# 將CVD_All資料讀入
# 並將腰圍命名為y
# 將腰圍利用腰圍平均切成二組，並給高、低名稱
# 計數高、低兩組之個數

#6.1.3 使用car套件的recorde函數
install.packages("car")
library("car")
x1=c(1,2,3,1,2,3,1,2,3)
recode(x1,"c(1,2)='A';else='B'")
recode(x1,"1:2='A';3='B'")

recode(score,"lo:59=0;60:hi=1")
recode(score,"lo:59='pass';60:hi='failed'")

#6.2 sort,rnak,order,rev
x1=c(55,11,44,22,33,9)
sort(x1)
sort(x,decreasing=F)
rank(x1)  #"原始"位置去找"排序後"的序號
order(x1)  #排序後，去找"原始"的位置





```
