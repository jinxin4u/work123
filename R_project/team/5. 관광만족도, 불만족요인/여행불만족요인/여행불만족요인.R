## 여행불만족요인-국적별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('D:/6-project/김신혁/191215/5. 관광만족도, 불만족요인')
unliked <- read.csv("여행불만족요인-국적별.csv", header=T)
unliked


unliked.df <- melt( unliked[, c("X", "여행정보를.얻기.어렵다", "관광정보가.정확하지.않다", "관광종사원이.불친절하다",
                                "안내표지판이.부정확하다", "식당과.음식이.불결하다", "음식이.입에.맞지.않는다", "물가가.비싸다",
                                "대중교통.이용이.불편하다", "택시기사.서비스가.불편하다","관광가이드의.서비스가.좋지.않다",
                                "쇼핑품목이.다양하지.못하다","상품구입을.강요한다","기타","불만족하거나.불편했던.점이.없다",
                                "언어소통이.불편하다")], id = "X")
ggplot(unliked.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )



## 여행불만족요인-성별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
unliked <- read.csv("여행불만족요인-성별.csv", header=T)
unliked


unliked.df <- melt( unliked[, c("X", "여행정보를.얻기.어렵다", "관광정보가.정확하지.않다", "관광종사원이.불친절하다",
                                "안내표지판이.부정확하다", "식당과.음식이.불결하다", "음식이.입에.맞지.않는다", "물가가.비싸다",
                                "대중교통.이용이.불편하다", "택시기사.서비스가.불편하다","관광가이드의.서비스가.좋지.않다",
                                "쇼핑품목이.다양하지.못하다","상품구입을.강요한다","기타","불만족하거나.불편했던.점이.없다",
                                "언어소통이.불편하다")], id = "X")

ggplot(unliked.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )





## 여행불만족요인-연령별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
unliked <- read.csv("여행불만족요인-연령별.csv", header=T)
unliked

unliked.df <- melt( unliked[, c("X", "여행정보를.얻기.어렵다", "관광정보가.정확하지.않다", "관광종사원이.불친절하다",
                                "안내표지판이.부정확하다", "식당과.음식이.불결하다", "음식이.입에.맞지.않는다", "물가가.비싸다",
                                "대중교통.이용이.불편하다", "택시기사.서비스가.불편하다","관광가이드의.서비스가.좋지.않다",
                                "쇼핑품목이.다양하지.못하다","상품구입을.강요한다","기타","불만족하거나.불편했던.점이.없다",
                                "언어소통이.불편하다")], id = "X")

ggplot(unliked.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )



## 여행불만족요인-여행형태별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
unliked <- read.csv("여행불만족요인-여행형태별.csv", header=T)
unliked


unliked.df <- melt( unliked[, c("X", "여행정보를.얻기.어렵다", "관광정보가.정확하지.않다", "관광종사원이.불친절하다",
                                "안내표지판이.부정확하다", "식당과.음식이.불결하다", "음식이.입에.맞지.않는다", "물가가.비싸다",
                                "대중교통.이용이.불편하다", "택시기사.서비스가.불편하다","관광가이드의.서비스가.좋지.않다",
                                "쇼핑품목이.다양하지.못하다","상품구입을.강요한다","기타","불만족하거나.불편했던.점이.없다",
                                "언어소통이.불편하다")], id = "X")

ggplot(unliked.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )
