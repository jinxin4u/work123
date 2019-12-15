## 체류기간-국적별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
staytimes <- read.csv("체류기간-국적별.csv", header=T)
staytimes


staytimes.df <- melt( staytimes[, c("X", "X1일", "X2일", "X3일", "X4일",
                                    "X5일", "X6일", "X7일", "X8일",
                                    "X9일", "X10일", "X11일.이상")], id = "X")
ggplot(staytimes.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )



## 체류기간-성별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
staytimes <- read.csv("체류기간-성별.csv", header=T)
staytimes


staytimes.df <- melt( staytimes[, c("X", "X1일", "X2일", "X3일", "X4일",
                                    "X5일", "X6일", "X7일", "X8일",
                                    "X9일", "X10일", "X11일.이상")], id = "X")
ggplot(staytimes.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )





## 체류기간-연령별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
staytimes <- read.csv("체류기간-연령별.csv", header=T)
staytimes


staytimes.df <- melt( staytimes[, c("X", "X1일", "X2일", "X3일", "X4일",
                                    "X5일", "X6일", "X7일", "X8일",
                                    "X9일", "X10일", "X11일.이상")], id = "X")
ggplot(staytimes.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )



## 체류기간-여행형태별 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/4. 체류기간, 숙박일수, 숙박장소')
staytimes <- read.csv("체류기간-여행형태별.csv", header=T)
staytimes


staytimes.df <- melt( staytimes[, c("X", "X1일", "X2일", "X3일", "X4일",
                                    "X5일", "X6일", "X7일", "X8일",
                                    "X9일", "X10일", "X11일.이상")], id = "X")
ggplot(staytimes.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )
