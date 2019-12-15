## 검색지역-티맵제주1월

library(ggmap)
register_google( key = 'AIzaSyCr-3JEJ5MoqOVW1qqeZIXM6KsxppbX6MY')

setwd("C:/Users/jinxi/OneDrive/Desktop/191215/3. 검색지역, 행선지, 행선지 선택이유")
jeju1 <- read.csv("티맵제주01.csv", header = TRUE, stringsAsFactors=FALSE)
jeju1
str(jeju1)
gc <- geocode(enc2utf8(jeju1$지명))
df <- data.frame(names = jeju1$지명,
                 value = jeju1$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

df[16,]$lon <- 126.659493
df[16,]$lat <- 33.549456
df[31,]$lon <- 126.692362
df[31,]$lat <- 33.549456
df[25,]$lon <- 126.916167
df[25,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))


## 검색지역-티맵제주2월
jeju2 <- read.csv("티맵제주02.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju2$지명))
df <- data.frame(names = jeju2$지명,
                 value = jeju2$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

df[18,]$lon <- 126.916167
df[18,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))



## 검색지역-티맵제주3월
jeju3 <- read.csv("티맵제주03.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju3$지명))
df <- data.frame(names = jeju3$지명,
                 value = jeju3$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)
#돌카롱
df[13,]$lon <- 126.659493
df[13,]$lat <- 33.426771
#맛나
df[23,]$lon <- 126.916167
df[23,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))


## 검색지역-티맵제주4월
jeju4 <- read.csv("티맵제주04.csv", header = TRUE, stringsAsFactors=FALSE)
jeju4
str(jeju4)
gc <- geocode(enc2utf8(jeju4$지명))

df <- data.frame(names = jeju4$지명,
                 value = jeju4$점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[12,]$lon <- 126.659493
df[12,]$lat <- 33.426771
#맛나
df[22,]$lon <- 126.916167
df[22,]$lat <- 33.449698
lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))



## 검색지역-티맵제주5월
jeju5 <- read.csv("티맵제주05.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju5$지명))
df <- data.frame(names = jeju5$지명,
                 value = jeju5$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[12,]$lon <- 126.659493
df[12,]$lat <- 33.426771
#맛나
df[20,]$lon <- 126.916167
df[20,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))



## 검색지역-티맵제주6월
jeju6 <- read.csv("티맵제주06.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju6$지명))
df <- data.frame(names = jeju6$지명,
                 value = jeju6$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[12,]$lon <- 126.659493
df[12,]$lat <- 33.426771
#맛나
df[22,]$lon <- 126.916167
df[22,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))




## 검색지역-티맵제주7월
jeju7 <- read.csv("티맵제주07.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju7$지명))
df <- data.frame(names = jeju7$지명,
                 value = jeju7$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[15,]$lon <- 126.659493
df[15,]$lat <- 33.426771
#맛나
df[24,]$lon <- 126.916167
df[24,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))



## 검색지역-티맵제주8월
jeju8 <- read.csv("티맵제주08.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju8$지명))
df <- data.frame(names = jeju8$지명,
                 value = jeju8$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[15,]$lon <- 126.659493
df[15,]$lat <- 33.426771
#맛나
df[23,]$lon <- 126.916167
df[23,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))



## 검색지역-티맵제주9월
jeju9 <- read.csv("티맵제주09.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju9$지명))
df <- data.frame(names = jeju9$지명,
                 value = jeju9$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[15,]$lon <- 126.659493
df[15,]$lat <- 33.426771
#맛나
df[24,]$lon <- 126.916167
df[24,]$lat <- 33.449698

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))



## 검색지역-티맵제주10월
jeju10 <- read.csv("티맵제주10.csv", header = TRUE, stringsAsFactors=FALSE)

gc <- geocode(enc2utf8(jeju10$지명))
df <- data.frame(names = jeju10$지명,
                 value = jeju10$검색점수,
                 lon = gc$lon,
                 lat = gc$lat)

#돌카롱
df[16,]$lon <- 126.659493
df[16,]$lat <- 33.426771
#맛나
df[25,]$lon <- 126.916167
df[25,]$lat <- 33.449698
#북촌에가면
df[31,]$lon <- 126.692362
df[31,]$lat <- 33.549456

lonmean <- mean(df$lon)
latmean <- mean(df$lat)

map <- get_googlemap(center = c(lonmean, latmean),
                     maptype = "roadmap",
                     zoom = 10)
ggmap(map)+
  geom_point(data = df,
             mapping = aes(x = df$lon, y= df$lat, size=df$value),
             alpha = 0.5, col = "red")+
  scale_size_continuous( range = c(1,15))

