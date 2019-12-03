#
# 5일차
#

# read.table
setwd('D:/work123')
df <- read.table( file = 'airquality.txt', header = TRUE)
df

class(df)
dim(df)
str(df)
head(df,3)
tail(df,3)

#read.xlsx
install.packages("xlsx")
install.packages("rJava")

library(rJava)  #install시킨 package를 library로 쓰겠다고 선언
library(xlsx)   

df.xlsx <- read.xlsx( file = 'airquality.xlsx', sheetIndex = 1, encoding = 'UTF-8')
df.xlsx
class(df.xlsx)
str(df.xlsx)
head(df.xlsx, 3)
tail(df.xlsx, 3)

## xlsx과 txt의 차이점 : str로 확인해보면 xlsx은 factor로 된 변수들이...,
##                        sheet 지정과 encoding도..     모르겠으면Reference 확인해봐

############### 참고 ################
# read.csv
#
setwd( 'D:/test/work123')
air <- read.csv( 'airquality.csv', header = T, encoding = 'UTF-8' )  # header 있는지 없는지는 데이터보고 구분할 것.

class( air )
dim( air )
str( air )
head( air )
tail( air )
#####################################


score <- c(76,84,69,50,95,6,82,71,88,84)
which( score == 69 ) # index 위치 찾
which( score >= 85 )
max( score )
which.max( score )
min( score )
which.min( score )

idx <- which( score >= 60 )
score[ idx ] <- 61
score

idx <- which( iris[,1:4] > 5.0, arr.ind = TRUE )
idx


#
# 탐색적 데이터 분석
#

#
# '단일변수(일변량)' '범주형' 자료 탐색
# 주로 막대그래프 원차트
favorite <- c('WINTER', 'SUMMER', 'SPRING',
              'SUMMER', 'SUMMER', 'FALL',
              'FALL','SUMMER','SPRING', 'SPRING')
favorite
class(favorite)
table(favorite)
table(favorite) / length(favorite) # 도수분포

ds <- table(favorite)
ds
barplot(ds, main = 'favorite season')

ds.new <- ds[ c(2, 3, 1, 4) ] # x축 변수 순서 변경
ds.new
barplot( ds.new, main = 'favorite season')

pie( ds, main = 'favorite season')
pie( ds.new, clockwise = TRUE, main = 'favorite season')



favorite.color <- c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)  # 숫자로 되어있으나 범주형
                                              # Why? 값이 한정되어 있기 때문
barplot(ds, main = 'favorite season')
colors <- c('green', 'red', 'blue')
name(ds) <- colors
ds
barplot(ds, main = 'favorite season', col = colors)
pie(ds, main = 'favorite season', col = colors)


#
# '단일변수(일변량)' '연속형' 자료 탐색
# 주로 히스토그램 박스표

weight <- c(60,62,64,65,68,69)
weight
weight.heavy <- c(weight,120)
weight.heavy
  #평균 : outlier가 있을 시 평균의 신뢰도 ↓
mean(weight)
mean(weight.heavy)
  #중앙값
median(weight)
median(weight.heavy)
  #절사평균 : 일부 편차 퍼센트 제외한 평균
mean( weight, trim = 0.2 )
mean( weight.heavy, trim = 0.2)
  #사분위수
quantile( weight.heavy )
quantile( weight.heavy, (0:10) / 10 )

summary( weight.heavy ) # 최소, 1사분위, 중앙값(2사분위), 평균, 3사분위, 최대
  # 분산
var( weight )
  # 표준편차
sd( weight)
  # 값의 범위(최소값과 최대값)
range( weight )
  # 최대값과 최소값의 차이
diff( range( weight) )

  # 상기 값을 구하는 걸 '산포'라고 함
  # 산포 : 값이 얼마나 퍼져있나 알아보는..


  # histogram : 연속형 자료의 분포를 시각화
  # 연속형 자료에서는 구간을 나누고 구간에 속한 값들의 개수를 세는 방법으로 사용
  # '연속형 자료'의 구간 빈도 확인
str( cars )
dist <- cars[,2]
hist( dist, main = 'Histogram for 제도거리',
      xlab = '제동거리', ylab = '빈도수',
      border = 'blue', col = 'green',
      las = 1, breaks = 10)

  # boxplot(상자그림; 상자수염그림)
  # 사분위수를 시각화하여 그래프 형태로 표시
  # 상자그림은 하나의 그래프로 데이터의 분포
  # 형태를 포함한 다양한 정보를 전달
  # 자료의 전반적인 분포를 이해하는데 도움
  # 구체적인 최소/최대/중앙값을 알기는 어려움

boxplot( dist, main = '자동차 제동거리')

boxplot.stats( dist )       
boxplot.stats( dist )$stats # 정상범위 사분위수
boxplot.stats( dist )$n     # 관측치 개수
boxplot.stats( dist )$conf  # 중앙값 신뢰구간
boxplot.stats( dist )$out   # 이상치(특이값) 목록

  #일변량중 그룹으로 구성된 자료의 상자그림
boxplot( Petal.Length~Species, 
         data = iris,
         main = '품종별 꽃잎의 길이')

boxplot( iris$Petal.Length~iris$Species,
         main = '품종별 꽃잎의 길이')

  # 한 화면에 여러 그래프 작성!
par( mfrow = c(1,3) ) #1x3 가상화면 분할
barplot( table( mtcars$carb), main = 'Car',
         xlab = 'carburetors', ylab = 'freq',
         las = 1, col = 'blue')
barplot( table( mtcars$cyl), main = 'cyl',
         xlab = 'cyl', ylab = 'freq',
         las = 1, col = 'red')
barplot( table( mtcars$gear), main = 'gear',
         xlab = 'gear', ylab = 'freq',
         las = 1, col = 'green')
par( mfrow = c(1,1) ) # 가상화면 분할 해제

mtcars



