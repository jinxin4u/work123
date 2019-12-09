#
# 10일차
#

install.packages("tidyverse")
library(ggplot2)
library( tidyverse )

## ggplot은 레이어 형식으로 되어있다
## 함수 1개 당 하나의 레이어.

mpg
dim(mpg)
str(mpg)
head(mpg)
View(mpg)

ggplot( data = mpg ) +
  geom_line( mapping = aes ( x = displ, y = hwy ) )  #    '+' ggplot2용 함수 연결 연산자
                                                      # 기본문법 상 ggplot + 다른 함수 연결해서 쓰는 거


month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)

df <- data.frame( month, rain )
df

#막대그래프 기본
ggplot( df, aes( x= month, y= rain )) +
  geom_bar( stat = "identity",
            width = 0.7,
           fill = "steelblue" )+
  geom_text(aes(label=rain,
                vjust=0, hjust=0))
  

#막대그래프 응용
ggplot( df, aes( x= month, y= rain )) +
  geom_bar( stat = "identity",
            width = 0.7,
            fill = "steelblue" ) + 
  ggtitle("월별 강수량") +
  theme(plot.title = element_text( size = 25,
                                 face = "bold",
                                 colour = "steelblue")) +
  labs( x= "월", y= "강수량") +
  coord_flip()  # ggtitle : 제목, labs : xy레이블 축이름 지정, coord_flip : 그래프 가로로 전환 

#히스토그램
ggplot(iris, aes(x=Petal.Length)) +
  geom_histogram( binwidth = 0.1 ) # binwidth : 연속형데이터상에서 데이터 기준 정하는 변수



#히스토그램 응용
ggplot(iris, aes(x=Petal.Length, fill = Species, 
                 color = Species ) ) +
  geom_histogram( binwidth = 0.5, position = "dodge" ) +
  theme(legend.position = "right")  #  fill : 막대 채움색, color : 막대 경계색
                                    #  position : dodge 범례별로 각각 그리기
                                    #  legend.position : 범례 위치

#산점도
ggplot( data = iris, mapping = aes( x= Petal.Length,
                                    y= Petal.Width ) ) +
  geom_point()

#산점도 응용
ggplot( data = iris, mapping = aes( x= Petal.Length,
                                    y= Petal.Width,
                                    color = Species,
                                    shape = Species) ) +
  geom_point( size = 3 ) +
  ggtitle("꽃잎의 길이와 폭")+
  theme(plot.title = element_text(size = 25,
                                  face = "bold",
                                  colour = "red") ) # ggplot(shape = 점모양)

#상자수염
ggplot( data = iris, mapping = aes(y= Petal.Length))+
  geom_boxplot(fill="yellow",color="red")

#상자수염 응용
ggplot( data = iris, mapping = aes(y= Petal.Length,
                                   fill = Species))+
  geom_boxplot()

# 선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame( year, cnt )

ggplot(data = df, aes(x=year, y=cnt))+
  geom_line(col = "red")


### ggplot 작성 graph 꾸미기 (공통)
str(economics)
#사선
ggplot(economics, aes(x=date, y=psavert))+
  geom_line(col = "red") +
  geom_abline( intercept = 12.18671,
               slope = -0.0005444 )  # intercept : y절편값, slope : 기울기

#평행선
ggplot(economics, aes(x=date, y=psavert))+
  geom_line() +
  geom_hline(col="blue", yintercept = mean(economics$psavert))+
  geom_hline(col="red", yintercept = max(economics$psavert))+
  geom_hline(col="red", yintercept = min(economics$psavert))
  

#수직선
x_inter <- filter(economics,
                  psavert == min(economics$psavert))$date
ggplot(economics, aes(x=date, y=psavert))+
  geom_line(col="red") +
  geom_vline( xintercept = x_inter)

#텍스트 추가
ggplot(airquality, aes(x=Day, y= Temp))+
  geom_point()+
  geom_text(aes(label=Temp,
                vjust=-0.1,
                hjust=-0.1))

# 영역 지정 및 화살표 표시
ggplot( mtcars, aes(x=wt, y=mpg))+
  geom_point()+
  annotate("rect",
           xmin=3,
           xmax=4,
           ymin=12,
           ymax = 21,
           alpha = 0.5,
           fill = "skyblue")+
  annotate("segment", x=2.5,xend=3.7,y=10,yend = 17,color="red",arrow=arrow())+
  annotate("text", x= 2.5,y=10, label="point")



# treemap
install.packages("treemap")
library(treemap)  

data(GNI2014)
dim(GNI2014)
str(GNI2014)
head(GNI2014)
View(GNI2014)

treemap(GNI2014,
        index = c("continent", "iso3"),  # 계층구조
        vSize = "population",            # 타일 크기
        vColor = "GNI",                  # 타일 컬러
        type = "value",                  # 타일 컬러링 방법
        bg.labels = "yellow",            # 레이블 배경색
        title = "World's GNI" )          # 제목

st <- data.frame(state.x77)

st <- data.frame(st, stname = rownames(st))

treemap(st,
        index=c("stname"),
        vSize = "Area",
        vColor = "Income",
        type = "value",
        title = "미국 주별 수입")


# 산점도에 Bubble 추가 (Bubble chart)
symbols( st$Illiteracy, st$Murder,        # 원의 x,y좌표
         circles = st$Population,         # 원의 반지름
         inches = 0.3,                    # 원크기 조절
         fg = "white",                    # 원 테두리 색
         bg = "lightgray",                # 원 배경색
         lwd = 1.5,                       # 원 테두리 두께
         xlab = "rate of Illiteracy",     
         ylab = "crime(murder) rate",
         main = "Illiteracy and Crime" )
text( st$Illiteracy, st$Murder,           # 텍스트 출력 x,y좌표
      rownames(st),                       # 출력할 text
      cex = 0.6,                          # 폰트 사이즈
      col = "brown")                      # 폰트 컬러

# ggplot 이용 Bubble chart
# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Interactive version
p <- data %>%
  mutate(gdpPercap=round(gdpPercap,0)) %>%
  mutate(pop=round(pop/1000000,2)) %>%
  mutate(lifeExp=round(lifeExp,1)) %>%
  
  # Reorder countries to having big bubbles on top
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  
  # prepare text for tooltip
  mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
  
  # Classic ggplot
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp
