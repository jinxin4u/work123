## 숙박시설만족도-국적별
library(reshape2)
library(ggplot2)

setwd('D:/6-project/김신혁/191215/5. 관광만족도, 불만족요인/숙박시설만족도')
hotel <- read.csv("숙박시설만족도-국적별.csv", header=T)
hotel


hotel.df <- melt( hotel[, c("X","자연경관감상", "식도락.맛집여행.", "산.오름.올레길.트레킹",
                            "쇼핑", "박물관.테마공원.방문", "회의.업무.컨벤션.세미나",
                            "공연.축제.이벤트.참여", "해변활동.해수욕.등.","유흥.오락.경마",
                            "전통문화체험", "종교.순례활동", "영화.드라마촬영지.방문",
                            "역사.문화유적지.방문", "레포츠.승마..골프..ATV.등.",
                            "미용.온천.스파.마사지.","기타")], id = "X")

ggplot(liked.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )
## 숙박시설만족도-성별

## 숙박시설만족도-연령별 

## 숙박시설만족도-여행유형별