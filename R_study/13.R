#
#
#
# 군집화(clustering) / 분류(claasification)
#

# 모델에 관한 입장차
#
# 컴퓨터 과학자 : 모델을 개선시킨다 or 새로운 모델을 만든다
# 데이터 과학자 : 모델 구성, 문제 해결에 어떤 것을 적용할 것인가
#

# 
# 군집화(clustering) : 주어진 대상 데이터들을 유사성이 높은 것끼리 묶어주는 기술
#                       ( 군집, 범주, 그룹 )
#
# K-means 군집화 알고리즘(함수호출..)

mydata <- iris[, 1:4]
fit <- kmeans( x = mydata, center = 3)   # 그룹(군집) 개수 : 3
fit

# 출력결과

# K-means clustering with 3 clusters of sizes 38, 50, 62                   -> 3개 군집에 속한 데이터 개수
# 
# Cluster means:                                                            -> 3개 군집의 중심점 좌표
#   Sepal.Length Sepal.Width Petal.Length Petal.Width
# 1     6.850000    3.073684     5.742105    2.071053
# 2     5.006000    3.428000     1.462000    0.246000
# 3     5.901613    2.748387     4.393548    1.433871
# 
# Clustering vector:                                                        -> 3개 군집 그룹 번호
#   [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
# [34] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3
# [67] 3 3 3 3 3 3 3 3 3 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
# [100] 3 1 3 1 1 1 1 3 1 1 1 1 1 1 3 3 1 1 1 1 3 1 3 1 3 1 1 3 3 1 1 1 1
# [133] 1 3 1 1 1 1 3 1 1 1 3 1 1 1 3 1 1 3
# 
# Within cluster sum of squares by cluster:
#   [1] 23.87947 15.15100 39.82097
# (between_SS / total_SS =  88.4 %)
# 
# Available components:
#   
#   [1] "cluster"      "centers"      "totss"        "withinss"    
# [5] "tot.withinss" "betweenss"    "size"         "iter"        
# [9] "ifault"      

fit$cluster
fit$centers

library( cluster )
clusplot( mydata,          # 군집 대상
          fit$cluster,     # 군집 번호
          color = TRUE,    # 원의 색
          shade = TRUE,    # 원의 빗금표시유무
          labels = 1,      # 관측값 출력 형태
          lines = 0 )      # 중심선 연결 표시

da <- subset( mydata, fit$cluster == 2)
da

#
# 대상 데이터 정규화 후 군집화
#
# 데이터와 데이터의 거리를 계산할 때 발생하는 문제
# 모든 변수가 거리 계산에 동등한 영향을 갖도록 하기 위해서
# 모든 변수의 자료 범위를 0~1 사이로 표준화한 후 거리 계산을 한다.
#
# ( x - min(A) ) / ( max(A) - min(A) )
# x : 변수 A의 임의의 관측값
# max(A), min(A)는 변수 A 관측값 중 최대/최소값
#

std <- function(x){
  return (x - min(x)) / (max(x) - min(x))
}

std <- apply( iris[, 1:4], 2, std)
fit <- kmeans( x= mydata, center = 3)
fit


#
# knn(k-nearest Neighbor) 최근접이웃
#
library(class)
#훈련용/테스트용 데이터 준비
tr.idx <- c(1:25, 51:75, 101:125)
ds.tr <- iris[tr.idx, 1:4] #훈련용
ds.ts <- iris[-tr.idx, 1:4] #테스트용
cl.tr <- factor( iris[tr.idx, 5]) #훈련용 그룹정보
cl.ts <- factor( iris[-tr.idx, 5]) # 테스트 그룹정보
pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob =TRUE)
pred
acc <- mean( pred == cl.ts )
acc
table(pred, cl.ts )


# 검증
install.packages( "cvTools" )
library( cvTools )

k = 10
folds <- cvFolds(nrow(iris), K=k)
acc <- c()
for(i in 1:k){
  ts.idx <- folds$which == i
  ds.tr <- iris[-ts.idx, 1:4]
  ds.ts <- iris[ts.idx, 1:4]
  cl.tr <- factor( iris[-ts.idx, 5])
  cl.ts <- factor( iris[ts.idx, 5])
  pred <- knn(ds.tr, ds.ts, cl.tr, k=5)
  acc[i] <- mean(pred==cl.ts) # 예측 정확도
}
acc # 폴드별 예측 정확도
mean(acc) # 폴드평균 예측정확도
