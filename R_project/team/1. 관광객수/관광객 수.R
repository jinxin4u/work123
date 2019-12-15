library(ggplot2)

times <- c(2010:2018)
seoul <- c(1,11,5,15,9,3,13,7,17)
busan <- c(2,4,6,8,10,12,14,16,18)
daegu <- c(25,24,22,20,18,16,17,5,20)

df1 <- data.frame(times, seoul, busan, daegu)
df1


#  다중 선 그래프 예시
ggplot(df1)+
  geom_line(aes(x=times, y=seoul))+
  geom_line(aes(x=times, y=busan))+
  geom_line(aes(x=times, y=daegu))
  

# ggplot2 단점은 동일 플롯에서 여러 y축을 가져올수 없다는 것..
# 같은 스케일에서 여러 시계열 그릴 경우 일부가 작게 나타남
# 이를 방지하려면 facet_wrap() 함수에서 scale='free' 로 인수 지정하면 됨

# 심화
ggplot(df1)+
  geom_line(aes(x=times, y=seoul, col="seoul"), linetype = 6, size = 1.2)+
  geom_line(aes(x=times, y=busan, col="busan"))+
  geom_line(aes(x=times, y=daegu, col="daegu"))+
  labs(title = "제목")+
  theme(legend.position = c(1,0), legend.justification = c(1,0))+
  geom_bar( aes(y=))

# ggplot(foreigners)+
#   geom_line(aes(x=구분, y=일본, col="일본", group = 1))+
#   geom_line(aes(x=구분, y=중국, col="중국", group = 1))+
#   geom_line(aes(x=구분, y=홍콩, col="홍콩", group = 1))+
#   geom_line(aes(x=구분, y=대만, col="대만", group = 1))+
#   geom_line(aes(x=구분, y=싱가폴, col="싱가폴", group = 1))+
#   geom_line(aes(x=구분, y=말레이시아, col="말레이시아", group = 1))+
#   geom_line(aes(x=구분, y=인도네시아, col="인도네시아", group = 1))+
#   geom_line(aes(x=구분, y=베트남, col="베트남", group = 1))+
#   geom_line(aes(x=구분, y=아시아기타, col="아시아기타", group = 1))+
#   geom_line(aes(x=구분, y=미국, col="미국", group = 1))+
#   geom_line(aes(x=구분, y=서구기타, col="서구기타", group = 1))+
#   labs(title = "15-18년 제주 외인 관광객 수")+
#   xlab("연도") + ylab("관광객 수")+
#   theme(legend.position = c(1,1), legend.justification = c(1,1))



### 관광객 수

## 15-18 월단위 외인 관광객 수
library('reshape2')

setwd('C:/Users/jinxi/OneDrive/Desktop/191215/1. 관광객수')
foreigners.month <- read.csv("외인 관광 현황 월단위 2015-2018.csv", header=T)
foreigners.month

foreigners.month.df <- melt( foreigners.month[, c("구분", "일본", "중국", "홍콩", "대만",
                     "싱가폴", "말레이시아", "인도네시아", "베트남",
                     "아시아기타", "미국", "서구기타")], id = "구분")

ggplot(foreigners.month.df)+
  geom_line( aes( x = 구분, y = value, color = variable, group = variable) )+
  ggtitle("15-18년 월단위 제주 외인 관광객 수")+
  xlab("연도") + ylab("관광객 방문수")



## 15-18 연단위 외인 관광객 수
# foreigners.year <- read.csv("외인 관광 현황 연단위 2015-2018.csv", header=T)
# foreigners.year
# 
# foreigners.year.df <- melt( foreigners.year[, c("구분", "일본", "중국", "홍콩", "대만",
#                                       "싱가폴", "말레이시아", "인도네시아", "베트남",
#                                       "아시아기타", "미국", "서구기타")], id = "구분")
# foreigners.year.df
# ggplot(foreigners.year.df)+
#   geom_line( aes( x = 구분, y = value, color = variable, group = variable) )+
#   ggtitle("15-18년 연단위 제주 외인 관광객 수")+
#   xlab("연도") + ylab("관광객 방문수")+
#   theme(legend.position = c(1,1), legend.justification = c(1,1))






## 외인+한인 15-18 월단위 관광객 수
trip.month <- read.csv("외인+한국 관광 월단위 2015-2018.csv", header = T)
trip.month


trip.month.df <- melt( trip.month[, c("구분", "한국", "일본", "중국", "홍콩", "대만",
                                      "싱가폴", "말레이시아", "인도네시아", "베트남",
                                      "아시아기타", "미국", "서구기타")], id = "구분")
trip.month.df
ggplot(trip.month.df)+
  geom_line( aes( x = 구분, y = value, color = variable, group = variable) ) +
  ggtitle("15-18년 월단위 제주 관광객 수")+
  xlab("연도") + ylab("관광객 수")



# 15년 2분기 특이점 - 외부요인 파악 - 메르스,관광객 상관관계
# 4월 ~ 8월
mersAndtrip <- read.csv("관광객메르스.csv",header=T)
mersAndtrip

plot(mersAndtrip$관광객수, mersAndtrip$MERS,
     ylab = "국내 메르스 확진자", xlab = "제주 관광객 수",
     col = "red", pch = 19)

# 회귀식 도출
res <- lm( mersAndtrip$MERS~mersAndtrip$관광객수, data = mersAndtrip ) 
res

# 회귀선
abline( res )

# 상관계수 도출 (correlation)
cor( mersAndtrip[ , 2:3 ] )  # 다변량 상관 계수



# 중국 외 외국인 15-18 월단위 관광
setwd('C:/Users/jinxi/OneDrive/Desktop/191215/1. 관광객수')
chinaout.month <- read.csv("중화권 제외 관광 월단위 2015-2018.csv", header=T)
chinaout.month

chinaout.month.df <- melt( chinaout.month[, c("구분", "일본", "홍콩", "대만",
                                                  "싱가폴", "말레이시아", "인도네시아", "베트남",
                                                  "아시아기타", "미국", "서구기타")], id = "구분")

ggplot(chinaout.month.df)+
  geom_line( aes( x = 구분, y = value, color = variable, group = variable) )+
  ggtitle("15-18년 중국 외 외인 관광객 수")+
  xlab("연도") + ylab("관광객 방문수")


# 국가 대분류(중국 제외) 외국인 15-18 월단위 관광
setwd('C:/Users/jinxi/OneDrive/Desktop/191215/1. 관광객수')
cont.month <- read.csv("국가 대분류 관광 월단위 2015-2018.csv", header=T)
cont.month

cont.month.df <- melt( cont.month[, c("월", "일본권", "중화권", "동남아권", "아시아기타",
                                    "북미", "서구기타")], id = "월")

ggplot(cont.month.df)+
  geom_line( aes( x = 월, y = value, color = variable, group = variable) )+
  ggtitle("15-18년 중국 외 외인 관광객 수")+
  xlab("연도") + ylab("관광객 방문수")



# 내국인 - 요인 파악 - 평균기온, 관광객 상관관계
setwd('C:/Users/jinxi/OneDrive/Desktop/191215/1. 관광객수/요인분석')
kortemper <- read.csv("한인 기온 2015-2018.csv",header=T)
kortemper

plot(kortemper$평균기온, kortemper$관광객수,
     xlab = "평균기온", ylab = "제주 관광객 수",
     col = "red", pch = 19)

# 회귀식 도출
res <- lm( kortemper$관광객수~kortemper$평균기온, data = kortemper ) 
res

# 회귀선
abline( res )

# 상관계수 도출 (correlation)
cor( kortemper[ , 2:3 ] )  # 다변량 상관 계수




# 동남아권 - 요인 파악 - 평균기온, 관광객 상관관계
setwd('C:/Users/jinxi/OneDrive/Desktop/191215/1. 관광객수/요인분석')
DNAtemper <- read.csv("동남아권 기온 2015-2018.csv",header=T)
DNAtemper

plot(DNAtemper$평균기온, DNAtemper$동남아권,
     xlab = "평균기온", ylab = "제주 관광객 수",
     col = "red", pch = 19)
plot(DNAtemper$평균기온, DNAtemper$싱가폴,
     xlab = "평균기온", ylab = "제주 관광객 수",
     col = "red", pch = 19)
plot(DNAtemper$평균기온, DNAtemper$말레이시아,
     xlab = "평균기온", ylab = "제주 관광객 수",
     col = "red", pch = 19)
plot(DNAtemper$평균기온, DNAtemper$인도네시아,
     xlab = "평균기온", ylab = "제주 관광객 수",
     col = "red", pch = 19)
plot(DNAtemper$평균기온, DNAtemper$베트남,
     xlab = "평균기온", ylab = "제주 관광객 수",
     col = "red", pch = 19)
# 회귀식 도출
res <- lm( DNAtemper$싱가폴~DNAtemper$평균기온, data = DNAtemper ) 
res

# 회귀선
abline( res )

# 상관계수 도출 (correlation)
cor( DNAtemper[ , c(2,7) ] )  # 다변량 상관 계수
cor( DNAtemper[ , c(3,7) ] )  # 다변량 상관 계수
cor( DNAtemper[ , c(4,7) ] )  # 다변량 상관 계수
cor( DNAtemper[ , c(5,7) ] )  # 다변량 상관 계수
cor( DNAtemper[ , c(6,7) ] )  # 다변량 상관 계수



### 15-18 관광 실태
## 연령대
## 성별
## 방문목적
## 여행 형태(개별, 패키지 등)
## 방문횟수


### 검색지, 주 방문지, 행선지, 방문지 선택이유 

### 관광 체류 기간, 숙박 일수

### 숙박장소

### 관광 만족도

### 여행 불만족 요인

### 주 교통수단
## 교통수단 만족도

### 관광 시 주요 소비

### 지자체 관광 투자

### 관광 사업 분류별 수

### 관광 사업체 매출액

### 1인당 지출 경비

### 국내인 관광 경비


