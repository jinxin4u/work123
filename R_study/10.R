#
# 워드클라우드(Word Cloud)
#

# 한글 워드클라우드 절차
# 1. JAVA 실행환경 구축
# 2. 자료 수집( TEXT 자료 )
#   2.1 text file 형태로 수집
#   2.2 web scraping을 이용하여 수집
# 3. 명사 추출


Sys.setenv( JAVA_HOME = 'C:/Program Files/Java/jre1.8.0_231')

#필요시 설치
install.packages("wordcloud")     # wordcloud
install.packages("wordcloud2")    # wordcloud 
install.packages("KoNLP")         # 한국어 처리
install.packages("RColorBrewer")  # 색상 선택

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

library(dplyr)
library(ggplot2)

setwd('D:/work123/R_study')
text <- readLines('mis_document.txt', encoding = 'UTF-8')
# 텍스트파일 읽을때 EOF \n 처리 되어있지않으면 오류날수도 있음
text

# '우리말씀' 한글 사전 로딩
buildDictionary( ext_dic = 'woorimalsam')
pal2 <- brewer.pal(8, 'Dark2')                    # 색상 팔레트 생성
noun <- sapply(text, extractNoun, USE.NAMES = F)  # sapply(데이터셋, 명사추출, 행이름추출)
noun

# 4. 추출된 단어(주로 명사)에 대한 빈도수 계산 및 시각화
noun2 <- unlist( noun ) #list -> vector 변환
wordcount <- table(noun2)
sort.noun <- sort(wordcount, decreasing = T)[1:10]
sort.noun
sort.noun <- sort.noun[-1]
barplot(sort.noun, names.arg = names(sort.noun),
        col = 'steelblue', main = '빈도수 높은 단어',
        ylab = '단어 빈도수')
