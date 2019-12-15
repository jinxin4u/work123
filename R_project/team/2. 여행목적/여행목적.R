## 여행목적-국적별

library(ggplot2)
library(reshape2)

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/2. 여행목적')
purpose <- read.csv("2018 여행목적 국적별.csv", header=T)
purpose


purpose.df <- melt( purpose[, c("X", "여가.위락.휴식", "신혼여행", "사업.산업시찰활동",
                                "학술.세미나활동", "직장인센티브여행", "친구.친지방문",
                                "뷰티.의료관광", "쇼핑", "기타")], id = "X")
purpose.df

ggplot(purpose.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )



## 여행목적-성별
purpose.gender <- read.csv("2018 여행목적 성별.csv", header=T)
purpose.gender

purpose.gender.df <- melt( purpose.gender[, c("X", "여가.위락.휴식", "신혼여행", "사업.산업시찰활동",
                                "학술.세미나활동", "직장인센티브여행", "친구.친지방문",
                                "뷰티.의료관광", "쇼핑", "기타")], id = "X")
ggplot(purpose.gender.df)+
  geom_bar(aes(x=X, y=value, fill = variable),
           position = "fill", stat = "identity")


## 여행목적-연령별
purpose.age <- read.csv("2018 여행목적 연령별.csv", header=T)
purpose.age

purpose.age.df <- melt( purpose.age[, c("X", "여가.위락.휴식", "신혼여행", "사업.산업시찰활동",
                                              "학술.세미나활동", "직장인센티브여행", "친구.친지방문",
                                              "뷰티.의료관광", "쇼핑", "기타")], id = "X")
ggplot(purpose.age.df)+
  geom_bar(aes(x=X, y=value, fill = variable),
           position = "fill", stat = "identity")

## 여행목적-여행형태별
purpose.type <- read.csv("2018 여행목적 여행형태별.csv", header=T)
purpose.type

purpose.type.df <- melt( purpose.type[, c("X", "여가.위락.휴식", "신혼여행", "사업.산업시찰활동",
                                        "학술.세미나활동", "직장인센티브여행", "친구.친지방문",
                                        "뷰티.의료관광", "쇼핑", "기타")], id = "X")
ggplot(purpose.type.df)+
  geom_bar(aes(x=X, y=value, fill = variable),
           position = "fill", stat = "identity")
