# 이름 : 김신혁
# 작성일 : 191211
# 제출일 : 191212


# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
# 


# 문1)
# 20대 국회 개원 여·야 3당 대표 국회연설문에 대해 각각 워드클라우드를
# 작성하시오.
# 예제소스 파일은 ‘ex_10-1.txt’, ‘ex_10-2.txt’, ‘ex_10-3.txt’이다.

Sys.setenv('C:/Program Files/Java/jre1.8.0_231')

install.packages('wordcloud')
install.packages('wordcloud2')
install.packages('KoNPL')
install.packages('RColorBrewer')

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

setwd('D:/work123/R_report')
txt1 <- readLines('ex_10-1.txt', encoding = 'UTF-8')
txt2 <- readLines('ex_10-2.txt', encoding = 'UTF-8')
txt3 <- readLines('ex_10-3.txt', encoding = 'UTF-8')

txt1
txt2
txt3

buildDictionary(ext_dic = 'woorimalsam')
noun1 <- sapply(txt1, extractNoun, USE.NAMES = F)
noun2 <- sapply(txt2, extractNoun, USE.NAMES = F)
noun3 <- sapply(txt3, extractNoun, USE.NAMES = F)

vec_noun1 <- unlist(noun1)
vec_noun2 <- unlist(noun2)
vec_noun3 <- unlist(noun3)

tb_noun1 <- table(vec_noun1)
tb_noun2 <- table(vec_noun2)
tb_noun3 <- table(vec_noun3)


wordcloud2(data = tb_noun1)
wordcloud2(data = tb_noun2)
wordcloud2(data = tb_noun3)

# 
# 문2)
# 스티브 잡스의 스탠포드 대학 졸업식 연설문에 대해 워드클라우드를 작성
# 하시오.
# Tip. 예제소스 파일은 ‘ex_10-4.txt’이다.

txt <- readLines('ex_10-4.txt', encoding = 'UTF-8')
noun <- sapply(txt, extractNoun, USE.NAMES = F)
tb_noun <- table( unlist(noun) )
wordcloud2(tb_noun)

# 
# 문3) 
# 오바마 대통령의 데통령 당선 연설문에 대해 워드클라우드를 작성하시오
# Tip. 예제소스 파일은 ‘ex_10-5.txt’이다.

txt <- readLines('ex_10-5.txt', encoding = 'UTF-8')
noun <- sapply(txt, extractNoun, USE.NAMES = F)
tb_noun <- table( unlist(noun) )
wordcloud2(tb_noun)


