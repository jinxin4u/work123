#
# 김신혁
# 작성일 : 191204
# 제출일 : 191205
#

# 문1)
# 다음과 같이 결측값이 포함된 데이터셋 ds를 생성한 후, 다음 문제를 해결
# 하기 위한 R 코드를 작성하시오.

# ds <- state.x77
# ds[2,3] <- NA; ds[3,1] <- NA; ds[2,4] <- NA; ds[4,3] <- NA

ds <- data.frame(state.x77)
ds[2,3] <- NA; ds[3,1] <- NA; ds[2,4] <- NA; ds[4,3] <- NA

# (1) 각 열별로 결측값이 몇 개인지 출력하시오.

apply(ds, 2, function(y) sum( is.na(y) ) )

# (2) 결측값이 포함된 행들의 데이터를 출력하시오.

ds[ !complete.cases(ds), ]

# (3) 결측값이 포함된 행은 몇 개인지 출력하시오.

sum( rowSums( is.na(ds) ) > 0 )

# (4) 결측값이 포함된 행들을 제외하고 새로운 데이터셋 ds.new를 만들어보시오.

ds.new <- ds[complete.cases(ds), ]
ds.new



# 문2)
# 다음과 같이 state.x77 데이터셋을 st에 저장한 후 다음 문제를 해결하기
# 위한 R 코드를 작성하시오.

# st <- data.frame(state.x77)

st <- data.frame(state.x77)

# (1) st의 각 변수(열)들에 대해 특이값이 존재하는지 상자그림을 그려 확인하시오.

str(st)
par( mfrow = c(2,4) )

for(i in 1:8){
  boxplot( st[,i], main = colnames(st)[i] )
}

par( mfrow = c(1,1) )
## Population, Income, Area 변수에서 Outlier 존재

# (2) 특이값이 존재하는 경우 이상치를 NA로 대체하여 저장하시오.
for (i in 1:8) {
  outlier <- boxplot.stats(st[,i])$out
  st[ st[,i] %in% outlier] <- NA
}
st
# st
# 
# outlier <- boxplot.stats(st[,1])$out
# st[,1][ st[,1] %in% outlier] <- NA
# st

# (3) st에서 NA가 존재하는 행들을 제거하여 st2에 저장하시오.

st2 <- st[complete.cases(st),]
st2



# 문3) 
# R에서 제공하는 airquality 데이터셋에 대해 다음의 문제를 해결하기 위한
# R 코드를 작성하시오.

# (1) airquality를 AQ에 저장하시오.

AQ <- data.frame(airquality)

# (2) AQ에서 열별로 NA의 개수를 출력하시오.

apply(AQ, 2, function(y) sum( is.na(y) ) )

# (3) AQ에서 행별로 NA의 개수를 출력하시오.

sum( rowSums( is.na(AQ) > 0 ) )

# (4) AQ에서 NA를 포함하지 않은 행들만 출력하시오.
AQ[ complete.cases(AQ), ]

# (5) AQ에서 NA를 NA가 속한 열의 평균값으로 치환하여 AQ2로 저장하고, AQ2의 내용을
# 출력하시오.	
AQ[!complete.cases(AQ), ]
mean.value <- apply( AQ[complete.cases(AQ), ], 2, mean )
mean.value

for(i in 1:6){
  AQ[ is.na(AQ[,i]), ] <- mean.value[i]
}


# 문4)
# R에서 제공하는 state.x77 데이터셋에 대하여 다음 문제를 해결하기 위한
# R 코드를 작성하시오.
# 
# (1) state.x77 데이터셋을 Population(인구수)를 기준으로 오름차순 정렬하시오.
library(dplyr)
head(state.x77)
st.df <- data.frame(state.x77)
st.df %>% arrange(Population) %>% 
  head

# (2) state.x77 데이터셋을 Income(소득)을 기준으로 내림차순 정렬하시오.


st.df %>% arrange( desc(Income) ) %>% 
  head

# (3) Illiteracy(문맹률)가 낮은 상위 10개 주의 이름과 문맹률을 출력하시오.	

st.df %>% select(Illiteracy) %>%
      arrange(Illiteracy) %>%
      head(10)

# 



# 문5)
# R에서 제공하는 mtcars 데이터셋에 대하여 다음 문제를 해결하기 위한 R
# 코드를 작성하시오.
# 
# (1) mtcars 데이터셋을 gear(기어)의 개수에 따라 그룹을 나누어 mt.gear에 저장하
# 시오.(단, split() 함수를 사용)
mt.gear <- split(mtcars,mtcars$gear)
mt.gear

# (2) mt.gear에서 gear(기어)의 개수가 4인 그룹의 데이터를 출력하시오.

mt.gear$`4`

# (3) mt.gear에서 gear(기어)의 개수가 3인 그룹과 5인 그룹의 데이터를 합쳐서
# mt.gear.35에 저장하고 내용을 출력하시오.

mt.gear.35 %>% bind_rows(mt.gear$`3`, mt.gear$`5`)

# (4) mtcars 데이터셋에서 wt(중량)가 1.5~3.0 사이인 행들을 추출하여 출력하시오.
# 

mtcars %>% filter( wt >= 1.5 & wt <= 3.0 )

# 문6)
# 다음의 문제를 해결하기 위한 R코드를 작성하시오.
# 
# 다음과 같이 데이터프레임 authors와 books를 생성하고 authors와 books의 내
# 용을 출력하시오.	
# 
authors <- data.frame( surname = c( "Twein", "Venables", "Tierney", "Ripley", "McNeil" ),
                        nationality = c( "US", "Australia", "US", "UK", "Australia" ),
                        retired = c( "yes", rep( "no", 4 ) ) )
books <- data.frame( name = c( "Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil" ),
                      title = c( "Exploratory Data Analysis", 
                                 "Modern Applied Statistics ...",
                                 "LISP-STAT",
                                 "Spatial Statistics", "Stochastic Simulation",
                                 "Interactive Data Analysis" ),
                      other.author = c( NA, "Ripley", NA, NA, NA, NA ) )
 
# (1) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하시오(두						   
#                                                        데이터프레임에서 공통 열의 값이 일치하는 것들만 병합).
anb.df <- merge(authors, books,
                by.x = c('surname'),
                by.y = c('name') )
anb.df

# (2) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되
# authors의 행들이 모두 표시되도록 하시오.

anb.df <- merge(authors, books,
                by.x = c('surname'),
                by.y = c('name'),
                all.x = TRUE)
anb.df

# (3) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되 books
# 의 행들은 모두 표시되도록 하시오.

anb.df <- merge(authors, books,
                by.x = c('surname'),
                by.y = c('name'),
                all.y = TRUE)
anb.df

# (4) surname과 other.author를 공통 열로 하여 authors와 books를 병합하여 출력하
# 시오.	

anb.df <- merge(authors, books,
                by.x = c('surname'),
                by.y = c('other.author') )
anb.df




