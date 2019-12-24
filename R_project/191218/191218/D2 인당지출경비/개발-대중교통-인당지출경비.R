# 인당 지출 경비

library(ggplot2)
library(dplyr)
# library(reshape2)
setwd('C:/Users/jinxi/Documents/191218/D2 인당지출경비')

indiv_pblctr <- read.csv("개별-대중교통-인당지출경비.csv", header=T)# 평균 4321원

ggplot(indiv_pblctr[-7,])+
  geom_bar(aes(x="", y = 개별.대중교통비, fill = 비교),
           stat = "identity", width = 1, color="white" )+
  ggtitle(label = "개별여행 대중교통 인당지출경비") +
  coord_fixed(ratio=0.1)+
  scale_fill_discrete( limits = c("2만원 미만", "2만원 이상-5만원 미만",
                                  "5만원 이상-10만원 미만", "10만원 이상-20만원 미만",
                                  "20만원 이상", "경험없음" ) )



indiv_rentcar <- read.csv("개별-렌트-인당지출경비.csv", header=T)# 평균 42268원

ggplot(indiv_rentcar[-7,])+
  geom_bar(aes(x="", y = 개별.차량임대비, fill = 비교),
           stat = "identity", width = 1, color="white" )+
  ggtitle(label = "개별여행 차량임대 인당지출경비") +
  coord_fixed(ratio=0.1)+
  scale_fill_discrete( limits = c("2만원 미만", "2만원 이상-5만원 미만",
                                  "5만원 이상-10만원 미만", "10만원 이상-20만원 미만",
                                  "20만원 이상", "경험없음" ) )


indiv_air <- read.csv("개별-항공선박-인당지출경비.csv", header=T)# 평균 42268원
indiv_air
ggplot(indiv_air[-6,])+
  geom_bar(aes(x="", y = 개별.항공선박료, fill = 비교),
           stat = "identity", width = 1, color="white" )+
  ggtitle(label = "개별여행 항공선박 인당지출경비") +
  coord_fixed(ratio=0.1)


