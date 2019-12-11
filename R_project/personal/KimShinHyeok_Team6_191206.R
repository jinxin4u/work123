#
# 김신혁
# 제출일 : 191205
# Project #1 - 제주 CCTV 현황 분석
#

# '인구대비 CCTV 수(CCTV 보급량)' 와 '범죄율' 상관관계 분석

# including library
install.packages('xlsx')
install.packages('rJava')
install.packages('dplyr')

library('rJava')
library('xlsx')
library('dplyr')

# Importing data set
setwd('D:/work123/R_Project/reference')
#setwd('C:/Rstudy/work123/R_project/reference')

Korea_Population <- read.csv(file = 'korea_population.csv',
                             header = TRUE,
                             stringsAsFactors = FALSE)
Korea_Population

# 데이터가 너무 많아서 행 결합 안됨
# Korea_CCTV <- data.frame()
# Korea_CCTV %>% bind_rows(cctv_Seoul, cctv_Busan, cctv_Daegu, cctv_Incheon,
#                           cctv_Gwangju, cctv_Daejeon, cctv_Ulsan, cctv_Saejong,
#                           cctv_Gyounggi, cctv_Gangwon, cctv_CNorth, cctv_CSouth,
#                           cctv_JNorth, cctv_JSouth, cctv_KNorth, cctv_KSouth,
#                           cctv_Jeju)
# 
# str(Korea_CCTV)


#############각지역별 cctv 설치수, 용도, 설치연월#################

# 서울CCTV
 cctv_Seoul <- read.csv( file = 'cctv_Seoul.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

str(cctv_Seoul)
# numeric and substr year, month
cctv_Seoul$설치년월.year <- as.numeric(substr(cctv_Seoul$설치년월,1,4))
cctv_Seoul$설치년월.month <- as.numeric(substr(cctv_Seoul$설치년월,6,7))


#######################################

# 부산CCTV
cctv_Busan <- read.csv( file = 'cctv_Busan.csv',
                        header = TRUE,
                        stringsAsFactors = FALSE)

str(cctv_Busan)
  # numeric and substr year, month
cctv_Busan$설치년월.year <- as.numeric(substr(cctv_Busan$설치년월,1,4))
cctv_Busan$설치년월.month <- as.numeric(substr(cctv_Busan$설치년월,6,7))


#######################################

# 대구CCTV
cctv_Daegu <- read.csv( file = 'cctv_Daegu.csv',
                        header = TRUE,
                        stringsAsFactors = FALSE)

  # numeric and substr year, month
cctv_Daegu$설치년월.year <- as.numeric(substr(cctv_Daegu$설치년월,1,4))
cctv_Daegu$설치년월.month <- as.numeric(substr(cctv_Daegu$설치년월,6,7))

#######################################

# 인천CCTV
cctv_Incheon <- read.csv( file = 'cctv_Incheon.csv',
                        header = TRUE,
                        stringsAsFactors = FALSE)

  # numeric and substr year, month
cctv_Incheon$설치년월.year <- as.numeric(substr(cctv_Incheon$설치년월,1,4))
cctv_Incheon$설치년월.month <- as.numeric(substr(cctv_Incheon$설치년월,6,7))


#######################################

# 광주CCTV
cctv_Gwangju <- read.csv( file = 'cctv_Gwangju.csv',
                          header = TRUE,
                          stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_Gwangju$설치년월.year <- as.numeric(substr(cctv_Gwangju$설치년월,1,4))
cctv_Gwangju$설치년월.month <- as.numeric(substr(cctv_Gwangju$설치년월,6,7))


#######################################

# 대전CCTV
cctv_Daejeon <- read.csv( file = 'cctv_Daejeon.csv',
                          header = TRUE,
                          stringsAsFactors = FALSE)
# numeric and substr year, month
cctv_Daejeon$설치년월.year <- as.numeric(substr(cctv_Daejeon$설치년월,1,4))
cctv_Daejeon$설치년월.month <- as.numeric(substr(cctv_Daejeon$설치년월,6,7))


#######################################

# 울산 CCTV
cctv_Ulsan <- read.csv( file = 'cctv_Ulsan.csv',
                          header = TRUE,
                          stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_Ulsan$설치년월.year <- as.numeric(substr(cctv_Ulsan$설치년월,1,4))
cctv_Ulsan$설치년월.month <- as.numeric(substr(cctv_Ulsan$설치년월,6,7))


#######################################

# 세종 CCTV
cctv_Saejong <- read.csv( file = 'cctv_Saejong.csv',
                        header = TRUE,
                        stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_Saejong$설치년월.year <- as.numeric(substr(cctv_Saejong$설치년월,1,4))
cctv_Saejong$설치년월.month <- as.numeric(substr(cctv_Saejong$설치년월,6,7))


#######################################

# 경기 CCTV
cctv_Gyounggi <- read.csv( file = 'cctv_Gyounggi.csv',
                          header = TRUE,
                          stringsAsFactors = FALSE)

str(cctv_Gyounggi)
# numeric and substr year, month
cctv_Gyounggi$설치년월.year <- as.numeric(substr(cctv_Gyounggi$설치년월,1,4))
cctv_Gyounggi$설치년월.month <- as.numeric(substr(cctv_Gyounggi$설치년월,6,7))

#######################################

# 강원 CCTV
cctv_Gangwon <- read.csv( file = 'cctv_Gangwon.csv',
                           header = TRUE,
                           stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_Gangwon$설치년월.year <- as.numeric(substr(cctv_Gangwon$설치년월,1,4))
cctv_Gangwon$설치년월.month <- as.numeric(substr(cctv_Gangwon$설치년월,6,7))

#######################################

# 충북 CCTV
cctv_CNorth <- read.csv( file = 'cctv_CNorth.csv',
                          header = TRUE,
                          stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_CNorth$설치년월.year <- as.numeric(substr(cctv_CNorth$설치년월,1,4))
cctv_CNorth$설치년월.month <- as.numeric(substr(cctv_CNorth$설치년월,6,7))

#######################################

# 충남 CCTV
cctv_CSouth <- read.csv( file = 'cctv_CSouth.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_CSouth$설치년월.year <- as.numeric(substr(cctv_CSouth$설치년월,1,4))
cctv_CSouth$설치년월.month <- as.numeric(substr(cctv_CSouth$설치년월,6,7))

#######################################

# 전북 CCTV
cctv_JNorth <- read.csv( file = 'cctv_JNorth.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

str(cctv_JNorth)
# numeric and substr year, month
cctv_JNorth$설치년월.year <- as.numeric(substr(cctv_JNorth$설치년월,1,4))
cctv_JNorth$설치년월.month <- as.numeric(substr(cctv_JNorth$설치년월,6,7))

#######################################

# 전남 CCTV
cctv_JSouth <- read.csv( file = 'cctv_JSouth.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

str(cctv_JSouth)
# numeric and substr year, month
cctv_JSouth$설치년월.year <- as.numeric(substr(cctv_JSouth$설치년월,1,4))
cctv_JSouth$설치년월.month <- as.numeric(substr(cctv_JSouth$설치년월,6,7))

#######################################

# 경북 CCTV
cctv_KNorth <- read.csv( file = 'cctv_KNorth.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_KNorth$설치년월.year <- as.numeric(substr(cctv_KNorth$설치년월,1,4))
cctv_KNorth$설치년월.month <- as.numeric(substr(cctv_KNorth$설치년월,6,7))

#######################################

# 경남 CCTV
cctv_KSouth <- read.csv( file = 'cctv_KSouth.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

# numeric and substr year, month
cctv_KSouth$설치년월.year <- as.numeric(substr(cctv_KSouth$설치년월,1,4))
cctv_KSouth$설치년월.month <- as.numeric(substr(cctv_KSouth$설치년월,6,7))


#######################################

# 제주 CCTV
cctv_Jeju <- read.csv( file = 'cctv_Jeju.csv',
                         header = TRUE,
                         stringsAsFactors = FALSE)

str(cctv_Jeju)
# numeric and substr year, month
cctv_Jeju$설치년월.year <- as.numeric(substr(cctv_Jeju$설치년월,1,4))
cctv_Jeju$설치년월.month <- as.numeric(substr(cctv_Jeju$설치년월,6,7))

########################################
# cctv현황별 이상치, 결측치 확인 및 처리

  #설치년도 기준 : 1990~2019
boxplot(cctv_Seoul$설치년월.year, main = '서울CCTV설치년도')  #일제시대
boxplot(cctv_Busan$설치년월.year, main = '부산CCTV설치년도')  #미래
boxplot(cctv_Daegu$설치년월.year, main = '대구CCTV설치년도')  #미래
boxplot(cctv_Incheon$설치년월.year, main = '인천CCTV설치년도')#미래
boxplot(cctv_Gwangju$설치년월.year, main = '광주CCTV설치년도')
boxplot(cctv_Daejeon$설치년월.year, main = '대전CCTV설치년도')
boxplot(cctv_Ulsan$설치년월.year, main = '울산CCTV설치년도')
boxplot(cctv_Saejong$설치년월.year, main = '세종CCTV설치년도')  # 연월일 기재되지 않음
boxplot(cctv_Gyounggi$설치년월.year, main = '경기CCTV설치년도') #미래
boxplot(cctv_Gangwon$설치년월.year, main = '강원CCTV설치년도') #일제강점기
boxplot(cctv_CNorth$설치년월.year, main = '충북CCTV설치년도')
boxplot(cctv_CSouth$설치년월.year, main = '충남CCTV설치년도') #미래
boxplot(cctv_JNorth$설치년월.year, main = '전북CCTV설치년도') #일제강점기
boxplot(cctv_JSouth$설치년월.year, main = '전남CCTV설치년도') #미래
boxplot(cctv_KNorth$설치년월.year, main = '경북CCTV설치년도') #미래 & 이승만하야시기
boxplot(cctv_KSouth$설치년월.year, main = '경남CCTV설치년도')
boxplot(cctv_Jeju$설치년월.year, main = '제주CCTV설치년도')



cctv_Seoul$설치년월.year[ cctv_Seoul$설치년월.year < 1990 | cctv_Seoul$설치년월.year > 2019 ] <- NA
cctv_Busan$설치년월.year[ cctv_Busan$설치년월.year < 1990 | cctv_Busan$설치년월.year > 2019 ] <- NA
cctv_Daegu$설치년월.year[ cctv_Daegu$설치년월.year < 1990 | cctv_Daegu$설치년월.year > 2019 ] <- NA
cctv_Incheon$설치년월.year[ cctv_Incheon$설치년월.year < 1990 | cctv_Incheon$설치년월.year > 2019 ] <- NA
cctv_Gyounggi$설치년월.year[ cctv_Gyounggi$설치년월.year < 1990 | cctv_Gyounggi$설치년월.year > 2019 ] <- NA
cctv_Gangwon$설치년월.year[ cctv_Gangwon$설치년월.year < 1990 | cctv_Gangwon$설치년월.year > 2019 ] <- NA
cctv_CSouth$설치년월.year[ cctv_CSouth$설치년월.year < 1990 | cctv_CSouth$설치년월.year > 2019 ] <- NA
cctv_JNorth$설치년월.year[ cctv_JNorth$설치년월.year < 1990 | cctv_JNorth$설치년월.year > 2019 ] <- NA
cctv_JSouth$설치년월.year[ cctv_JSouth$설치년월.year < 1990 | cctv_JSouth$설치년월.year > 2019 ] <- NA
cctv_KNorth$설치년월.year[ cctv_KNorth$설치년월.year < 1990 | cctv_KNorth$설치년월.year > 2019 ] <- NA
cctv_Jeju$설치년월.year[ cctv_Jeju$설치년월.year < 1990 | cctv_Jeju$설치년월.year > 2019 | cctv_Jeju = '' ] <- NA




# CCTV설치 갯수 이상치는 수정 X => 관할기관이름으로 묶여있어 해당 기관 활용 목적이 있기 판단했기 때문
boxplot(cctv_Seoul$카메라대수, main = '서울CCTV수' )
boxplot(cctv_Busan$카메라대수, main = '부산CCTV수' )
boxplot(cctv_Daegu$카메라대수, main = '대구CCTV수' )
boxplot(cctv_Incheon$카메라대수, main = '인천CCTV수' )
boxplot(cctv_Gwangju$카메라대수, main = '광주CCTV수' )
boxplot(cctv_Daejeon$카메라대수, main = '대전CCTV수' ) #100개? 대전 동구청 관할
boxplot(cctv_Ulsan$카메라대수, main = '울산CCTV수' )
boxplot(cctv_Saejong$카메라대수, main = '세종CCTV수' )
boxplot(cctv_Gyounggi$카메라대수, main = '경기CCTV수' )
boxplot(cctv_Gangwon$카메라대수, main = '강원CCTV수' )  #강원랜드 관할 983개, 100개 100개..
boxplot(cctv_CNorth$카메라대수, main = '충북CCTV수' )
boxplot(cctv_CSouth$카메라대수, main = '충남CCTV수' ) #300개? 충남도청주소인 것으로보아 도청서 직접관할하는 CCTV로 추정
boxplot(cctv_JNorth$카메라대수, main = '전북CCTV수' )
boxplot(cctv_JSouth$카메라대수, main = '전남CCTV수' )
boxplot(cctv_KNorth$카메라대수, main = '경북CCTV수' )
boxplot(cctv_KSouth$카메라대수, main = '경남CCTV수' )
boxplot(cctv_Jeju$카메라대수, main = '제주CCTV수' ) #이상치1개 : 제주 클린하우스(= 제주 전역 생활 쓰레기 수거지)


##################

# 지역별 인구대비 cctv 수 산출 -> '인구대비 공공 cctv 설치 지수'

Korea_Population$cctv_cnt <- c( sum(cctv_Seoul$카메라대수), sum(cctv_Busan$카메라대수), sum(cctv_Daegu$카메라대수), sum(cctv_Incheon$카메라대수),
                                sum(cctv_Gwangju$카메라대수), sum(cctv_Daejeon$카메라대수), sum(cctv_Ulsan$카메라대수), sum(cctv_Saejong$카메라대수),
                                sum(cctv_Gyounggi$카메라대수), sum(cctv_Gangwon$카메라대수), sum(cctv_CNorth$카메라대수), sum(cctv_CSouth$카메라대수),
                                sum(cctv_JNorth$카메라대수), sum(cctv_JSouth$카메라대수), sum(cctv_KNorth$카메라대수), sum(cctv_KSouth$카메라대수),
                                sum(cctv_Jeju$카메라대수))

Korea_Population <- Korea_Population %>%
  arrange( cctv_cnt )

barplot( Korea_Population$cctv_cnt,
         main = '지역별 공공 cctv 설치 수',
         names.arg = Korea_Population$지역,
         xlab = '지역', ylab = 'cctv 설치 수',
         border = NA)

Korea_Population <- Korea_Population %>%
  mutate( ratio = cctv_cnt / 인구 * 1000  ) %>%
  arrange( ratio )

barcolor = c('gray','red')[(Korea_Population$ratio > 15) + 1]
barplot( Korea_Population$ratio,
         main = '지역별 인구대비 공공 cctv 설치 지수',
         names.arg = Korea_Population$지역,
         xlab = '지역', ylab = 'CCTV설치수/인구*1000',
         col = barcolor, border = NA )


##################### 인구대비 cctv를 타지역보다 많이 설치하여 얻은 이득은 있나?
##################### 인구대비 범죄율
# CCTV의 기대효과 충족

# 교통법규부문

# 생활 안전

# 환경 보전

# 범죄 부문 12-17 x 년도 시계열 y 범죄수 추계 라인1 범죄수 라인2 CCTV 추가 설치 제주
Crim2017 <- read.csv(file = 'crim_area2017.csv', header = T)
Crim2016 <- read.csv(file = 'crim_area2016.csv', header = T)
# Crim2015 <- read.csv(file = 'crim_area2015.csv', header = T)
# Crim2014 <- read.csv(file = 'crim_area2014.csv', header = T)
# Crim2013 <- read.csv(file = 'crim_area2013.csv', header = T)
# Crim2012 <- read.csv(file = 'crim_area2012.csv', header = T)

cs2017 <- colSums(Crim2017[ , c( 3:ncol(Crim2017) ) ] )
cs2016 <- colSums(Crim2016[ , c( 3:ncol(Crim2016) ) ] )
# cs2015 <- colSums(Crim2015[ , c( 3:ncol(Crim2015) ) ] )
# cs2014 <- colSums(Crim2014[ , c( 3:ncol(Crim2014) ) ] )
# cs2013 <- colSums(Crim2013[ , c( 3:ncol(Crim2013) ) ] )
# cs2012 <- colSums(Crim2012[ , c( 3:ncol(Crim2012) ) ] )


barplot(cs2017)
barplot(cs2016)

crim_area <- data.frame()
crim_area <- crim_area %>% bind_rows(cs2017,cs2016)

rownames(crim_area) <- c(2017, 2016)

crim_area


#시계열 분석 : L1 -  연차별 범죄율 수, L2 - 연차별 CCTV 설치 수


# plot(year, , main = '연차별 범죄 수',
#      type = 'l', lty= 1, lwd = 1,
#      xlab = '연차', ylab = '범죄 수' ) 

# Crim_Evidence <- read.csv(file = 'evidence.csv', header = T, encoding = 'UTF-8')
# Crim_Evidence



