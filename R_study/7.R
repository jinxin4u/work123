######################################################################
#
# 191204 7일차
# 데이터 전처리
#

# vector의 결측치 처리

z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)
sum( is.na(z) )
sum( z, na.rm = TRUE )  # rm : remove -> 모든 산술연산함수에 내장

# 결측치 대체 및 제거 0
z1 <- z
z2 <- c(5,8,1,NA,3,NA,7)

  ### 단순대입법
z1[ is.na( z1 ) ] <- 0
z1
  ### Listwise delection
z3 <- as.vector( na.omit( z2 ) ) # omit : 생략
z3


# Matrix / Data Frame 결측치 처리
x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)

# Matrix / Data Frame 열별 결측치 확인
# case 1 : 반복문 이용
for(i in 1:ncol(x)){
  this.na <- is.na( x[,i] )
  cat( colnames(x)[i], '\t', sum(this.na), '\n' )
}
# case 2 : apply() 이용
col_na <- function( y ){
  return ( sum( is.na(y) )  )
}
na_cnt <- apply(x,2,col_na) # na_cnt <- apply(x,2,function(y) sum(is.na(y)) )     ## 익명 함수
na_cnt

barplot( na_cnt[ na_cnt > 0 ] )


################# 참고 #########################
install.packages('VIM')
require(VIM)

# 결측치 자료 조합 확인용 시각화 도구
aggr( x, prop = FALSE, numbers = TRUE )

# 두 개의 변수 간의 결측치 관계 확인 시각화 도구
marginplot( x[c('Sepal.Width','Sepal.Length')],
            pch = 20,
            col = c( 'darkgray', 'red', 'blue' ) )
#############################################


# Matrix / Data Frame의 행(data)별 결측치 확인
rowSums( is.na(x) )
sum( rowSums(is.na(x)) > 0 )

sum( is.na(x) )

# 결측치를 제외한 새로운 데이터셋 생성
  ##Listwise Delection
head(x)
x[ !complete.cases(x), ]  # NA가 포함된 행출력
y <- x[ complete.cases(x), ]
head(y)

# 특이값, 이상치( outlier )
st <- data.frame( state.x77 )
summary( st$Income )
boxplot( st$Income )
boxplot.stats( st$Income )$out

# 특이값 처리법 : NA로 변환 후 결측치 처리 방법 이용
out.val <- boxplot.stats( st$Income )$out
st$Income[ st$Income %in% out.val ] <- NA # %in% :포함 유무 확인 연산자
head(st)
newdata <- st[ complete.cases(st), ]
head(newdata)


###################################################################
#
# 데이터 가공
#
# 데이터 정렬
# Vector 정렬
v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1, decreasing = TRUE )
v2

# Matrix / Data Frame 정렬
head( iris )
order( iris$Sepal.Length )  # 정렬하면 나타날 순서를 표시
iris[ order(iris$Sepal.Length), ]                     #Ascending
iris[ order(iris$Sepal.Length, decreasing = TRUE), ]  #Decreasing

iris.new <- iris[ order( iris$Sepal.Length ), ]
head(iris.new)
iris[ order( iris$Species, decreasing = TRUE,
             iris$Sepal.Length ), ]                   # 정렬 기준 다중 설정

# 데이터 분리
sp <- split( iris, iris$Species ) # param2 를 기준으로 param1을 리스트 형식으로 나눔
                                  # split( param1, param2 )
sp
summary(sp)
summary(sp$setosa)
sp$setosa

# 데이터 선택
subset(iris, Species == 'setosa')
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width > 3.9 )
subset(iris, Sepal.Length > 7.6,
       select = c( Petal.Length, Petal.Width ) )

# 데이터 샘플링 : 모집단에서 데이터 일부를 추출
# 숫자를 임의로 추출(Vector)

x <- 1:100
y <- sample(x,size=10,replace = FALSE)#size: 뽑아낼 갯수, replace : 복원/비복원 추출
y

# 행 추출
idx <- sample( 1:nrow(iris), size=50, replace = FALSE)
iris.50 <- iris[idx, ]
dim(iris.50)
head(iris.50)


sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)

set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)


# 데이터 조합
combn( 1:5, 3 ) # combination param1 : 조합할 수의 범위, param2 : 선택갯수  ex)5C3

x = c('red','green','blue','black','white')
com <- combn(x,2)
com

for(i in 1:ncol(com) ){
  cat(com[,i], '\n')
}


# 데이터 집계 :     p1 : 집계 대상, by : 집계 기준, FUN : oper
agg <- aggregate( iris[,-5],
                  by = list(iris$Species),
                  FUN = mean )
agg

agg <- aggregate( iris[,-5],
                  by = list(iris$Species),
                  FUN = sd )
agg


head(mtcars)
agg <- aggregate( mtcars,
                  by = list( cyl = mtcars$cyl,
                             vs = mtcars$vs ),
                  FUN = max )
agg


# 데이터 병합
x <- data.frame( name = c('a','b','c'),
                 mat = c(90,80,40) )
y <- data.frame( name = c('a','b','d'),
                 korean = c(75,60,90) )
z <- merge( x, y, by = c('name') )
z

merge(x,y)
merge(x,y, all.x = TRUE)
merge(x,y, all.y = TRUE)
merge(x,y, all = TRUE)



x <- data.frame( name = c('a','b','c'),
                 mat = c(90,80,40) )
y <- data.frame( sname = c('a','b','d'),
                 korean = c(75,60,90) )

merge(x,y,by.x = c('name'),
          by.y = c('sname'))

#######
#
# dplyr package
# 데이터 가공시 사용하는 패키지
#
###############
#
# 참고 : 파이프 연산자 %>% [ctrl + shift + M]
#
#######
install.packages('dplyr')
library(dplyr)

df <- data.frame( var1 = c(1,2,1),
                  var2 = c(2,3,2) )
df
  # rename() : 이름변경
df <- rename(df, v1 = var1, v2 = var2)
df

  # 파생변수 추가
  # .. pipe에 연결 안됨.
df$sum <- df$v1 + df$v2
df

df[2,1] <- 5
df

  # filter() : '행' 추출

df <- data.fram7e(id = c(1,2,3,4,5,6),
                 class = c(1,1,1,1,2,2),
                 math = c(50,60,45,30,25,50),
                 eng = c(98,97,86,98,80,89),
                 sci = c(50,60,78,58,65,98))
df
  #  L pipe R  -> 방향으로 pipe를 여러개 붙일 수도 있다
df %>% filter(class == 1)
df %>% filter(class == 2)
df %>% filter(class != 1)
df %>% filter(class != 2)

df %>% filter(sci > 70)
df %>% filter(math < 50)

df %>% filter(class == 1 & math >= 50)
df %>% filter(math >= 50 | eng >= 90 )
df %>% filter(class %in% c(1,3,5) )
      # 데이터 프레임 형식으로 분리
class1 <- df %>% filter(class == 1)
class2 <- df %>% filter(class == 2)
class1
class2


# select() : 변수 추출
df %>% select(math)
df %>% select(sci)

df %>% select(class, math, sci)

df %>% select(-math)

# dplyr 함수 조합
df %>% 
  filter( class == 1 ) %>% 
  select( sci )

df %>% 
  select( id, sci ) %>% 
  head

df %>% 
  select( id, sci ) %>% 
  sum

df %>% 
  select( id, sci ) %>% 
  max

# arrange() : 정렬
df %>% arrange( sci )
df %>% arrange( desc(sci) )


# mutate() : 파생변수 추가
df %>% 
  mutate( total = math + eng + sci ) %>% 
  head

df %>% 
  mutate( total = math + eng + sci,
          average = (math + eng + sci)/3 ) %>% 
  head

df %>% 
  mutate( grade = ifelse( sci >= 60, 'pass', 'fail' ) ) %>% 
  head


df %>% 
  mutate( total = math + eng + sci,
          average = (math + eng + sci)/3 ) %>% 
  mutate( grade = ifelse(average >= 90, 'pass',
                         ifelse(average < 60, 'fail', 'normal') ) ) %>% 
  head

df %>% 
  mutate( total = math + eng + sci,
          average = (math + eng + sci)/3 ) %>% 
          arrange( desc(average) ) %>% 
  head


df.sort <- df %>% 
  mutate( total = math + eng + sci,
          average = (math + eng + sci)/3 ) %>% 
          arrange( desc(average) )

df.sort

# summarise() : 집단별 요약
# group_by() :  집단별 나누기
df %>% summarise( mean_math = mean(math))

df %>% 
  group_by(class) %>% 
  summarise( mean_math = mean(math),
             mean_eng = mean(eng),
             mean_sci = mean(sci),
             n = n() )  # n() : 빈도수 

install.packages('ggplot2')

str( ggplot2::mpg )
mpg <- data.frame( ggplot2::mpg )
dim(mpg)
str(mpg)
head(mpg)
View(mpg)

mpg %>% 
  group_by( manufacturer, drv ) %>% 
  summarise( mean_cty = mean(cty) ) %>% 
  head(10)

mpg %>% 
  group_by( manufacturer ) %>% 
  filter( class == 'suv') %>% 
  mutate( tot = (cty + hwy) / 2 ) %>% 
  summarise( mean_tot = mean(tot) ) %>% 
  arrange( desc( mean_tot ) ) %>% 
  head(5)

# 데이터 병합
  # left_join() : 가로로 합치기(변수 추가)
  # inner_join() :            "     
  # full_join() :             "     
  # bind_rows() : 세로로 합치기(Data 추가)
df1 <- data.frame( id = c(1,2,3,4,5),
                   midterm = c(60,80,70,90,85))
df2 <- data.frame( id = c(1,2,3,4,5),
                   final = c(60,80,70,90,85))
tot <- left_join(df1,df2, by='id')
tot

df1 <- data.frame( id = c(1,2,3),
                   address = c('서울','부산','제주'),
                   stringsAsFactors = F)
df2 <- data.frame( id = c(1,2,4),
                   gender = c('남','여','남') )
df1
df2

str(df1)

df_left <- left_join(df1,df2,by='id') # p1을 기준으로... p1 넣
df_left
df_inner <- inner_join(df1,df2,by='id') # merge와 같은 효과
df_inner
df_full <- full_join(df1,df2, by='id') # 다 합침
df_full

df1 <- data.frame( id = c(1,2,3,4,5),
                   test = c(60,80,70,90,85))
df2 <- data.frame( id = c(1,2,3,4,5),
                   test = c(60,80,70,90,85))
df_all <- bind_rows(df1, df2)
df_all


install.packages('psych') 
library(psych)

summary(mtcars)
describe(mtcars) # psych::describe : summary보다 더 자세한 정보를


install.packages('descr')
require(descr)

df <- data.frame( id = c(1,2,4),
                   gender = c('남','여','남') )

table( df$gender )
freq( df$gender, plot = F) # 도수분포표와 막대그래프를 동시에
freq( df$gender )

