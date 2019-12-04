#
# 6일차
#
#
# 다중변수 자료 탐색
# 두 변수 사이의 산점도
# 산점도(scatter plot) - 2변수로 구성된 자료의 분포를 알아보는 그래프
#                       관측값들의 분포를 통해 2변수 사이의 관계파악
#

# 이변량 산점도
wt <- mtcars$wt
mpg <- mtcars$mpg

plot(wt, mpg, main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "red", pch = 19) # 산점도 [pch (plotting character): 점모양 0~25]

# 이변량 데이터 넣는 유형들
plot(mtcars$wt, mtcars$mpg, main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "red", pch = 19) # 유형1
plot(mtcars[, c('wt','mpg') ], main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "red", pch = 19) # 유형2
plot(mpg~wt, data = mtcars, main = "중량-연비 그래프",
     xlab = "중량", ylab = "연비",
     col = "red", pch = 19) # 유형3

# 여러 변수들간의 산점도
vars <- c('mpg', 'disp', 'drat', 'wt')
target <- mtcars[, vars]
head(target)
pairs(target,main = 'multi plots') # pairs는 이변량 이상의 산점도를 그릴 수 있음

# 그룹정보가 있는 두 변수의 산점도
str(iris)
iris.2 <- iris[, 3:4]
point <- as.numeric( iris$Species )
point
color <- c('red', 'green', 'blue')
plot(iris.2, main='Iris plot',
     pch = c(point+18),
     col = color[ point ])

# 상관분석
beers <- c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,
         0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame( beers, bal)
tbl

plot(bal~beers, data = tbl)

# 회귀식     lm(linear model)
res <- lm( bal~beers, data = tbl ) 
res

# 회귀선
abline( res )

# 상관계수 도출 (correlation)
cor( tbl[ , 1:2 ] )   # 이변량 상관 계수
cor( iris[ , 1:4 ] )  # 다변량 상관 계수

############################################################
##
## 상관 분석 과정 : 
##
## 1. 상관분석 대상 변수 선정
##
## 2. 산점도 작성 (관측값 분포확인) : plot()
##
## 3. 회귀식 도출 : lm()
##    (회귀식 : 두 변수의 선형관계를 가장 잘
##              나타낼 수 있는 선의 식)
##    ( y = xw + b )
##
## 4. 회귀선을 산점도에 표시 : abline()
##    (회귀선 : 관측값들의 추세를 가장 잘
##              나타낼 수 있는 선)
##
## 5. 상관계수 계산 : cor()
##
## 6. 상관분석 결과 해석
##
############################################################


#################################
# 시계열 Data 분석 - 선그래프

month <- 1:12
late <- c(5,8,7,9,4,6,12,13,8,6,6,4)

plot(month, late, main = '지각생통계',
     type = 'l', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )      # lty : line type, lwd : line width
plot(month, late, main = '지각생통계',
     type = 'b', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 'o', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 's', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 'S', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 'p', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 'c', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 'h', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )
plot(month, late, main = '지각생통계',
     type = 'n', lty= 1, lwd = 1,
     xlab = 'Month', ylab = 'late cnt' )

# 복수의 선 그래프
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)

plot(month, late1, main = '지각생통계',
     type = 'b', lty= 1, col = 'red',
     xlab = 'Month', ylab = 'late cnt',
     ylim = c(1,15) )                   # ylim : y 좌표 범위
lines(month, late2, type = 'b', col = 'blue' )



##############
#
# 자료 탐색 실습 - 탐색적 데이터 분석
#
# 0단계 : 문제 정의
# 1단계 : 분석 대상 데이터셋 준비
#         BostonHousing 데이터셋(mlbench pac.)
#
install.packages('mlbench')
library(mlbench)
data('BostonHousing')
  # crim : 1인당 범죄율
  # rm : 주택 1가구당 방수
  # dis : 보스턴 5개 지역센터까지의 거리
  # tax
  # medv : 주택가격
class( BostonHousing )
dim(BostonHousing)
str(BostonHousing)
head(BostonHousing)
tail(BostonHousing)

myds <- BostonHousing[,c('crim',
                         'rm',
                         'dis',
                         'tax',
                         'medv')]
# 2단계 : 파생 변수 추가
#         [ grp 변수 추가(주택가격상중하) ]
grp <- c()
for(i in 1:nrow(myds)){
  if( myds$medv[i] >= 25.0 ){
    grp[i] <- 'H'
  } else if ( myds$medv[i] <= 17.0){
    grp[i] <- 'L'
  } else {
    grp[i] <- 'M'
  }
}

grp <- factor(grp)
grp <- factor(grp, levels = c('H','M','L'))
grp
myds <- data.frame(myds, grp)
head(myds)

# 3단계 : 데이터셋의 형태와 기본적인 내용 파악
str( myds )
head( myds )
table( myds$grp )

# 4단계 : 히스토그램에 의한 관측값의 분포 확인 : 정규분포에 가까운지
par( mfrow=c(2,3) )
for(i in 1:5){
  hist( myds[,i], main = colnames( myds )[i],
        col = 'yellow')
}
par( mfrow = c(1,1))

# 5단계 : 상자그림에 의한 관측값의 분포 확인 : 이상치는 없는지
par( mfrow=c(2,3) )
for(i in 1:5){
  boxplot( myds[,i], main = colnames( myds )[i])
}
par( mfrow = c(1,1))


# 6단계 : 그룹별 관측값 분포 확인
boxplot(myds$crim~myds$grp, main = '1인당 범죄율')
boxplot(myds$rm~myds$grp, main = '방의 개수')
boxplot(myds$dis~myds$grp, main = '지역센터까지의 거리')
boxplot(myds$tax~myds$grp, main = '세금')
boxplot(myds$medv~myds$grp, main = '주택가격')
  # crim : 1인당 범죄율
  # rm : 주택 1가구당 방수
  # dis : 보스턴 5개 지역센터까지의 거리
  # tax
  # medv : 주택가격

# 7단계 : 다중 산점도를 통한 변수 간 상관관계 확인
pairs( myds[,-6] )

# 8단계 : 그룹 정보를 포함한 변수 간 상관관계 확인
point <- as.integer(myds$grp)
color <- c('red','green','blue')
pairs( myds[,-6], pch = point,
       col = color[ point ])

# 9단계 : 변수 간 상관관계 확인
cor( myds[,-6] )

# 탐색적데이터분석으로
# Data에 대한 이해를 하고,
# 문제 정의를 검증,
# 문제 정의에 대한 1차 결과 파악
#####################






