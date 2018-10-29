```R
#利用lung cancer study，以復發與否作為依變項，解釋
#變項為性別、抽菸，回答下列問題：
#1. 性別是否為干擾因子？
#2. 在單變項迴歸，請解釋抽菸對復發之影響。
#3. 在多變項迴歸，請解釋抽菸對復發之影響。
#4. 性別和抽菸是否具有交互作用？
#5. 無論交互作用是否顯著，請解釋交互作用之意義？

lung = read.csv("C:\\...\\lung_cancer_study.csv")
head(lung)
lung = na.omit(lung)
#---------------------------------------------------1. 性別是否為干擾因子？
#資料說明:
  # referece group 為 SMOKING
  # 0存活；1死亡
# 方法:檢定OR在有性別和無性別下的差異大小
# 統計方法: logistic regression
#　y: vital status
# H0: 性別不適干擾因子 OR = 1

#不加入性別  x: smoking
attach(lung)
glm <- glm(Vital.Status ~ SMOKING, family=binomial(link="logit"),data=lung)
summary(glm)
#OR
exp(coef(glm))
# 信賴區間 CI
exp(confint(glm))  # include 1, fail to reject H0

#加入性別  x: smoking, gender
glm2 <- glm(Vital.Status ~ SMOKING+GENDER, family=binomial(link="logit"),data=lung)
summary(glm2)
#OR
exp(coef(glm2))
exp(confint(glm2))  # include 1, fail to reject H0
#答: 有無性別的OR差異不大，P VALUE < 0.05，CI 包含1，無法拒絕虛無假設

#--------------------------------------------------------2. 在單變項迴歸，請解釋抽菸對復發之影響。
# y:vital status   x:smoking
# 方法:用p value看抽菸和存活有無相關。用OR看相關程度
glm <- glm(Vital.Status ~ SMOKING, family=binomial(link="logit"),data=lung)
summary(glm)
#OR
exp(coef(glm))
#答: Never smoked的or是0.69, 表從來沒抽菸的人的死亡率為now smoking的0.69倍
  #smoked in the past的or是0.97, 表過去抽菸的人的死亡率為now smoking的0.69倍


#-------------------------------------------------------3. 在多變項迴歸，請解釋抽菸對復發之影響
#方法: 加入性別  y: vital status  x:smoking, gender
glm2 <- glm(Vital.Status ~ SMOKING+GENDER, family=binomial(link="logit"),data=lung)
summary(glm2)
#OR
exp(coef(glm2))
#答: 在控制性別下，never smoked的死亡率為now smoking 的0.71倍
  #在控制性別下，smoked in the past的死亡率為now smoking 的0.96倍

#------------------------------------------------------4. 性別和抽菸是否具有交互作用？
#回歸式 logit{p(y-1|G)} = a + B1*S1 + B2*S2 +B3*G + B4*G*S1 + B5*G*S2
# H0: B4 = 0
# H0: B5 = 0
glm3 <- glm(Vital.Status ~ SMOKING*GENDER, family=binomial(link="logit"),data=lung)
summary(glm3)

#答: p value都>0.05 無法拒絕虛無假設，性別與抽菸無交互作用

#5. 無論交互作用是否顯著，請解釋交互作用之意義？
exp(coef(glm3))  
```

