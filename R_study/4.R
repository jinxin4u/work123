# 191129
#
# Matrix 생성

z <- matrix( 1:20, nrow = 4 )
z

z <- matrix( 1:20, ncol = 4 )
z

z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

z <- matrix( 1:20, nrow = 4, ncol = 5, byrow = T )  # 행우선으로 채움
z



x <- 1:4
x
y <- 5:8
y
z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

m1 <- cbind( x, y ) # COL; 변수 기준으로 묶기
m1
m2 <- rbind( x, y ) # ROW; 관측치 기준으로 묶기
m2
m3 <- rbind( m2, x )
m3
m4 <- cbind( z, x )
m4



# matrix 에서 cell 값 추출
z
z[ 2, 3 ]
z[ 1, 4 ]
z[ 2, ]
z[ , 4 ]

z[ 2, 1:3 ]
z[ 1, c( 1, 2, 4 ) ]
z[ 1:2, ]
z[ , c( 1, 4 ) ]


# Matrix에서 행/열에 이름 지정
score <- matrix( c( 90, 85, 69, 78,
                    85, 96, 49, 95,
                    90, 80, 70, 70),
                 nrow = 4, ncol = 3 )

score
rownames( score ) <- c( "HONG", "KIM", "LEE", "YOO" )
colnames( score ) <- c( "ENG", "MAT", "SCI" )
score

score[ 'HONG', 'MAT' ]
score[ 'KIM', c( 'MAT', 'SCI' ) ]
score[ 'LEE', ]
score[ , 'ENG' ]

rownames( score )
colnames( score )
colnames( score )[ 2 ]


#Data Frame 생성
city <- c( 'SEOUL', 'TOKYO', 'WASHINGTON' )
rank <- c( 1, 3, 2 )
city.info <- data.frame( city, rank )
city.info

name <- c( 'HONG', 'KIM', 'LEE' )
age <- c( 22, 20, 25 )
gender <- factor( c('M', 'F', 'M') )
blood.type = factor( c( 'A', 'O', 'B') )
person.info <- data.frame( name, age, gender, blood.type )
person.info

person2.info <- data.frame( name = c( 'HONG', 'KIM', 'LEE' ),
                            age = c( 22, 20, 25 ),
                            gender = factor( c('M', 'F', 'M') ),
                            blood.type = factor( c( 'A', 'O', 'B') ) )
person2.info


city.info
city.info[ 1, 1 ]
city.info[ 1, ]
city.info[ , 1 ]
city.info[ city.info$city, ]
city.info[ , 'rank' ]

person.info
person.info$name
person.info[ person.info$name == 'HONG', ]
person.info[ person.info$name == 'HONG', c('name', 'age') ]

data()

iris

iris[ , c( 1:2 ) ]
iris[ , c( 1, 3, 5) ]
iris[ , c( 'Sepal.Length', 'Species') ]
iris[ 1:5, ];       iris[ 1:5, c( 1, 3 ) ]



#Matrix와 data frame에서 사용하는 함수
person.info
m3

dim( person.info )            ## demension
dim( iris )
nrow( person.info )
nrow( m3 )
ncol( person.info )
ncol( m3 )

head( iris )                  ## 앞 일부분 조회
tail( iris )                  ## 뒤 일부분 조회

str( iris )                   ## 자료구조 조회(자료타입,행열크기, 변수타입..)
str( city.info )
str( person.info )

iris[ , 5 ]
unique( iris[ , 5 ] )# 집합 원소 추출
table( iris[, 'Species' ] )             ### 데이터 조건부 카운트 조회
table( person.info[ , 'blood.type' ] )
table( person.info[ , 'gender' ] )


# Matrix / Data Frame 사용함수
# 행별/열별 합계와 평균 계산                                        #          row = 1, col = 2
colSums( iris[ , -5 ] );       apply( iris[ , 1:4 ], 2, sum )       # apply ( dataset, row|col, operation func )
colMeans( iris[ , -5 ] );      apply( iris[ , 1:4 ], 2, mean )
rowSums( iris[ , -5 ] );       apply( iris[ , -5 ], 2, sum )
rowMeans( iris[ , -5 ] );      apply( iris[ , -5 ], 2, mean )
apply( iris[ , -5], 2, median )

# 행/열 방향 전환
z <- matrix( 1:20, nrow = 4, ncol = 5 ); z
t( z )  # 행열 전환

# 조건에 맞는 행과 열의 값 추출(data frame만 가능)
IR.1 <- subset( iris, Species == 'setosa' );                     IR.1
IR.2 <- subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 );  IR.2
IR.2[ , c( 2, 4 ) ]

# Matrix/Data Frame 산술연산
a <- matrix( 1:20, 4, 5 );    a
b <- matrix( 21:40, 4, 5 );   b

2 * a
b - 5
2 * a + 3 * b

a + b
b - a
b / a
a * b


# Matrix / Data Frame 자료구조 확인 / 변환
class( iris );        str( iris )
class( state.x77 );   str( state.x77 )

is.matrix( iris )
is.data.frame( iris )
is.matrix( state.x77 )
is.data.frame( state.x77 )

st <- data.frame( state.x77 )
str(st)
head(st)
class(st)
dim(st)

iris.m <- as.matrix( iris[ , 1:4 ] )
head( iris.m )
class( iris.m )
str( iris.m )

head( st )
Population
attach( st )  # 자료구조 내부변수 직접 조회,사용할 수 있도록..
Population

detach( st )  # 해제
Population


#
# csv file 내용 읽기 
#
##파일읽기
setwd( 'D:/test/work123')
air <- read.csv( 'airquality.csv', header = T, encoding = 'UTF-8' )  # header 있는지 없는지는 데이터보고 구분할 것.

class( air )
dim( air )
str( air )
head( air )
tail( air )



name <- c( 'HONG', 'KIM', 'LEE' )
age <- c( 22, 20, 25 )
gender <- factor( c('M', 'F', 'M') )
blood.type = factor( c( 'A', 'O', 'B') )
person.info <- data.frame( name, age, gender, blood.type )
person.info

## 파일 쓰기
setwd( 'D:/test/work123')
write.csv( person.info, 'person_info.csv', row.names = F )



