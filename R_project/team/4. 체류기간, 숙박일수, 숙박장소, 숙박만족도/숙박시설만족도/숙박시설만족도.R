## 숙박시설만족도-국적별
library(reshape2)
library(ggplot2)

setwd('D:/work123/R_project/team/5. 관광만족도, 불만족요인/숙박시설만족도')
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
library(gridExtra)

setwd('D:/work123/R_project/team/5. 관광만족도, 불만족요인/숙박시설만족도')
hotel1 <- read.csv("숙박시설만족도-성별-시설상태.csv", header=T)
hotel2 <- read.csv("숙박시설만족도-성별-종사원친절도.csv", header=T)
hotel3 <- read.csv("숙박시설만족도-성별-시설이용편의성.csv", header=T)

hotel1.df <- melt( hotel1[, c("X","전혀그렇지않다", "그렇지않다","보통이다","그렇다","매우그렇다")], id = "X")
hotel2.df <- melt( hotel2[, c("X","전혀그렇지않다", "그렇지않다","보통이다","그렇다","매우그렇다")], id = "X")
hotel3.df <- melt( hotel3[, c("X","전혀그렇지않다", "그렇지않다","보통이다","그렇다","매우그렇다")], id = "X")

grid.arrange(
  ggplot(hotel1.df)+
    geom_bar(aes(x = X, y=value, fill = variable),
             position = "fill", stat = "identity" )+
             ggtitle("숙박시설만족도-성별-시설상태")+
             theme(legend.title = element_blank(), legend.position = 'none'),
  ggplot(hotel2.df)+
    geom_bar(aes(x = X, y=value, fill = variable),
             position = "fill", stat = "identity" )+
             ggtitle("숙박시설만족도-성별-종사원친절도")+
             theme(legend.title = element_blank(), legend.position = 'none'),
  ggplot(hotel3.df)+
    geom_bar(aes(x = X, y=value, fill = variable),
             position = "fill", stat = "identity" )+
             ggtitle("숙박시설만족도-성별-시설이용편의성")+
             theme(legend.title = element_blank(), legend.position = 'none'),
  nrow=1
)



## 숙박시설만족도-연령별 
setwd('D:/work123/R_project/team/5. 관광만족도, 불만족요인/숙박시설만족도')
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



## 숙박시설만족도-여행유형별
setwd('D:/work123/R_project/team/5. 관광만족도, 불만족요인/숙박시설만족도')
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