## 여행만족활동-국내외 [2018 제주도]

library(ggplot2)
library(reshape2)

setwd('D:/6-project/김신혁/191215/5. 관광만족도, 불만족요인')
liked <- read.csv("여행만족활동-국내외.csv", header=T)
liked


liked.df <- melt( liked[, c("X","자연경관감상", "식도락.맛집여행.", "산.오름.올레길.트레킹",
                            "쇼핑", "박물관.테마공원.방문", "회의.업무.컨벤션.세미나",
                            "공연.축제.이벤트.참여", "해변활동.해수욕.등.","유흥.오락.경마",
                            "전통문화체험", "종교.순례활동", "영화.드라마촬영지.방문",
                            "역사.문화유적지.방문", "레포츠.승마..골프..ATV.등.",
                            "미용.온천.스파.마사지.","기타")], id = "X")

ggplot(liked.df)+
  geom_bar(aes(x = X, y=value, fill = variable),
           position = "fill", stat = "identity" )
