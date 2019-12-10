# 이  름 : 김신혁
# 작성일 : 191210
# 제출일 : 191211


# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
# 



# 문1)
# R에서 제공하는 state.x77 데이터셋을 차원 축소하여 2차원 산점도와 3
# 차원 산점도를 작성하시오. (state.x77은 매트릭스 타입이기 때문에 데이터프레임
#                 으로 변환하여 실습한다.)
#

library(Rtsne)
library(ggplot2)
df <- data.frame(state.x77)

# dup = which(duplicated(df))
# dup
# 
# df <- df[-dup,]

tsne <- Rtsne(df,
              dims = 2,
              perplexity = 6 )
df.tsne <- data.frame(tsne$Y)
ggplot(df.tsne,
       aes(x=X1, y=X2))+
  geom_point(size=2)


install.packages( c("rgl", "car") )
library(car)
library(rgl)
library(mgcv)
tsne <- Rtsne(df, dims=3, perplexity=6)
df.tsne <- data.frame(tsne$Y)
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

# 문2)
# R에서 제공하는 swiss 데이터셋을 차원 축소하여 2차원 산점도와 3차원
# 산점도를 작성하시오.
#


swissdf <- data.frame(swiss)
# dup <- which(duplicated(swissdf))
# dup
# swissdf <- swissdf[-dup,]

tsne <- Rtsne(swissdf, dims = 2, perplexity = 14)
swissdf.tsne <- data.frame(tsne$Y)
ggplot(swissdf.tsne, aes(x=X1, y=X2))+
  geom_point()
scatter3d(x=swissdf.tsne$X1,
          y=swissdf.tsne$X2,
          z=swissdf.tsne$X3)

# 문3) 
# R을 이용하여 지도를 출력하시오.
# (1) 서울시청을 중심으로 지도 크기는 600x600, 지도 유형은 roadmap인 지도를 출력
# 하시오.

library(ggmap)
register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' )
gc <- geocode(enc2utf8("서울시청"))
ngc <- as.numeric(gc)
map <- get_googlemap(center = ngc,
              zoom = 18,
              size = c(600,600),
              maptype = "roadmap")
ggmap(map)

# (2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8
# 인 지도를 출력하시오.
gc <- geocode(enc2utf8("금강산"))
ngc <- as.numeric(gc)
map <- get_googlemap(center = ngc,
                     zoom = 8,
                     size = c(500,500),
                     maptype = "hybrid")
ggmap(map)

# (3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지
# 도를 출력하시오.
gc <- geocode(enc2utf8("강남역"))
ngc <- as.numeric(gc)
map <- get_googlemap(center = ngc,
                     zoom = 16,
                     size = c(640,640),
                     maptype = "roadmap")
ggmap(map)

# (4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지
# 도를 출력하시오.
map <- get_googlemap(center = c(127.397692, 36.337058),
                     zoom = 9,
                     maptype = "roadmap")
ggmap(map)

# (5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의
# 지도를 출력하시오.
# 
ggmap( get_googlemap(center = c(135.502330,34.693594)) )





# 문4)
# R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
# 지도 위에 표시하시오.
# 

over_hanriver<- c("강서구청","양천구청","구로구청","영등포구청",
                  "금천구청","동작구청","관악구청","서초구청",
                  "강남구청","송파구청","강동구청")
gc <- geocode(enc2utf8(over_hanriver))

df <- data.frame(names = over_hanriver,lon = gc$lon, lat = gc$lat)

map <- get_googlemap(center = c(mean(df$lon), mean(df$lat)),
                     maptype = "roadmap",
                     markers = gc,
                     zoom = 11)
ggmap(map)+
  geom_text(data = df,
            mapping = aes(x=lon, y=lat),
            size = 5,
            label = df$names)


# 문5)
# R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 단, 마커와 광
# 역시 이름을 함께 표시하시오.
# 
city <- c("부산광역시", "대구광역시", "인천광역시",
          "광주광역시", "대전광역시", "울산광역시")
gc <- geocode(enc2utf8(city))
df <- data.frame(names = city, lon = gc$lon, lat = gc$lat)
map <- get_googlemap(center = c( mean(df$lon), mean(df$lat) ),
                     maptype = "roadmap",
                     markers = gc,
                     zoom = 7)
ggmap(map)+
  geom_text(data = df,
            mapping = aes(x=lon, y=lat),
            size = 5,
            label = df$names)

# 문6)
# R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로
# 시하되 국립공원의 이름을 함께 표시하시오.
# 
park <- c("서울국립공원", "경기국립공원", "강원국립공원")
gc <- geocode(enc2utf8(park))
df <- data.frame(names = park, lon=gc$lon, lat=gc$lat)
map <- get_googlemap(center = c(mean(df$lon), mean(df$lat)),
                     maptype = "roadmap",
                     markers = gc,
                     zoom = 8)
ggmap(map)+
  geom_text(data = df,
            mapping = aes(x=lon,y=lat),
            size=5,
            label= df$names)
# 문7) 
# ‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교
# 통사고 발생건수를 지도상에 원의 크기로 나타내시오.
# 

setwd("D:/work123/R_report")
seoul <- read.csv(file = "seoul.csv", header = TRUE, stringsAsFactors = FALSE)
seoul

gc <- geocode(enc2utf8(seoul$시군구))
df <- data.frame(names = seoul$시군구,
                 value = seoul$X2018,
                 lon = gc$lon,
                 lat = gc$lat)
map <- get_googlemap(center = c(mean(df$lon), mean(df$lat)),
                     maptype = "roadmap",
                     zoom = 11)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))

# 문8)
# 7번과 동일한 자료를 이용하여 제주시 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.

jeju <- read.csv(file = "jeju.csv", header = TRUE, stringsAsFactors = FALSE)
jeju

gc <- geocode(enc2utf8(jeju$시군구))
df <- data.frame(names = jeju$시군구,
                 value = jeju$X2018,
                 lon = gc$lon,
                 lat = gc$lat)
cen <- c( mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             aes(x = lon, y = lat, size = value),
             alpha = 0.5,
             col = "red") +
  scale_size_continuous( range = c(1,20) )
