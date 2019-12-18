# 이름 : 김신혁
# 작성일 : 191217
# 제출일 : 191217
#
# 
# 문1)
# trees 데이터셋에 대해 다음의 문제를 해결하는 R 코드를 작성하시오.
# 
# (1) 나무 둘레(Girth)와 나무의 키(Height)로 나무의 볼륨을 예측하는 다중선형 회귀
# 모델을 만드시오.
# 
df <- data.frame(trees)

plot(df, pch = 19, col = 'red')
model <- lm(Volume~., data = df)

coef(model)
# deviance(model)
# deviance(model) / length( nrow(df) )

summary(model)
# library(MASS)
# stepAICed_model <- stepAIC(model)
# Adjusted R-squared:  0.9442 

B0 <- -57.9876589
B1 <- 4.7081605
B2 <- 0.3392512
Volume = B0 + B1 * Girth + B2 * Height



# (2) 다중선형 회귀모델을 이용하여 trees 데이터셋의 나무 둘레(Girth)와 나무의 키
# (Height)로 나무의 볼륨을 예측하시오.
# 
GirthHeightTest <- trees[,c(1,2)]
Volume_pred <- predict(model, GirthHeightTest )
Volume_pred

# (3) (2)에서 예측한 볼륨과 실제 trees 데이터셋의 볼륨(Volume)이 얼마나 차이가
# 나는지 보이시오. (예측값, 실제값, 예측값-실제값을 나타낸다.)
# 

Volume_pred
fitted(model)
residuals(model)



# 문2)
# mtcars 데이터셋에서 다른 변수들을 이용하여 연비(mpg)를 예측하는 다중 회귀모델을 만드시오.
# 
# (1) 전체 변수를 이용하여 연비(mpg)를 예측하는 회귀모델을 만들고 회귀식을 나타
# 내시오.
# 

studycase <- data.frame(mtcars)

plot(studycase, pch=19, col='red')
model <- lm(mpg~., data = studycase)
coef(model)
fitted(model)
residuals(model)
deviance(model)
deviance(model) / length( nrow(studycase) )
summary(model)

B0 = 12.30337416
B1 = -0.11144048
B2 = 0.01333524
B3 = -0.02148212
B4 = 0.78711097
B5 = -3.71530393
B6 = 0.82104075
B7 = 0.31776281
B8 = 2.52022689
B9 = 0.65541302
B10 = -0.19941925

mpg = B0 + B1 * cyl + B2 * disp + B3 * hp + B4 * drat + B5 * wt
    + B6 * qsec + B7 * vs + B8 * am + B9 * gear + B10 * carb

# (2) 연비(mpg)를 예측하는 데 도움이 되는 변수들만 사용하여 예측하는 회귀모델을
# 만들고 회귀식을 나타내시오.
#

changed_model <- stepAIC(model)
coef(changed_model)
summary(changed_model)

B0 = 9.617781
B1 = -3.916504
B2 = 1.225886
B3 = 2.935837

mpg = B0 + B1 * wt + B2 * qsec + B3 * am

mtcars
testcase <- mtcars[, c(6,7,9) ]
predict(changed_model, testcase)


# (3) (1), (2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교하시오.
# 
summary(model)
summary(changed_model)






# 문3) 
# UCLA 대학원의 입학 데이터를 불러와서 mydata에 저장한 후 다음 물음에 답하시오.
# 
mydata <- read.csv( "https://stats.idre.ucla.edu/stat/data/binary.csv" )
# 
# (1) gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는 로지스틱 모델을 만드시오(0: 불합격, 1:합격).
# 

str(mydata)
model <- glm(admit~., data = mydata)
summary(model)
changed_model <- stepAIC(model)
summary(model)

# (2) mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여 (1)에서 만든 모델에 입력하여 
# 합격 여부를 예측하고 실제값과 예측값을 나타내시오.
# 

testcase <- mydata[,c(2:4)]
pred <- predict(model, testcase)
pred <- round(pred, 0)
pred

fitted(model)
residuals(model)



# (3) 만들어진 모델의 예측 정확도를 나타내시오.


pred == mydata$admit
score <- mean(pred == mydata$admit)
score





