#
# break/next
#

sum <- 0
for(i in 1:10){
  sum <- sum + i
  if(i >= 5){
    break
  }
}
sum

sum <- 0
for (i in 1:10){
  if(i%%2 ==0) next
  sum <- sum + i
}
sum

#
# 산술 내장 함수
#
log( 10 ) + 5   #로그함수
log( 10, base = 2)
sqrt( 25 )      #제곱근
max(5,3,2)      #최대값
min(3,9,5)      #최소값
abs(-10)        #절대값
factorial(5)    #팩토리얼
sin(pi/2)       #삼각함수

#
# 사용자 정의 함수
#

mymax <- function(x, y) {
  num.max <- x
  if(y > num.max){
    num.max <- y
  }
  return(num.max)
}
mymax(10,15)

a <- 10
b <- 5
c <- 8
max <- mymax(a,b)
max <- mymax(max,c)
max


a <- scan()
b <- scan()
mymax(a,b)

#사용자 정의 함수 매개변수 초기값 설정
mydiv <- function(x,y=2){
  return(x/y)
}
mydiv(x=10, y=3)
mydiv(10,3)
mydiv(10)


#외부 파일에 있는 함수 호출
setwd("D:/workR")   #경로지정
source("mylib.R")   # Lib 파일 지정

#함수호출
my_max(10,5)
my_div(10,2)


#
# Vector 도입
#
a <- 10
b <- 5
c <- 8
d=1
e=2
f=3
g=100
h=5
i=6
max <- a
if(b>max) max<-b
if(c>max) max<-c
if(d>max) max<-d
if(e>max) max<-e
if(f>max) max<-f
if(g>max) max<-g
if(h>max) max<-h
if(i>max) max<-i
max

# Vector 사용
v<-c(10,5,8,1,2,3,100,5,6)
max<-v[1]
for(i in 2:length(v)){
  if(v[i]>max) max<-v[i]
}
max



#vector 생성
x <- c(1,2,3)
y <- c("a","b","c")
z <- c(TRUE,TRUE,FALSE,TRUE)
x; y; z

class(x); class(y); class(z)

w<-c(1,2,3,"a","b","c")
w
class(w)

v1 <- 50:90; v1
v2 <- c(1,2,3,50:90); v2

class(v1); class(v2)




v3 <- seq(1, 101, 3)
v4 <- seq(0.1, 1.0, 0.1)

v5 <- rep( 1, times = 5)
v6 <- rep( 1:5, times = 3)
v7 <- rep( c(1,5,9), times = 3)





# 벡터 원소값에 이름 지정
score <- c(90,85,70);     score;
names( score )
names( score ) <- c("HONG", "KIM", "LEE")
names( score )
score



# vector 원소 접근
score[1]
score[2]
score[3]
score["HONG"]
score["KIM"]
score["LEE"]
d <- c(1,4,3,7,8)
d[1]; d[2]; d[3]; d[4]; d[5]; d[6]

for(i in 1:length( score )){
  print( score[i])
}
score_names <- c("HONG", "KIM", "LEE")
for(i in 1:length(score)){
  print( score[ score_names[i] ])
}



# 벡터에서 여러 개의 값을 한번에 추출
d <- c(1,4,3,7,8)
d[ c(1,3,5) ]
d[ 1:3 ]
d[ seq(1,5,2) ]
d[ -2 ]
d[ -c(3:5) ]

GNP <- c( 2090, 2450, 960 );                  GNP
names( GNP ) <- c("Korea", "Japan", "Nepal"); GNP
GNP[1]
GNP["Korea"]
GNP[ c("Korea", "Nepal") ]


# 벡터 요소값 변경
v1 <- c(1,5,7,8,9);     v1
v1[2] <- 3;             v1
v1[c(2,5)] <- c(10,20); v1

# 벡터간 연산
x <- c(1,2,3)
y <- c(4,5,6)
x+y
x*y
z<-x+y
z

#벡터에적용가능한 함수
d <- c(10,20,30,40,50,60,70,80,90,100)
sum(d)                        #합계
sum(2*d)
length(d)                     #벡터의 요소 개수(길이)
mean(d[1:5])                  #평균
mean(d)
median(d[1:5])                #중간값
median(d)
max(d)                        #최대값
min(d)                        #최소값
sort(d)                       #정렬
sort(d,decreasing=FALSE)
sort(d,decreasing=TRUE)
range(d)                      #값의 범위(최소값-최대값)
var(d)                        #분산
sd(d)                         #표준편차

v <- sum(d) / length(d);   v

# 벡터에 논리 연산 적용
d >= 50
d[d>50]
sum(d>50)
sum(d[d>50])
d==50

cond <- d>50 & d<80;  cond
d[cond]

all(d>50)
any(d>50)

head(d)
tail(d)
head(d,3)
tail(d,3)



x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

w <- c(x,y);  w
union(x,y)      #합집합
intersect(x,y)  #교집합
setdiff(x,y)    #차집합
setequal(x,y)   #x,y에 동일 요소있는지 확인[같은 집합인지 확인]
setequal(x,z)

'''Factor형 : 범위형 type
ex) 성별 -> 남,녀
급 -> 초급,중급,고급
범위를 한정or지정시킨 형태
'''

#List
ds <- c(90,85,70,84)
my.info <- list(name="HONG", age=30, status=TRUE, score=ds)
my.info
my.info[1]
my.info[[1]]
my.info$name
my.info[[4]]
my.info[[4]][1]
my.info$score[3]

#Factor
bt <- c('A','B','B','O','AB', 'A')
bt.new <- factor(bt)
bt
bt.new
bt[5]
bt.new[5]
levels(bt.new)
as.integer(bt.new)
bt.new[7] <- 'B'
bt.new[8] <- 'C'
bt.new
1
