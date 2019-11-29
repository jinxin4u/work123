###############################
#
# R 프로그래밍 1일차
#
# first.R
#
# 작성자 : 김신혁
#
# 최초작성일 2019.11.26
#
###############################

print("Hello, world")

number <- 10
number2 = 100

number3 <- number

numberValue <- 1
str_value <- "R Language"
booleanvalue <- TRUE

numberValue <- "R Script"
numberValue <- 1

print( numberValue )
print( str_value )
print( booleanvalue )

cat( "Numeric number : ", numberValue, "\n" )
cat( "String : ", str_value, "\n" )
cat( "Boolean value : ", booleanvalue, "\n" )

numberValue <-  scan()
cat( "Numeric number : ", numberValue, "\n")

number1 <- 10
number2 <- 20
resultAdd <- number1 + number2
resultSub <- number1 - number2
resultMul <- number1 * number2
resultDiv <- number1 / number2
resultRem <- number1 %% number2
resultSec <- number1 ^ number2

print( resultAdd )
print( resultSub )
print( resultMul )
print( resultDiv )
print( resultRem )
print( resultSec )

number1 <-  0
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1

number2 <- 100
number1 <- number2 + 10
number1
number2

print( number1 + 10 * number2 / 2 )

number300 <- 10
number300 <- number300 + 10
number300

number301 <-  number300 * 2
number301


number1 <- 10.5
number2 <- 10
print( number1 > number2 )
print( number1 >= number2 )
print( number1 < number2 )
print( number1 <= number2 )
print( number1 == number2 )
print( number1 != number2 )

print( number1 > 10 & number2 > 10 )
print( number1 > 10 | number2 > 10)
print( !( number1 > 10 ) )

number <- 100
str <- "R Language"
result = number + str
print( result )

#
# 제어구조 - 선택구조
#
job.type <- 'A'

if(job.type == 'B'){
  bonus <- 200
} else {
    bonus <- 100
}

cat( "job type : ", job.type, "\t\tbonus : ", bonus)

job.type <- 'B'
if(job.type == 'A') bonus <- 200
cat( "job type : ", job.type, "\t\tbonus : ", bonus)


score <- 85

if(score >= 90 ){
  grade = 'A'
} else if(score >= 80){
  grade = 'B'
} else if(score >= 70){
  grade = 'C'
} else if(score >= 60){
  grade = 'D'
} else{
  grade <- 'F'
}

cat("score : ",score,"\t\tgrade : ", grade)


number <- 0
if(number != 0){
  if( number %% 2 != 0 ) cat("Number : ",number,"는 홀수이다")
  else cat("Number : ",number,"는 짝수이다")
} else {
  cat("Number : ",number,"는 0이다")
}




a <- 5
b <- 20

if ( a > 5 & b > 5 ){
  cat( a, " > 5 and ", b, " > 5 " )
} else {
  cat( a, " <= 5 or ", b, "<= 5 " )
}



a <- 10
b <- 20

if ( a > b ) {
  c <- a
} else {
  c <- b 
}
cat( "a = ", a, "\tb = ", b, "\tc = ", c)


c <- ifelse( a > b, a, b)
cat( "a = ", a, "\tb = ", b, "\tc = ", c)




a <- 10
b <- 8
c <- 5
cat("max는 ", max(a,b,c), "입니다")


#
# 반복구조
#
# for문
for(i in 1:10){
  print('*')
}

multiple = 2
for(i in 2:9){
  cat(multiple, ' X ', i, ' = ', multiple * i, '\n')
}

'''for(i in 2:9){
  for(j in 1:9){
    cat(i,)
  }
}'''

#while문
i <- 1
while( i <= 10 ){
  print(i)
  i <- i + 1
}

multiple <- 2
i <- 2
while(i <= 9){
  cat(multiple, 'X', i, '=', multiple * i,'\n')
  i = i + 1
}


param1 = 2
while(param1 < 10){
  param2 = 1
  while(param2 < 10){
    cat(param1,'x',param2,'=',param1*param2,'\n')
    param2 = param2 + 1
  }
  param1 = param1 + 1
}


for(i in 1:100){
  cat(i)
  if(i %% 10 == 0) cat('\n')
}

cnt <- 0
for(i in 1: 1000){
  if(i %% 3 == 0 | i %% 5 == 0){
    cat('\t',i)
    cnt <- cnt + 1
    if(cnt %% 10 == 0) cat('\n')
  }
}
cat(cnt)



